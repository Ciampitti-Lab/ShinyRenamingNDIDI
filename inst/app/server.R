library(shiny)
library(shinyjs)
library(tools)
library(zip)

server <- function(input, output, session) {
  
  # Reactive value to store uploaded images info
  images_data <- reactiveVal(list())
  
  # Observe file uploads
  observeEvent(input$images, {
    req(input$images)
    
    # Get current images
    current_images <- images_data()
    
    # Add new images
    new_images <- input$images
    for (i in seq_len(nrow(new_images))) {
      # Create unique ID for each image
      img_id <- paste0("img_", as.numeric(Sys.time()) * 1000 + i)
      
      current_images[[img_id]] <- list(
        id = img_id,
        name = new_images$name[i],
        size = new_images$size[i],
        type = new_images$type[i],
        datapath = new_images$datapath[i]
      )
    }
    
    images_data(current_images)
  })
  
  # Display image count
  output$image_count <- renderUI({
    img_count <- length(images_data())
    
    if (img_count == 0) {
      div(class = "status-message status-info",
        "📁 No images uploaded yet. Please select images to begin."
      )
    } else {
      div(class = "status-message status-success",
        sprintf("✓ %d image%s ready for processing", img_count, ifelse(img_count > 1, "s", ""))
      )
    }
  })
  
  # Display list of uploaded images
  output$image_list <- renderUI({
    imgs <- images_data()
    
    if (length(imgs) == 0) {
      return(div(
        style = "text-align: center; padding: 40px; color: #999;",
        p(style = "font-size: 3rem;", "📷"),
        p("Upload images using the panel on the left")
      ))
    }
    
    # Create list of image items
    image_items <- lapply(names(imgs), function(img_id) {
      img <- imgs[[img_id]]
      
      # Format file size
      size_mb <- round(img$size / 1024 / 1024, 2)
      size_text <- if (size_mb < 1) {
        paste0(round(img$size / 1024, 0), " KB")
      } else {
        paste0(size_mb, " MB")
      }
      
      # Create thumbnail preview
      thumbnail <- tryCatch({
        img_data <- readBin(img$datapath, "raw", n = img$size)
        img_base64 <- base64enc::base64encode(img_data)
        ext <- tolower(file_ext(img$name))
        mime_type <- switch(ext,
          "jpg" = "image/jpeg",
          "jpeg" = "image/jpeg",
          "png" = "image/png",
          "tiff" = "image/tiff",
          "tif" = "image/tiff",
          "bmp" = "image/bmp",
          "image/jpeg"
        )
        tags$img(
          src = sprintf("data:%s;base64,%s", mime_type, img_base64),
          class = "image-thumbnail"
        )
      }, error = function(e) {
        div(class = "image-thumbnail", style = "display: flex; align-items: center; justify-content: center; background: #f5f5f5;", "📷")
      })
      
      div(class = "image-item",
        thumbnail,
        div(class = "image-name",
          strong(img$name),
          br(),
          span(style = "color: #757575; font-size: 0.9rem;", size_text)
        ),
        actionButton(
          paste0("remove_", img_id),
          "Remove",
          class = "btn-warning btn-sm",
          onclick = sprintf("Shiny.setInputValue('remove_image', '%s', {priority: 'event'})", img_id)
        )
      )
    })
    
    tagList(image_items)
  })
  
  # Remove individual image
  observeEvent(input$remove_image, {
    req(input$remove_image)
    
    imgs <- images_data()
    imgs[[input$remove_image]] <- NULL
    images_data(imgs)
  })
  
  # Clear all images
  observeEvent(input$clear, {
    images_data(list())
    
    # Reset all inputs
    updateSelectInput(session, "crop", selected = "")
    updateSelectInput(session, "deficiency", selected = "")
    updateSelectInput(session, "pheno_stage", selected = "")
    updateSelectInput(session, "def_stage", selected = "")
    updateTextInput(session, "user_name", value = "")
    
    # Clear file input by resetting it
    shinyjs::reset("images")
    
    output$status_message <- renderUI({
      div(class = "status-message status-info",
        "✓ All data cleared. Ready for new upload."
      )
    })
  })
  
  # Process and download images
  observeEvent(input$process, {
    # Validate inputs
    if (input$crop == "") {
      showModal(modalDialog(
        title = "Missing Information",
        "Please select a crop type.",
        easyClose = TRUE,
        footer = modalButton("OK")
      ))
      return()
    }
    
    if (input$deficiency == "") {
      showModal(modalDialog(
        title = "Missing Information",
        "Please select a nutrient deficiency.",
        easyClose = TRUE,
        footer = modalButton("OK")
      ))
      return()
    }
    
    if (input$pheno_stage == "") {
      showModal(modalDialog(
        title = "Missing Information",
        "Please select a phenological stage.",
        easyClose = TRUE,
        footer = modalButton("OK")
      ))
      return()
    }
    
    if (input$def_stage == "") {
      showModal(modalDialog(
        title = "Missing Information",
        "Please select a deficiency stage.",
        easyClose = TRUE,
        footer = modalButton("OK")
      ))
      return()
    }
    
    if (input$user_name == "") {
      showModal(modalDialog(
        title = "Missing Information",
        "Please enter your name.",
        easyClose = TRUE,
        footer = modalButton("OK")
      ))
      return()
    }
    
    imgs <- images_data()
    if (length(imgs) == 0) {
      showModal(modalDialog(
        title = "No Images",
        "Please upload at least one image.",
        easyClose = TRUE,
        footer = modalButton("OK")
      ))
      return()
    }
    
    # Show processing message
    output$status_message <- renderUI({
      div(class = "status-message status-info",
        "⏳ Processing images... Please wait."
      )
    })
    
    # Create temporary directory for processed images
    temp_dir <- tempfile()
    dir.create(temp_dir)
    
    tryCatch({
      # Process each image
      for (img_id in names(imgs)) {
        img <- imgs[[img_id]]
        
        # Get file extension
        ext <- tolower(file_ext(img$name))
        if (ext == "") ext <- "jpg"
        
        # Create new filename
        # Format: crop_deficiency_phenologicalStage_deficiencyStage_userName_originalName.ext
        clean_user_name <- gsub("[^a-zA-Z0-9]", "", input$user_name)
        original_name_no_ext <- file_path_sans_ext(img$name)
        clean_original_name <- gsub("[^a-zA-Z0-9]", "_", original_name_no_ext)
        
        new_filename <- sprintf(
          "%s_%s_%s_%s_%s_%s.%s",
          input$crop,
          input$deficiency,
          input$pheno_stage,
          input$def_stage,
          clean_user_name,
          clean_original_name,
          ext
        )
        
        # Copy file to temp directory with new name
        new_path <- file.path(temp_dir, new_filename)
        file.copy(img$datapath, new_path)
      }
      
      # Create ZIP file name
      clean_user_name <- gsub("[^a-zA-Z0-9]", "", input$user_name)
      zip_filename <- sprintf(
        "%s_%s_%s.zip",
        input$crop,
        input$deficiency,
        clean_user_name
      )
      
      zip_path <- file.path(tempdir(), zip_filename)
      
      # Create ZIP file
      files_to_zip <- list.files(temp_dir, full.names = TRUE)
      zip::zip(
        zipfile = zip_path,
        files = files_to_zip,
        mode = "cherry-pick"
      )
      
      # Trigger download
      output$download_zip <- downloadHandler(
        filename = function() {
          zip_filename
        },
        content = function(file) {
          file.copy(zip_path, file)
        },
        contentType = "application/zip"
      )
      
      # Trigger the download
      shinyjs::runjs(sprintf("document.getElementById('%s').click();", "download_zip"))
      
      # Show success message
      output$status_message <- renderUI({
        div(class = "status-message status-success",
          sprintf("✓ Successfully processed %d image%s! Download should start automatically.", 
                  length(imgs), ifelse(length(imgs) > 1, "s", ""))
        )
      })
      
      # Clean up temp directory
      unlink(temp_dir, recursive = TRUE)
      
    }, error = function(e) {
      # Show error message
      output$status_message <- renderUI({
        div(class = "status-message",
          style = "background: #ffebee; color: #c62828; border-left: 4px solid #c62828;",
          sprintf("✗ Error processing images: %s", e$message)
        )
      })
      
      # Clean up temp directory
      unlink(temp_dir, recursive = TRUE)
    })
  })
  
  # Hidden download button
  output$download_zip <- downloadHandler(
    filename = function() {
      "images.zip"
    },
    content = function(file) {
      # This will be overwritten by the process handler
    }
  )
  
  # Status message output
  output$status_message <- renderUI({
    NULL
  })
}
