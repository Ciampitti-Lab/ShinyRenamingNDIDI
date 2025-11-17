#' Run the Shiny Image Renaming Application
#'
#' @description Launch the Shiny app for renaming and compressing nutrient deficiency images
#'
#' @return A Shiny app object
#' @export
#'
#' @examples
#' \dontrun{
#' run_app()
#' }
run_app <- function() {
  app_dir <- system.file("app", package = "ShinyRenamingNDIDI")
  if (app_dir == "") {
    stop("Could not find app directory. Try re-installing `ShinyRenamingNDIDI`.", call. = FALSE)
  }
  
  shiny::runApp(app_dir, display.mode = "normal")
}
