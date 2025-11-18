---
editor_options: 
  markdown: 
    wrap: 72
---

# Quick Start Guide - ShinyRenamingNDIDI

## 🚀 Get Started in 3 Steps

### Step 1: Install Dependencies

Open R or RStudio and run:

``` r
source("setup.R")
```

This will automatically install all required packages.

### Step 2: Load and Run

``` r
# Option A: Run without installing
devtools::load_all()
run_app()

# Option B: Install and run
devtools::install()
library(ShinyRenamingNDIDI)
run_app()
```

### Step 3: Use the App

1.  **Fill in metadata** (left panel):
    -   Select crop type
    -   Select nutrient deficiency
    -   Select phenological stage
    -   Select deficiency stage
    -   Enter your name
2.  **Upload images** (left panel):
    -   Click the upload area or drag & drop
    -   Accepts: PNG, JPEG, JPG, TIFF, BMP
3.  **Review images** (middle panel):
    -   See thumbnails of uploaded images
    -   Remove unwanted images
4.  **Add to batch** (middle panel):
    -   Click "+ Add to Batch"
    -   Batch is saved with current settings
5.  **Add more batches** (optional):
    -   Change settings in left panel
    -   Upload new images
    -   Click "+ Add to Batch" again
6.  **Review batches** (right panel):
    -   See all saved batches
    -   Remove unwanted batches
7.  **Download**:
    -   Click "📥 Download All"
    -   ZIP file downloads with all images
8.  **Reset**:
    -   Click "↻ Clear All" to start over

## 📸 Example Usage

**Scenario**: You have corn and wheat images with different deficiencies.

1.  **Batch 1** - Corn with nitrogen deficiency:
    -   Select: Corn, Nitrogen (N), VE, Severe, JohnDoe
    -   Upload: `photo1.jpg`, `photo2.jpg`
    -   Click "+ Add to Batch"

2.  **Batch 2** - Wheat with phosphorus deficiency:
    -   Change to: Wheat, Phosphorus (P), RM, Moderate, JohnDoe
    -   Upload: `photo3.jpg`
    -   Click "+ Add to Batch"

3.  **Download**: Click "📥 Download All"

4.  Result: Downloads `NDIDI_Images_JohnDoe_20251118_143022.zip` containing:
    -   `corn_nitrogen_VE_severe_JohnDoe_photo1.jpg`
    -   `corn_nitrogen_VE_severe_JohnDoe_photo2.jpg`
    -   `wheat_phosphorus_RM_moderate_JohnDoe_photo3.jpg`

## 💡 Tips

-   **Multiple Batches**: Add as many batches as you need before downloading
-   **Different Settings**: Each batch can have different crop/deficiency/stage settings
-   **Batch Upload**: Select multiple files at once (Ctrl/Cmd + Click)
-   **Preview**: Check image thumbnails before adding to batch
-   **Validation**: App alerts if required fields are missing
-   **Clear**: Use "Clear All" to reset everything quickly

## ❓ Troubleshooting

**App won't start?** - Run `source("setup.R")` to check dependencies -
Make sure you're in the package directory

**Download not working?** - Check browser popup blocker - Ensure
sufficient disk space

**Images not previewing?** - Check image file format (must be PNG, JPEG,
JPG, TIFF, or BMP) - Ensure files aren't corrupted

## 📚 More Information

-   Full documentation: See `README.md`
-   Development notes: See `DEVELOPMENT.md`
-   License: See `LICENSE`

------------------------------------------------------------------------

**Need Help?** Open an issue on GitHub or contact the Ciampitti Lab.
