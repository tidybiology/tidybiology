% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/launch_class.R
\name{launch_class}
\alias{launch_class}
\title{Launch Rmd files for in-class activities}
\usage{
launch_class(
  class = 1,
  topic = "General",
  show_answers = FALSE,
  testing = FALSE
)
}
\arguments{
\item{class}{Integer indicating the relevant project number}

\item{topic}{Character indicating the desired topic. Options include "General" and "Biology"}

\item{show_answers}{Logical (default == FALSE). If this parameter is set to TRUE, answers will be shown in the .Rmd file}

\item{testing}{Logical (default == FALSE). Appropriate path is selected depending on what environment the package is running in. USERS CAN IGNORE.}
}
\value{
opens the corresponding Rmd file in RStudio
}
\description{
This function launches the named class Rmd file
}
\author{
Akshay Bareja
}
