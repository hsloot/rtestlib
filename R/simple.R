#' A simple function
#'
#' @param x First
#' @param y Second
#' @param ... Rest
#'
#' @export
simple <- function(x, y, ...) {
  if (missing(y)) return(x)
  simple(x + y, ...)
}
