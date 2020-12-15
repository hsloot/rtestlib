#' A simple2 function
#'
#' @param x First
#' @param y Second
#'
#' @export
simple2 <- function(x, y) {
  x + y
}

#' A simple3 function
#'
#' @param x First
#' @param y Second
#' @param z Third
#'
#' @export
simple3 <- function(x, y, z) {
  simple2(x, simple2(y, z))
}

#' A simple4 function
#'
#' @param x First
#' @param y Second
#' @param z Third
#' @param aa Fourth
#' @export
simple4 <- function(x, y, z, aa) {
  simple2(x, simple3(y, z, aa))
}

#' A simple function
#'
#' @param x First
#' @param y Second
#' @param ... Rest
#' @importFrom rtestlib simple
#' @export
simple_alt <- function(x, y, ...) {
  if (missing(y)) return(x)
  simple2(x, rtestlib::simple(y, ...))
}
