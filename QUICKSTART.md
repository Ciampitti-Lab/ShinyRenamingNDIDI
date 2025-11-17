# Quick Start Guide - ShinyRenamingNDIDI

## 🚀 Get Started in 3 Steps

### Step 1: Install Dependencies

Open R or RStudio and run:

```r
source("setup.R")
```

This will automatically install all required packages.

### Step 2: Load and Run

```r
# Option A: Run without installing
devtools::load_all()
run_app()

# Option B: Install and run
devtools::install()
library(ShinyRenamingNDIDI)
run_app()
```

### Step 3: Use the App

1. **Fill in metadata** (left panel):
   - Select crop type
   - Select nutrient deficiency
   - Select phenological stage
   - Select deficiency stage
   - Enter your name

2. **Upload images** (left panel):
   - Click the upload area or drag & drop
   - Accepts: PNG, JPEG, JPG, TIFF, BMP

3. **Review images** (right panel):
   - See thumbnails of uploaded images
   - Remove unwanted images

4. **Process**:
   - Click "✓ Process & Download"
   - ZIP file downloads automatically

5. **Reset**:
   - Click "↻ Clear All" to start over

## 📸 Example Usage

**Scenario**: You have corn images showing nitrogen deficiency at early vegetative stage.

1. Select:
   - Crop: Corn
   - Deficiency: Nitrogen (N)
   - Stage: Vegetative Early (V1-V3)
   - Severity: Severe
   - Name: JohnDoe

2. Upload: `photo1.jpg`, `photo2.jpg`, `photo3.jpg`

3. Result: Downloads `corn_nitrogen_JohnDoe.zip` containing:
   - `corn_nitrogen_VE_severe_JohnDoe_photo1.jpg`
   - `corn_nitrogen_VE_severe_JohnDoe_photo2.jpg`
   - `corn_nitrogen_VE_severe_JohnDoe_photo3.jpg`

## 💡 Tips

- **Batch Upload**: Select multiple files at once (Ctrl/Cmd + Click)
- **Preview**: Check image thumbnails before processing
- **Validation**: App alerts if required fields are missing
- **Clear**: Use "Clear All" to reset everything quickly

## ❓ Troubleshooting

**App won't start?**
- Run `source("setup.R")` to check dependencies
- Make sure you're in the package directory

**Download not working?**
- Check browser popup blocker
- Ensure sufficient disk space

**Images not previewing?**
- Check image file format (must be PNG, JPEG, JPG, TIFF, or BMP)
- Ensure files aren't corrupted

## 📚 More Information

- Full documentation: See `README.md`
- Development notes: See `DEVELOPMENT.md`
- License: See `LICENSE`

---

**Need Help?** Open an issue on GitHub or contact the Ciampitti Lab.
