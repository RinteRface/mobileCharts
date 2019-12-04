#' General Options
#' 
#' Pass general options to the chart.
#' 
#' @inheritParams geom
#' @param padding An integer or a list containing 4 integers
#' e.g.: \code{list(40, 10, 'auto', 'auto')} giving padding
#' on top, right, bottom, and left.
#' @param animate Set to \code{FALSE} to disable animations.
#' 
#' @export 
mobile_options <- function(m, padding = "auto", animate = TRUE) {
  m$x$opts$padding <- padding
  m$x$opts$animate <- animate
  return(m)
}
