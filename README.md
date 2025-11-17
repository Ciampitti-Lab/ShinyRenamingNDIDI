# 🌱 ShinyRenamingNDIDI

**Nutrient Deficiency Image Manager** - A beautiful Shiny application for standardized renaming and compression of research images.

[![R Package](https://img.shields.io/badge/R-Package-blue.svg)](https://www.r-project.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Shiny](https://img.shields.io/badge/Shiny-App-brightgreen.svg)](https://shiny.rstudio.com/)

## 📋 Overview

ShinyRenamingNDIDI is an R package that provides an intuitive Shiny web application designed for agricultural researchers working with nutrient deficiency images. The app standardizes image naming conventions, making it easier to organize and manage large collections of experimental images.

## ✨ Features

- **🎨 Beautiful Modern UI**: Clean, responsive interface with gradient designs and smooth animations
- **📁 Batch Image Upload**: Upload multiple images at once via drag-and-drop or file selection
- **👁️ Image Preview**: View thumbnails of uploaded images with file information
- **🗑️ Selective Removal**: Remove individual images before processing
- **🏷️ Standardized Naming**: Automatic renaming following the pattern:
  ```
  crop_deficiency_phenologicalStage_deficiencyStage_userName_originalName.ext
  ```
- **📦 Automatic Compression**: All processed images are packaged into a ZIP file
- **💾 Easy Download**: One-click download of renamed and compressed images
- **🔄 Quick Reset**: Clear all inputs and start fresh with a single click

## 🚀 Installation

### Prerequisites

- R (>= 4.0.0)
- RStudio (recommended)

### Install from GitHub

```r
# Install devtools if you haven't already
install.packages("devtools")

# Install ShinyRenamingNDIDI
devtools::install_github("Ciampitti-Lab/ShinyRenamingNDIDI")
```

### Install from Local Source

```r
# Navigate to the package directory
setwd("path/to/ShinyRenamingNDIDI")

# Install required dependencies
install.packages(c("shiny", "bslib", "shinyjs", "zip", "tools", "base64enc", "htmltools"))

# Install the package
devtools::install()
```

## 📖 Usage

### Launch the Application

```r
# Load the package
library(ShinyRenamingNDIDI)

# Run the app
run_app()
```

The application will open in your default web browser.

### Workflow

1. **Select Metadata**:
   - Choose the **crop type** (corn, soybean, wheat, etc.)
   - Select the **nutrient deficiency** (N, P, K, etc.)
   - Pick the **phenological stage** (vegetative, reproductive, etc.)
   - Specify the **deficiency stage** (none, mild, moderate, severe)
   - Enter **your name**

2. **Upload Images**:
   - Click the upload area or drag-and-drop your images
   - Supported formats: PNG, JPEG, JPG, TIFF, BMP
   - Preview thumbnails appear on the right panel

3. **Review and Edit**:
   - Check the uploaded images
   - Remove any unwanted images using the "Remove" button

4. **Process and Download**:
   - Click the **"✓ Process & Download"** button
   - Images are automatically renamed and compressed
   - ZIP file downloads with the naming pattern: `crop_deficiency_userName.zip`

5. **Start Fresh**:
   - Click **"↻ Clear All"** to reset all fields and start over

### Example Output

**Input**: 
- Crop: Corn
- Deficiency: Nitrogen
- Phenological Stage: VE (Vegetative Early)
- Deficiency Stage: Severe
- User Name: JohnDoe
- Original Image: `IMG_001.jpg`

**Output Filename**: 
```
corn_nitrogen_VE_severe_JohnDoe_IMG_001.jpg
```

**ZIP Archive**: 
```
corn_nitrogen_JohnDoe.zip
```

## 🎯 Use Cases

This tool is perfect for:

- **Agricultural Research**: Organizing nutrient deficiency trial images
- **Plant Phenotyping**: Standardizing image nomenclature for datasets
- **Data Management**: Preparing images for analysis or archival
- **Collaborative Projects**: Ensuring consistent naming across team members
- **Educational Materials**: Creating organized image libraries for teaching

## 🛠️ Technical Details

### Package Structure

```
ShinyRenamingNDIDI/
├── DESCRIPTION          # Package metadata and dependencies
├── NAMESPACE            # Package namespace
├── LICENSE              # MIT License
├── README.md            # This file
├── R/
│   └── run_app.R        # Main function to launch the app
└── inst/
    └── app/
        ├── app.R        # Shiny app entry point
        ├── ui.R         # User interface definition
        └── server.R     # Server logic and processing
```

### Dependencies

- **shiny** (>= 1.7.0): Web application framework
- **bslib** (>= 0.5.0): Bootstrap themes for Shiny
- **shinyjs** (>= 2.1.0): JavaScript operations in Shiny
- **zip** (>= 2.3.0): ZIP file creation
- **tools**: File utilities
- **base64enc**: Image encoding for previews
- **htmltools**: HTML generation

### Naming Convention

The application uses a structured naming convention:

```
{crop}_{deficiency}_{phenoStage}_{defStage}_{userName}_{originalName}.{ext}
```

- **crop**: Crop type identifier (e.g., corn, soybean)
- **deficiency**: Nutrient identifier (e.g., nitrogen, phosphorus)
- **phenoStage**: Growth stage code (e.g., VE, RM)
- **defStage**: Severity level (none, mild, moderate, severe)
- **userName**: User identifier (sanitized)
- **originalName**: Original filename (sanitized)
- **ext**: Original file extension

## 🎨 UI Features

- **Gradient Backgrounds**: Modern color schemes using green tones
- **Responsive Design**: Works on desktop and mobile devices
- **Image Thumbnails**: Preview images at 80x80px
- **Hover Effects**: Interactive elements with smooth transitions
- **Form Validation**: Alerts for missing required fields
- **Status Messages**: Clear feedback for user actions

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👥 Authors

- **Ciampitti Lab** - *Initial work*

## 🙏 Acknowledgments

- Built with [Shiny](https://shiny.rstudio.com/) by RStudio
- UI components from [bslib](https://rstudio.github.io/bslib/)
- Icons and styling inspired by modern web design practices

## 📧 Contact

For questions, suggestions, or issues, please open an issue on GitHub or contact the Ciampitti Lab.

---

**Made with ❤️ for agricultural research**
A Shiny tool to rename images for the Nutrient Deficiency Image Database Initiative (NDIDI)
