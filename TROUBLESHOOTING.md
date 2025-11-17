# 🔧 Troubleshooting Guide

## Common Issues and Solutions

### Installation Issues

#### Problem: "Package 'xxx' is not available"
**Solution:**
```r
# Update R and install packages from CRAN
update.packages(ask = FALSE)
install.packages(c("shiny", "bslib", "shinyjs", "zip", "base64enc", "htmltools"))
```

#### Problem: "devtools not found"
**Solution:**
```r
install.packages("devtools")
```

#### Problem: Package won't install
**Solution:**
```r
# Try installing dependencies manually
install.packages("shiny")
install.packages("bslib")
install.packages("shinyjs")
install.packages("zip")

# Then try again
devtools::install()
```

---

### App Launch Issues

#### Problem: "Could not find app directory"
**Solution:**
```r
# Make sure you're in the package directory
setwd("path/to/ShinyRenamingNDIDI")

# Load the package first
devtools::load_all()

# Then run
run_app()
```

#### Problem: App won't start - "Error in shinyApp"
**Solution:**
```r
# Check if all packages are loaded
library(shiny)
library(bslib)
library(shinyjs)

# Try running directly from the app folder
shiny::runApp("inst/app")
```

#### Problem: Port already in use
**Solution:**
```r
# Specify a different port
shiny::runApp("inst/app", port = 3838)
```

---

### Upload Issues

#### Problem: Images won't upload
**Solution:**
1. Check file format (must be PNG, JPEG, JPG, TIFF, or BMP)
2. Check file size (very large files may take time)
3. Check browser console for errors (F12)
4. Try smaller number of files first

#### Problem: "File input not responding"
**Solution:**
```r
# Restart the R session
.rs.restartR()

# Reload and try again
devtools::load_all()
run_app()
```

#### Problem: Thumbnails not showing
**Solution:**
1. Ensure `base64enc` package is installed:
   ```r
   install.packages("base64enc")
   ```
2. Check if image files are corrupted
3. Try with PNG files first

---

### Processing Issues

#### Problem: "Download not starting"
**Solution:**
1. Check browser popup blocker settings
2. Allow downloads from localhost
3. Check disk space
4. Try different browser

#### Problem: ZIP file is empty
**Solution:**
1. Check if `zip` package is installed:
   ```r
   install.packages("zip")
   ```
2. Check temporary directory has write permissions:
   ```r
   tempdir()
   file.access(tempdir(), 2)  # Should return 0
   ```

#### Problem: "Processing" message stays forever
**Solution:**
1. Check R console for errors
2. Restart app
3. Try with fewer images
4. Check available memory

#### Problem: Renamed files have wrong format
**Solution:**
1. Verify all metadata fields are filled
2. Check for special characters in your name
3. Review naming pattern in documentation

---

### Browser Issues

#### Problem: Layout looks broken
**Solution:**
1. Clear browser cache (Ctrl+F5)
2. Try different browser (Chrome, Firefox, Edge)
3. Check browser zoom level (should be 100%)
4. Disable browser extensions

#### Problem: Buttons not clickable
**Solution:**
1. Ensure JavaScript is enabled
2. Check browser console for errors (F12)
3. Try incognito/private mode
4. Update browser to latest version

---

### Performance Issues

#### Problem: App is slow with many images
**Solution:**
1. Upload images in smaller batches
2. Close other R sessions
3. Increase R memory limit:
   ```r
   memory.limit(size = 8000)  # Windows
   ```
4. Use lower resolution images if possible

#### Problem: R crashes when processing
**Solution:**
1. Reduce number of images
2. Check available RAM
3. Close unnecessary programs
4. Update R to latest version

---

### Validation Issues

#### Problem: "Please select..." messages keep appearing
**Solution:**
1. Make sure all dropdown menus have selections (not "Select...")
2. Ensure name field is not empty
3. Upload at least one image

#### Problem: Can't select certain options
**Solution:**
1. Click directly on the dropdown text
2. Try using keyboard (Tab + Arrow keys)
3. Refresh the page

---

### Windows-Specific Issues

#### Problem: File paths with spaces causing errors
**Solution:**
```r
# Use quotes around paths
setwd("C:/Users/My Name/Documents/ShinyRenamingNDIDI")

# Or use short path
setwd("C:/Users/MYNAME~1/Documents/SHINYR~1")
```

#### Problem: Permission denied errors
**Solution:**
1. Run RStudio as Administrator
2. Check folder permissions
3. Use a different temporary directory:
   ```r
   Sys.setenv(TMPDIR = "C:/Temp")
   ```

---

## Debugging Tips

### Enable Debug Mode

```r
# See what's happening in the console
options(shiny.trace = TRUE)
run_app()
```

### Check Package Installation

```r
# Verify package is installed correctly
packageVersion("ShinyRenamingNDIDI")

# Check dependencies
tools::package_dependencies("ShinyRenamingNDIDI", 
                           which = "Imports")
```

### Test Components Individually

```r
# Test file operations
test_file <- tempfile(fileext = ".jpg")
file.create(test_file)
file.exists(test_file)

# Test ZIP creation
zip::zip("test.zip", test_file)
file.exists("test.zip")
```

### View Error Messages

```r
# Run with error catching
tryCatch(
  run_app(),
  error = function(e) {
    print(e)
    traceback()
  }
)
```

---

## Getting Help

If you still have issues:

1. **Check R Console**: Look for error messages
2. **Browser Console**: Press F12, check Console tab
3. **Session Info**: Run `sessionInfo()` and share output
4. **Create Issue**: Open GitHub issue with:
   - R version
   - Package versions
   - Error messages
   - Steps to reproduce

### Template for Bug Reports

```
**Environment:**
- R Version: [e.g., 4.3.0]
- OS: [e.g., Windows 10]
- Browser: [e.g., Chrome 120]

**Package Versions:**
[Run sessionInfo() and paste output]

**Problem Description:**
[Describe what happened]

**Expected Behavior:**
[Describe what should happen]

**Steps to Reproduce:**
1. [First step]
2. [Second step]
3. [etc.]

**Error Messages:**
[Paste any error messages]

**Screenshots:**
[If applicable]
```

---

## Quick Fixes Checklist

Before asking for help, try this checklist:

- [ ] R is up to date (>= 4.0.0)
- [ ] All packages are installed
- [ ] RStudio is restarted
- [ ] Browser cache is cleared
- [ ] No popup blocker active
- [ ] Sufficient disk space
- [ ] Working internet connection
- [ ] No other R sessions running
- [ ] File permissions are correct
- [ ] Antivirus not blocking

---

## Support Resources

- 📚 **README.md** - Main documentation
- 🚀 **QUICKSTART.md** - Getting started
- 🔧 **DEVELOPMENT.md** - Development notes
- ✨ **FEATURES.md** - Feature details
- 🎨 **UI_PREVIEW.md** - UI overview

---

**Most issues can be solved by restarting R and reinstalling packages!**
