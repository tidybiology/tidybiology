#' A Session Provenance Function
#'
#' This function allows you to easilty print relevant session information, but not unloaded packages, for provenance and reproducibility.
#'
#' @keywords sessionInfo
#' @author Matthew Hirschey, \email{matthew@@hirschey.org}
#' @example
#' session_provenance()
#'
#' @importFrom rlang .data
#' @importFrom utils packageDescription
#' @importFrom dplyr %>%
#'
#' @export

session_provenance <- function(){
  z <- list(R.Version())
  x <- base::search()
  y <- tibble::tibble(x)
  y <- y %>%
    dplyr::rename(package = x) %>%
    dplyr::filter(stringr::str_detect(.data$package, "package"))
  y$package <- stringr::str_remove_all(y$package, "package\\:")
  y <- dplyr::mutate(y, description = lapply(y$package, packageDescription, encoding = NA))
  y <- dplyr::mutate(y, base = dplyr::if_else(purrr::map(y$description, function(x) !is.null(x$Priority) &&
                                x$Priority == "base") == TRUE, TRUE, FALSE))
  y <- dplyr::mutate(y, version = purrr::flatten_chr(purrr::map(y$description, purrr::pluck("Version"))))

  base_packages <- y %>%
    dplyr::filter(.data$base == TRUE) %>%
    dplyr::select(.data$package) %>%
    dplyr::pull()
  base_packages <- stringr::str_c(base_packages, collapse = ", ")

  installed_packages <- y %>%
    dplyr::filter(.data$base == FALSE) %>%
    dplyr::select(.data$package, version)
  installed_tmp <- stringr::str_c(installed_packages$package, installed_packages$version, sep = " ")
  installed_packages <- stringr::str_c(installed_tmp, collapse = ", ")

  session <- tibble::tibble(
    R.version = purrr::pluck(z, 1, "version.string"),
    nickname = purrr::pluck(z, 1, "nickname"),
    platform = purrr::pluck(z, 1, "platform"),
    os = purrr::pluck(z, 1, "os"),
    locale = Sys.getlocale(),
    base_packages = base_packages,
    installed_packages = installed_packages)

  session <- t(session)

  colnames(session) <- c("Session Info")

print(session, quote = FALSE)
}
