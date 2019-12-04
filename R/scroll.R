#' Scroll
#' 
#' Add a scrollbar to let user pan charts.
#' 
#' @inheritParams geom
#' @param mode Axis to apply scroll to.
#' @param ... Named options from the 
#' \href{https://f2.antv.vision/en/docs/api/chart/scroll-bar}{official documentation}.
#' 
#' @examples
#' # range for pan
#' lmt <- list(x = list(min = -20, max = 20))
#' 
#' mobile(df, aes(x, y)) %>% 
#'  mobile_bar() %>% 
#'  mobile_interaction("pan", limitRange = lmt) %>% 
#'  mobile_scroll(mode = "x", xStyle = list(offsetY = -5))
#' 
#' @export 
mobile_scroll <- function(m, mode = c("x", "y", "xy"), ...) {
  m$x$scroll <- list(mode = match.arg(mode), ...)
  return(m)
}
