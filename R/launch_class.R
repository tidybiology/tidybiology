#' Launch Rmd files for in-class activities
#'
#' @description This function launches the named class Rmd file
#'
#' @param class Integer indicating the relevant project number
#' @param topic Character indicating the desired topic. Options include "General" and "Biology"
#' @param show_answers Logical (default == FALSE). If this parameter is set to TRUE, answers will be shown in the .Rmd file
#' @param testing Logical (default == FALSE). Appropriate path is selected depending on what environment the package is running in. USERS CAN IGNORE.
#'
#' @export
#' @return opens the corresponding Rmd file in RStudio
#'
#' @author Akshay Bareja
#' @example
#' # Class 2 for General topic
#' launch_class(class = 2, topic = "General")
#'
#' # Class 3 for Biology topic with answers shown
#' launch_class(class = 3, topic = "Biology", show_answers = TRUE)
#' @export

launch_class <- function(class = 1, topic = "General", show_answers = FALSE, testing = FALSE){

  if(testing){
    package_path <- here::here()
    class_path <- "/inst/class/"
  } else {
    package_path <- find.package("tidybiology")
    class_path <- "/class/"
  }

  if(topic == "General"){
    topic_path <- "class_general/"
  } else if(topic == "Biology"){
    topic_path <- "class_biology/"
  }

  if(show_answers) {
    if(class <= 9){
      file <- paste0("0", class, "_exercise_answers.Rmd")
      rstudioapi::navigateToFile(paste0(package_path, class_path, topic_path, file))
    } else {
      file <- paste0(class, "_exercise_answers.Rmd")
      rstudioapi::navigateToFile(paste0(package_path, class_path, topic_path, file))
    }
  } else {
    if(class <= 9){
      file <- paste0("0", class, "_exercise.Rmd")
      rstudioapi::navigateToFile(paste0(package_path, class_path, topic_path, file))
    } else {
      file <- paste0(class, "_exercise.Rmd")
      rstudioapi::navigateToFile(paste0(package_path, class_path, topic_path, file))
    }
  }
}
