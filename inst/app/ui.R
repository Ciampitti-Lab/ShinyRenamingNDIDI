library(shiny)
library(bslib)
library(shinyjs)

ui <- page_fillable(
  theme = bs_theme(
    version = 5,
    bg = "#ffffff",
    fg = "#212529",
    primary = "#2E7D32",
    secondary = "#66BB6A",
    success = "#4CAF50",
    info = "#0288D1",
    warning = "#FF9800",
    danger = "#D32F2F",
    base_font = font_google("Roboto"),
    heading_font = font_google("Roboto Slab"),
    font_scale = 1.0
  ),
  
  useShinyjs(),
  
  tags$head(
    tags$style(HTML("
      .app-title {
        background: linear-gradient(135deg, #2E7D32 0%, #66BB6A 100%);
        color: white;
        padding: 30px;
        margin: -15px -15px 20px -15px;
        border-radius: 0 0 15px 15px;
        box-shadow: 0 4px 6px rgba(0,0,0,0.1);
      }
      
      .app-title h1 {
        margin: 0;
        font-size: 2.5rem;
        font-weight: 600;
        text-shadow: 2px 2px 4px rgba(0,0,0,0.2);
      }
      
      .app-title p {
        margin: 10px 0 0 0;
        font-size: 1.1rem;
        opacity: 0.95;
      }
      
      .card {
        border-radius: 12px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.08);
        border: 1px solid #e0e0e0;
        transition: all 0.3s ease;
        height: 100%;
      }
      
      .card:hover {
        box-shadow: 0 4px 12px rgba(0,0,0,0.12);
      }
      
      .card-header {
        background: linear-gradient(135deg, #f5f5f5 0%, #e8f5e9 100%);
        border-bottom: 2px solid #2E7D32;
        padding: 15px 20px;
        border-radius: 12px 12px 0 0 !important;
        font-weight: 600;
        font-size: 1.2rem;
        color: #2E7D32;
      }
      
      .card-body {
        padding: 25px;
      }
      
      .form-label {
        font-weight: 500;
        color: #424242;
        margin-bottom: 8px;
      }
      
      .form-control, .form-select {
        border-radius: 8px;
        border: 2px solid #e0e0e0;
        transition: all 0.3s ease;
        padding: 10px 15px;
      }
      
      .form-control:focus, .form-select:focus {
        border-color: #2E7D32;
        box-shadow: 0 0 0 0.2rem rgba(46, 125, 50, 0.15);
      }
      
      .btn-success {
        background: linear-gradient(135deg, #2E7D32 0%, #388E3C 100%);
        border: none;
        border-radius: 8px;
        padding: 12px 30px;
        font-weight: 600;
        font-size: 1.1rem;
        transition: all 0.3s ease;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
      }
      
      .btn-success:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        background: linear-gradient(135deg, #1B5E20 0%, #2E7D32 100%);
      }
      
      .btn-danger {
        background: linear-gradient(135deg, #D32F2F 0%, #E53935 100%);
        border: none;
        border-radius: 8px;
        padding: 12px 30px;
        font-weight: 600;
        font-size: 1.1rem;
        transition: all 0.3s ease;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
      }
      
      .btn-danger:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        background: linear-gradient(135deg, #B71C1C 0%, #D32F2F 100%);
      }
      
      .btn-warning {
        background: linear-gradient(135deg, #F57C00 0%, #FF9800 100%);
        border: none;
        border-radius: 8px;
        padding: 8px 20px;
        font-weight: 500;
        transition: all 0.3s ease;
        color: white;
      }
      
      .btn-warning:hover {
        transform: translateY(-1px);
        box-shadow: 0 2px 6px rgba(0,0,0,0.15);
        background: linear-gradient(135deg, #E65100 0%, #F57C00 100%);
        color: white;
      }
      
      .image-preview {
        border: 2px solid #e0e0e0;
        border-radius: 8px;
        padding: 15px;
        margin: 10px 0;
        background: #fafafa;
        transition: all 0.3s ease;
      }
      
      .image-preview:hover {
        border-color: #2E7D32;
        background: #f1f8f4;
      }
      
      .image-item {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 12px;
        margin: 8px 0;
        background: white;
        border-radius: 8px;
        border: 1px solid #e0e0e0;
        transition: all 0.2s ease;
      }
      
      .image-item:hover {
        box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        border-color: #2E7D32;
      }
      
      .image-thumbnail {
        width: 80px;
        height: 80px;
        object-fit: cover;
        border-radius: 6px;
        border: 2px solid #e0e0e0;
        margin-right: 15px;
      }
      
      .image-name {
        flex-grow: 1;
        font-weight: 500;
        color: #424242;
        word-break: break-word;
      }
      
      .upload-area {
        border: 3px dashed #2E7D32;
        border-radius: 12px;
        padding: 40px;
        text-align: center;
        background: linear-gradient(135deg, #f1f8f4 0%, #e8f5e9 100%);
        transition: all 0.3s ease;
        cursor: pointer;
      }
      
      .upload-area:hover {
        background: linear-gradient(135deg, #e8f5e9 0%, #c8e6c9 100%);
        border-color: #1B5E20;
      }
      
      .upload-icon {
        font-size: 3rem;
        color: #2E7D32;
        margin-bottom: 15px;
      }
      
      .progress {
        height: 30px;
        border-radius: 8px;
        margin: 20px 0;
        background-color: #e0e0e0;
      }
      
      .progress-bar {
        background: linear-gradient(90deg, #2E7D32 0%, #66BB6A 100%);
        font-weight: 600;
        font-size: 1rem;
        border-radius: 8px;
      }
      
      .status-message {
        padding: 15px 20px;
        border-radius: 8px;
        margin: 15px 0;
        font-weight: 500;
      }
      
      .status-success {
        background: #e8f5e9;
        color: #2E7D32;
        border-left: 4px solid #2E7D32;
      }
      
      .status-info {
        background: #e3f2fd;
        color: #0288D1;
        border-left: 4px solid #0288D1;
      }
      
      #file_input_progress {
        display: none;
      }
      
      .action-buttons {
        display: flex;
        gap: 15px;
        margin-top: 20px;
        justify-content: center;
        flex-wrap: wrap;
      }
      
      @media (max-width: 768px) {
        .app-title h1 {
          font-size: 1.8rem;
        }
        
        .action-buttons {
          flex-direction: column;
        }
        
        .btn-success, .btn-danger {
          width: 100%;
        }
      }
    "))
  ),
  
  div(class = "app-title",
    h1("🌱 Nutrient Deficiency Image Manager"),
    p("Standardized image renaming and compression for research")
  ),
  
  layout_columns(
    col_widths = c(5, 7),
    
    # Left Panel - Metadata Input
    card(
      card_header("📋 Image Metadata"),
      card_body(
        selectInput(
          "crop",
          label = div(class = "form-label", "Crop Type"),
          choices = c(
            "Select crop..." = "",
            "Corn" = "corn",
            "Soybean" = "soybean",
            "Wheat" = "wheat",
            "Rice" = "rice",
            "Sorghum" = "sorghum",
            "Cotton" = "cotton",
            "Sunflower" = "sunflower",
            "Canola" = "canola"
          ),
          width = "100%"
        ),
        
        selectInput(
          "deficiency",
          label = div(class = "form-label", "Nutrient Deficiency"),
          choices = c(
            "Select deficiency..." = "",
            "Nitrogen (N)" = "nitrogen",
            "Phosphorus (P)" = "phosphorus",
            "Potassium (K)" = "potassium",
            "Sulfur (S)" = "sulfur",
            "Magnesium (Mg)" = "magnesium",
            "Calcium (Ca)" = "calcium",
            "Iron (Fe)" = "iron",
            "Manganese (Mn)" = "manganese",
            "Zinc (Zn)" = "zinc",
            "Boron (B)" = "boron",
            "Copper (Cu)" = "copper",
            "Molybdenum (Mo)" = "molybdenum",
            "Control" = "control"
          ),
          width = "100%"
        ),
        
        selectInput(
          "pheno_stage",
          label = div(class = "form-label", "Phenological Stage"),
          choices = c(
            "Select stage..." = "",
            "Vegetative Early (V1-V3)" = "VE",
            "Vegetative Mid (V4-V6)" = "VM",
            "Vegetative Late (V7-VT)" = "VL",
            "Reproductive Early (R1-R2)" = "RE",
            "Reproductive Mid (R3-R4)" = "RM",
            "Reproductive Late (R5-R6)" = "RL",
            "Maturity" = "MAT"
          ),
          width = "100%"
        ),
        
        selectInput(
          "def_stage",
          label = div(class = "form-label", "Deficiency Stage"),
          choices = c(
            "Select severity..." = "",
            "None/Control" = "none",
            "Mild" = "mild",
            "Moderate" = "moderate",
            "Severe" = "severe"
          ),
          width = "100%"
        ),
        
        textInput(
          "user_name",
          label = div(class = "form-label", "Your Name"),
          placeholder = "Enter your name...",
          width = "100%"
        ),
        
        hr(),
        
        div(class = "upload-area",
          div(class = "upload-icon", "📤"),
          fileInput(
            "images",
            label = NULL,
            multiple = TRUE,
            accept = c("image/png", "image/jpeg", "image/jpg", "image/tiff", "image/bmp"),
            buttonLabel = "Choose Images",
            placeholder = "Drag & drop images here or click to browse"
          )
        )
      )
    ),
    
    # Right Panel - Image Preview and Actions
    card(
      card_header("🖼️ Uploaded Images"),
      card_body(
        uiOutput("image_count"),
        hr(),
        div(
          style = "max-height: 500px; overflow-y: auto;",
          uiOutput("image_list")
        ),
        div(class = "action-buttons",
          downloadButton(
            "process_download",
            label = "✓ Process & Download",
            class = "btn-success btn-lg",
            icon = icon("download")
          ),
          actionButton(
            "clear",
            label = "↻ Clear All",
            class = "btn-danger btn-lg",
            icon = icon("trash")
          )
        ),
        uiOutput("status_message")
      )
    )
  )
)
