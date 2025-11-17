# Installation and Setup Script for ShinyRenamingNDIDI
# Run this script to install all dependencies and set up the package

cat("========================================\n")
cat("ShinyRenamingNDIDI Setup Script\n")
cat("========================================\n\n")

# Check R version
cat("Checking R version...\n")
if (getRversion() < "4.0.0") {
  warning("R version 4.0.0 or higher is recommended. Your version: ", getRversion())
} else {
  cat("✓ R version:", as.character(getRversion()), "\n\n")
}

# Install devtools if not available
cat("Checking for devtools...\n")
if (!requireNamespace("devtools", quietly = TRUE)) {
  cat("Installing devtools...\n")
  install.packages("devtools")
}
cat("✓ devtools is available\n\n")

# List of required packages
required_packages <- c(
  "shiny",
  "bslib",
  "shinyjs",
  "zip",
  "tools",
  "base64enc",
  "htmltools"
)

cat("Installing required packages...\n")
for (pkg in required_packages) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    cat("  Installing", pkg, "...\n")
    install.packages(pkg)
  } else {
    cat("  ✓", pkg, "already installed\n")
  }
}

cat("\n========================================\n")
cat("Installation Complete!\n")
cat("========================================\n\n")

cat("To use the package:\n")
cat("1. Load the package: devtools::load_all()\n")
cat("2. Run the app: run_app()\n\n")

cat("Or install the package:\n")
cat("  devtools::install()\n")
cat("  library(ShinyRenamingNDIDI)\n")
cat("  run_app()\n\n")

# Optionally load and run
response <- readline(prompt = "Would you like to run the app now? (y/n): ")
if (tolower(response) == "y") {
  cat("\nLoading package...\n")
  devtools::load_all()
  cat("Starting app...\n")
  run_app()
}
