# 📝 Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.0] - 2025-11-17

### 🎉 Initial Release

The first release of ShinyRenamingNDIDI - a complete R package for managing and renaming nutrient deficiency images.

### ✨ Added

#### Core Features
- **R Package Structure** - Complete package with DESCRIPTION, NAMESPACE, and proper organization
- **Shiny Application** - Full-featured web application for image management
- **Image Upload** - Support for multiple image uploads via drag-and-drop or file browser
- **Image Preview** - Real-time thumbnail generation with file information
- **Standardized Naming** - Automatic renaming with pattern: `crop_deficiency_phenoStage_defStage_userName_originalName.ext`
- **ZIP Compression** - Automatic compression and download of processed images
- **Input Validation** - Complete validation of all required fields
- **Clear/Reset Function** - One-click reset of all inputs and images

#### User Interface
- **Modern Design** - Beautiful gradient-based UI with green agricultural theme
- **Responsive Layout** - Works on desktop and mobile devices
- **Custom CSS** - Professional styling with hover effects and transitions
- **Card-Based Layout** - Organized interface with distinct sections
- **Status Messages** - Clear feedback for all user actions
- **Image Management** - Individual image removal and batch operations

#### Metadata Options
- **8 Crop Types** - Corn, Soybean, Wheat, Rice, Sorghum, Cotton, Sunflower, Canola
- **13 Nutrient Deficiencies** - N, P, K, S, Mg, Ca, Fe, Mn, Zn, B, Cu, Mo, Control
- **7 Phenological Stages** - VE, VM, VL, RE, RM, RL, MAT
- **4 Deficiency Stages** - None, Mild, Moderate, Severe

#### File Support
- **Image Formats** - PNG, JPEG, JPG, TIFF, BMP
- **Multiple Files** - Batch upload and processing
- **File Size Display** - Shows KB/MB for each image
- **Extension Preservation** - Maintains original file extensions

#### Documentation
- **README.md** - Comprehensive documentation with installation and usage
- **QUICKSTART.md** - Fast 3-step getting started guide
- **FEATURES.md** - Complete feature list and technical details
- **UI_PREVIEW.md** - Visual preview of the app interface
- **DEVELOPMENT.md** - Developer notes and customization guide
- **TROUBLESHOOTING.md** - Common issues and solutions
- **PROJECT_SUMMARY.md** - Package overview and what's included
- **INDEX.md** - Documentation navigation hub
- **ARCHITECTURE.md** - System architecture and flow diagrams
- **CHANGELOG.md** - This file

#### Setup & Installation
- **setup.R** - Automated installation script
- **RStudio Project** - Pre-configured .Rproj file
- **.gitignore** - Git configuration
- **.Rbuildignore** - R build configuration

#### Dependencies
- shiny (>= 1.7.0)
- bslib (>= 0.5.0)
- shinyjs (>= 2.1.0)
- zip (>= 2.3.0)
- tools
- base64enc
- htmltools

### 🎨 Design Highlights

- **Color Palette** - Green gradient theme (#2E7D32 → #66BB6A)
- **Typography** - Roboto and Roboto Slab fonts from Google Fonts
- **Animations** - Smooth 0.3s transitions on all interactive elements
- **Shadows** - Subtle depth with box-shadows
- **Rounded Corners** - 8-12px border-radius for modern look

### 📦 Package Structure

```
ShinyRenamingNDIDI/
├── R/run_app.R              # Main exported function
├── inst/app/
│   ├── app.R                # Shiny app entry point
│   ├── ui.R                 # User interface
│   └── server.R             # Server logic
├── man/run_app.Rd           # Function documentation
├── DESCRIPTION              # Package metadata
├── NAMESPACE                # Package exports
└── [9 Documentation files]
```

### 🔒 Security

- **Local Processing** - All file operations happen locally
- **Temporary Storage** - Automatic cleanup of temporary files
- **No Server Uploads** - Files never leave user's machine
- **Input Sanitization** - Special characters removed from filenames

### 🎯 Target Use Cases

- Agricultural research image management
- Nutrient deficiency documentation
- Plant phenotyping studies
- Research data organization
- Educational materials preparation

### 📊 Statistics

- **Total Files Created**: 20+
- **Lines of Code**: ~500
- **Lines of Documentation**: ~2,000
- **Test Platforms**: Windows, R >= 4.0.0
- **Documentation Files**: 9
- **Code Files**: 5

### 🙏 Acknowledgments

- Built with Shiny by RStudio
- UI components from bslib
- Inspired by modern web design practices
- Created for the Ciampitti Lab

---

## [Unreleased]

### 🚀 Future Enhancements (Planned)

- [ ] Additional crop types
- [ ] Custom metadata fields
- [ ] Batch rename preview
- [ ] Image quality compression options
- [ ] Export naming convention templates
- [ ] Multi-language support
- [ ] Dark mode theme
- [ ] Image rotation/editing tools
- [ ] Metadata export (CSV/Excel)
- [ ] Session history/recovery

### 🐛 Known Issues

None reported yet! This is the initial release.

### 💡 Suggestions Welcome

Have ideas for improvements? Open an issue on GitHub!

---

## Version History

- **0.1.0** (2025-11-17) - Initial release

---

## How to Update

When a new version is released:

```r
# Remove old version
remove.packages("ShinyRenamingNDIDI")

# Install new version
devtools::install_github("Ciampitti-Lab/ShinyRenamingNDIDI")
```

---

## Release Notes Template

For future releases:

```markdown
## [X.Y.Z] - YYYY-MM-DD

### Added
- New features

### Changed
- Modifications to existing features

### Deprecated
- Features that will be removed

### Removed
- Removed features

### Fixed
- Bug fixes

### Security
- Security improvements
```

---

**Thank you for using ShinyRenamingNDIDI!** 🌱
