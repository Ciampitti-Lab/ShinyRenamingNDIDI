library(shiny)
library(shinyjs)
library(tools)
library(zip)

server <- function(input, output, session) {
  
  # Reactive value to store uploaded images info (current batch)
  images_data <- reactiveVal(list())
  
  # Reactive value to store all batches
  batches_data <- reactiveVal(list())
  
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
  
  # Display image count for current upload
  output$image_count <- renderUI({
    img_count <- length(images_data())
    batch_count <- length(batches_data())
    
    if (img_count == 0 && batch_count == 0) {
      div(class = "status-message status-info",
        "📁 No images uploaded yet. Please select images to begin."
      )
    } else if (img_count > 0 && batch_count == 0) {
      div(class = "status-message status-success",
        sprintf("✓ %d image%s ready - Click 'Add to Batch' to save with current settings", 
                img_count, ifelse(img_count > 1, "s", ""))
      )
    } else if (img_count == 0 && batch_count > 0) {
      div(class = "status-message status-success",
        sprintf("✓ %d batch%s saved - Add more or download when ready", 
                batch_count, ifelse(batch_count > 1, "es", ""))
      )
    } else {
      div(class = "status-message status-success",
        sprintf("✓ %d image%s ready, %d batch%s saved", 
                img_count, ifelse(img_count > 1, "s", ""),
                batch_count, ifelse(batch_count > 1, "es", ""))
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
  
  # Remove individual image from current upload
  observeEvent(input$remove_image, {
    req(input$remove_image)
    
    imgs <- images_data()
    imgs[[input$remove_image]] <- NULL
    images_data(imgs)
  })
  
  # Add current images to batch
  observeEvent(input$add_batch, {
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
    
    # Create batch
    batch_id <- paste0("batch_", as.numeric(Sys.time()) * 1000)
    current_batches <- batches_data()
    
    current_batches[[batch_id]] <- list(
      id = batch_id,
      crop = input$crop,
      deficiency = input$deficiency,
      pheno_stage = input$pheno_stage,
      def_stage = input$def_stage,
      user_name = input$user_name,
      images = imgs,
      timestamp = Sys.time()
    )
    
    batches_data(current_batches)
    
    # Clear current images
    images_data(list())
    shinyjs::reset("images")
    
    # Show success message
    output$status_message <- renderUI({
      div(class = "status-message status-success",
        sprintf("✓ Batch added! %d image%s saved with settings: %s/%s/%s/%s", 
                length(imgs), ifelse(length(imgs) > 1, "s", ""),
                input$crop, input$deficiency, input$pheno_stage, input$def_stage)
      )
    })
  })
  
  # Display all batches
  output$batch_list <- renderUI({
    batches <- batches_data()
    
    if (length(batches) == 0) {
      return(div(
        style = "text-align: center; padding: 40px; color: #999;",
        p(style = "font-size: 3rem;", "📦"),
        p("No batches saved yet. Add images and click 'Add to Batch'")
      ))
    }
    
    # Create list of batch items
    batch_items <- lapply(names(batches), function(batch_id) {
      batch <- batches[[batch_id]]
      img_count <- length(batch$images)
      
      # Calculate total size
      total_size <- sum(sapply(batch$images, function(img) img$size))
      size_mb <- round(total_size / 1024 / 1024, 2)
      size_text <- if (size_mb < 1) {
        paste0(round(total_size / 1024, 0), " KB")
      } else {
        paste0(size_mb, " MB")
      }
      
      div(class = "batch-item",
        div(class = "batch-info",
          strong(sprintf("Batch %d: %s → %s", 
                        which(names(batches) == batch_id),
                        batch$crop,
                        batch$deficiency)),
          br(),
          span(style = "color: #757575; font-size: 0.9rem;",
            sprintf("%d image%s • %s • Stage: %s/%s • User: %s",
                   img_count, ifelse(img_count > 1, "s", ""),
                   size_text,
                   batch$pheno_stage,
                   batch$def_stage,
                   batch$user_name)
          )
        ),
        actionButton(
          paste0("remove_batch_", batch_id),
          "Remove",
          class = "btn-warning btn-sm",
          onclick = sprintf("Shiny.setInputValue('remove_batch', '%s', {priority: 'event'})", batch_id)
        )
      )
    })
    
    tagList(batch_items)
  })
  
  # Remove individual batch
  observeEvent(input$remove_batch, {
    req(input$remove_batch)
    
    batches <- batches_data()
    batches[[input$remove_batch]] <- NULL
    batches_data(batches)
    
    output$status_message <- renderUI({
      div(class = "status-message status-info",
        "✓ Batch removed."
      )
    })
  })
  
  # Clear all images and batches
  observeEvent(input$clear, {
    images_data(list())
    batches_data(list())
    
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
  
  # Combined process and download handler for all batches
  output$process_download <- downloadHandler(
    filename = function() {
      batches <- batches_data()
      
      if (length(batches) == 0) {
        showModal(modalDialog(
          title = "No Batches",
          "Please add at least one batch of images before downloading.",
          easyClose = TRUE,
          footer = modalButton("OK")
        ))
        return(NULL)
      }
      
      # Use first batch's user name for ZIP filename
      first_batch <- batches[[1]]
      clean_user_name <- gsub("[^a-zA-Z0-9]", "", first_batch$user_name)
      sprintf("NDIDI_Images_%s_%s.zip", clean_user_name, format(Sys.time(), "%Y%m%d_%H%M%S"))
    },
    content = function(file) {
      batches <- batches_data()
      temp_dir <- tempfile()
      dir.create(temp_dir)
      
      tryCatch({
        # Process each batch
        for (batch_id in names(batches)) {
          batch <- batches[[batch_id]]
          
          # Process each image in the batch
          for (img_id in names(batch$images)) {
            img <- batch$images[[img_id]]
            
            ext <- tolower(file_ext(img$name))
            if (ext == "") ext <- "jpg"
            
            clean_user_name <- gsub("[^a-zA-Z0-9]", "", batch$user_name)
            original_name_no_ext <- file_path_sans_ext(img$name)
            clean_original_name <- gsub("[^a-zA-Z0-9]", "_", original_name_no_ext)
            
            new_filename <- sprintf(
              "%s_%s_%s_%s_%s_%s.%s",
              batch$crop,
              batch$deficiency,
              batch$pheno_stage,
              batch$def_stage,
              clean_user_name,
              clean_original_name,
              ext
            )
            
            new_path <- file.path(temp_dir, new_filename)
            file.copy(img$datapath, new_path)
          }
        }
        
        files_to_zip <- list.files(temp_dir, full.names = TRUE)
        zip::zip(
          zipfile = file,
          files = files_to_zip,
          mode = "cherry-pick"
        )
        
        unlink(temp_dir, recursive = TRUE)
        
      }, error = function(e) {
        unlink(temp_dir, recursive = TRUE)
        stop(e)
      })
    },
    contentType = "application/zip"
  )
  
  # Status message output
  output$status_message <- renderUI({
    NULL
  })
}
