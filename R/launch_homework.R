#' Launch Rmd files for homework
#'
#' This function launches the named class Rmd file
#'
#' @param class enter the relevant class number (as an int)
#' @return opens the corresponding Rmd file in RStudio
#' @author Akshay Bareja
#' @example
#' launch_homework(class = 1)
#'
#' @export

launch_homework <- function(class = 1){
  package_path <- find.package("tidybiology")
  classes <- c("01_homework.Rmd", "02_dplyr_homework.Rmd", "03_ggplot_homework.Rmd", "04_joins_homework.Rmd", "05_homework.Rmd")
  file <- classes[class]
  rstudioapi::navigateToFile(paste0(package_path, "/homework/", file))
}
