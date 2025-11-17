# 📚 ShinyRenamingNDIDI - Documentation Index

Welcome to the complete documentation for the ShinyRenamingNDIDI R package!

## 🚀 Start Here

New to the package? Start with these files:

1. **[README.md](README.md)** - Complete overview, installation, and usage guide
2. **[QUICKSTART.md](QUICKSTART.md)** - Get started in 3 simple steps
3. **[PROJECT_SUMMARY.md](PROJECT_SUMMARY.md)** - What's included in this package

## 📖 Documentation Files

### Getting Started
- 📄 **[QUICKSTART.md](QUICKSTART.md)** - Fast 3-step guide to get running
- 📄 **[README.md](README.md)** - Comprehensive package documentation
- 📄 **[setup.R](setup.R)** - Automated installation script (just run it!)

### Features & Design
- ✨ **[FEATURES.md](FEATURES.md)** - Complete feature list and technical details
- 🎨 **[UI_PREVIEW.md](UI_PREVIEW.md)** - Visual preview of the app interface
- 📦 **[PROJECT_SUMMARY.md](PROJECT_SUMMARY.md)** - What was created and how it works

### Development & Customization
- 🔧 **[DEVELOPMENT.md](DEVELOPMENT.md)** - Developer notes and customization guide
- 🐛 **[TROUBLESHOOTING.md](TROUBLESHOOTING.md)** - Common issues and solutions

### Package Files
- 📄 **[DESCRIPTION](DESCRIPTION)** - Package metadata and dependencies
- 📄 **[NAMESPACE](NAMESPACE)** - Package exports
- 📄 **[LICENSE](LICENSE)** - MIT License

## 🗂️ File Structure

```
ShinyRenamingNDIDI/
│
├── 📚 Documentation (You are here!)
│   ├── README.md              ← Main documentation
│   ├── QUICKSTART.md          ← Quick start guide
│   ├── FEATURES.md            ← Feature details
│   ├── UI_PREVIEW.md          ← UI overview
│   ├── DEVELOPMENT.md         ← Developer guide
│   ├── TROUBLESHOOTING.md     ← Problem solving
│   ├── PROJECT_SUMMARY.md     ← Package summary
│   └── INDEX.md               ← This file
│
├── 📦 Package Files
│   ├── DESCRIPTION            ← Package metadata
│   ├── NAMESPACE              ← Exports
│   ├── setup.R                ← Installation script
│   ├── .gitignore             ← Git settings
│   └── .Rbuildignore          ← Build settings
│
├── 💻 Source Code
│   ├── R/
│   │   └── run_app.R          ← Main function
│   ├── inst/app/
│   │   ├── app.R              ← App entry
│   │   ├── ui.R               ← User interface
│   │   └── server.R           ← Server logic
│   └── man/
│       └── run_app.Rd         ← Function docs
│
└── 🔧 Configuration
    └── ShinyRenamingNDIDI.Rproj  ← RStudio project
```

## 🎯 Documentation by Purpose

### I want to...

#### ...get started quickly
→ Read **[QUICKSTART.md](QUICKSTART.md)**

#### ...understand what this package does
→ Read **[README.md](README.md)** and **[FEATURES.md](FEATURES.md)**

#### ...install and run the app
→ Run **[setup.R](setup.R)** then read **[QUICKSTART.md](QUICKSTART.md)**

#### ...see what the app looks like
→ Read **[UI_PREVIEW.md](UI_PREVIEW.md)**

#### ...customize or modify the app
→ Read **[DEVELOPMENT.md](DEVELOPMENT.md)**

#### ...solve a problem
→ Read **[TROUBLESHOOTING.md](TROUBLESHOOTING.md)**

#### ...understand the technical implementation
→ Read **[FEATURES.md](FEATURES.md)** and **[PROJECT_SUMMARY.md](PROJECT_SUMMARY.md)**

#### ...contribute to the project
→ Read **[DEVELOPMENT.md](DEVELOPMENT.md)** and **[README.md](README.md)** (Contributing section)

## 📋 Quick Reference

### Installation Command
```r
source("setup.R")
```

### Run Command
```r
devtools::load_all()
run_app()
```

### Naming Pattern
```
crop_deficiency_phenoStage_defStage_userName_originalName.ext
```

### ZIP Pattern
```
crop_deficiency_userName.zip
```

## 🎨 Key Features

