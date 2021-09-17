#' Launch Rmd files for in-class activities
#'
#' This function launches the named class Rmd file
#'
#' @param class enter the relevant class number (as an int)
#' @return opens the corresponding Rmd file in RStudio
#' @author Akshay Bareja
#' @example
#' launch_class(class = 1)
#'
#' @export


launch_class <- function(class = 1){
  package_path <- find.package("tidybiology")
  classes <- c("01_exercise.Rmd", "02_dplyr_exercise.Rmd", "03_ggplot_exercise.Rmd", "04_joins_exercise.Rmd", "05_exercise.Rmd")
  file <- classes[class]
  rstudioapi::navigateToFile(paste0(package_path, "/class/", file))
}
