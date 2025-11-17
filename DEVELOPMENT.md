# ShinyRenamingNDIDI Development Notes

## Quick Start for Development

### Running the App Locally

1. Open RStudio
2. Load the package:
   ```r
   devtools::load_all()
   ```
3. Run the app:
   ```r
   run_app()
   ```

### Testing Changes

- Modify files in `inst/app/`
- Reload with `devtools::load_all()`
- Run `run_app()` to test

### Building the Package

```r
# Check package
devtools::check()

# Build documentation
devtools::document()

# Install locally
devtools::install()
```

## File Structure

- `R/run_app.R`: Main function to launch the app
- `inst/app/ui.R`: User interface with bslib themes
- `inst/app/server.R`: Server logic for image processing
- `inst/app/app.R`: App entry point

## Key Features to Remember

1. **Image Renaming**: Format is `crop_deficiency_phenoStage_defStage_userName_originalName.ext`
2. **ZIP Naming**: Format is `crop_deficiency_userName.zip`
3. **Supported Formats**: PNG, JPEG, JPG, TIFF, BMP
4. **Validation**: All fields must be filled before processing

## Customization Options

### Adding New Crops

Edit `inst/app/ui.R`, find the `crop` selectInput and add new choices:

```r
"New Crop" = "newcrop"
```

### Adding New Nutrients

Edit `inst/app/ui.R`, find the `deficiency` selectInput and add new choices:

```r
"New Nutrient (XX)" = "newnutrient"
```

### Changing Color Scheme

Edit the CSS in `inst/app/ui.R`:
- Primary green: `#2E7D32`
- Secondary green: `#66BB6A`
- Modify these hex codes to change the theme

## Dependencies

Make sure these packages are installed:
- shiny
- bslib
- shinyjs
- zip
- tools
- base64enc
- htmltools

## Troubleshooting

### App won't start
- Check if all dependencies are installed
- Run `devtools::load_all()` first
- Check for errors in R console

### Images not downloading
- Ensure zip package is installed: `install.packages("zip")`
- Check browser popup blocker settings
- Verify temporary directory has write permissions

### Thumbnails not showing
- Check base64enc package is installed
- Verify image files are not corrupted
- Check browser console for errors