- ✅ R package format
- ✅ Beautiful modern UI
- ✅ Drag-and-drop upload
- ✅ Image thumbnails
- ✅ Standardized naming
- ✅ ZIP compression
- ✅ Automatic download
- ✅ Clear/reset function

## 🔗 Quick Links

### Documentation
- [Main README](README.md#readme)
- [Quick Start](QUICKSTART.md#quick-start-guide---shinyrenamingndiidi)
- [Features](FEATURES.md#-shinyrenamingndiidi---feature-overview)
- [UI Preview](UI_PREVIEW.md#-ui-preview---what-the-app-looks-like)
- [Troubleshooting](TROUBLESHOOTING.md#-troubleshooting-guide)

### Code
- [Run Function](R/run_app.R)
- [UI Code](inst/app/ui.R)
- [Server Code](inst/app/server.R)
- [App Entry](inst/app/app.R)

### Package
- [Description](DESCRIPTION)
- [Setup Script](setup.R)
- [License](LICENSE)

## 📊 Documentation Statistics

- **Total Documentation Files**: 8
- **Total Code Files**: 5
- **Lines of Documentation**: ~2,000+
- **Lines of Code**: ~500+
- **Supported Image Formats**: 5 (PNG, JPEG, JPG, TIFF, BMP)
- **Crop Options**: 8
- **Nutrient Options**: 13
- **Stage Options**: 11 total (7 pheno + 4 deficiency)

## 🎓 Learning Path

### Beginner Path
1. Start → **[QUICKSTART.md](QUICKSTART.md)**
2. Run → **[setup.R](setup.R)**
3. Use → Follow the 3-step guide
4. Help → **[TROUBLESHOOTING.md](TROUBLESHOOTING.md)** if needed

### Intermediate Path
1. Overview → **[README.md](README.md)**
2. Features → **[FEATURES.md](FEATURES.md)**
3. Interface → **[UI_PREVIEW.md](UI_PREVIEW.md)**
4. Summary → **[PROJECT_SUMMARY.md](PROJECT_SUMMARY.md)**

### Advanced Path
1. Development → **[DEVELOPMENT.md](DEVELOPMENT.md)**
2. Code → Explore `R/` and `inst/app/`
3. Customize → Modify UI/Server
4. Package → **[DESCRIPTION](DESCRIPTION)** and **[NAMESPACE](NAMESPACE)**

## 💡 Pro Tips

1. **First Time?** Run `source("setup.R")` - it does everything!
2. **Quick Test?** Use `devtools::load_all()` instead of installing
3. **Stuck?** Check **[TROUBLESHOOTING.md](TROUBLESHOOTING.md)** first
4. **Want to Modify?** Read **[DEVELOPMENT.md](DEVELOPMENT.md)**
5. **Need Examples?** See README for detailed usage examples

## 📧 Getting Help

1. **In-App Issues** → [TROUBLESHOOTING.md](TROUBLESHOOTING.md)
2. **Usage Questions** → [README.md](README.md) or [QUICKSTART.md](QUICKSTART.md)
3. **Technical Details** → [FEATURES.md](FEATURES.md) or [DEVELOPMENT.md](DEVELOPMENT.md)
4. **Bug Reports** → Open GitHub issue (template in TROUBLESHOOTING.md)

## ✅ Checklist: Am I Ready?

- [ ] I've read QUICKSTART.md
- [ ] I've run setup.R
- [ ] I have R >= 4.0.0
- [ ] All dependencies are installed
- [ ] I know how to run the app (`run_app()`)
- [ ] I know the naming pattern
- [ ] I bookmarked TROUBLESHOOTING.md

## 🎉 You're All Set!

If you've checked the boxes above, you're ready to use ShinyRenamingNDIDI!

```r
# Let's go!
devtools::load_all()
run_app()
```

---

**Happy image renaming! 🌱**

---

## 📝 Document Descriptions

| File | Purpose | Target Audience |
|------|---------|----------------|
| README.md | Complete documentation | Everyone |
| QUICKSTART.md | Fast start guide | New users |
| FEATURES.md | Technical details | Users & Developers |
| UI_PREVIEW.md | Visual overview | Users |
| DEVELOPMENT.md | Customization guide | Developers |
| TROUBLESHOOTING.md | Problem solving | Users |
| PROJECT_SUMMARY.md | Package overview | Everyone |
| INDEX.md | This file | Everyone |

## 🔖 Bookmark This Page

Keep this INDEX.md open as your navigation hub to all documentation!

---

*Last Updated: November 17, 2025*
*Package Version: 0.1.0*
