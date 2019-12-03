#' Tooltip
#' 
#' Add a tooltip. Note that the visualisations being optimized for mobile there
#' is no such thing as hover: tooltips show on click.
#' 
#' @inheritParams geom
#' @param ... Named options from the 
#' \href{https://f2.antv.vision/en/docs/api/chart/tooltip}{official documentation}.
#' 
#' @examples 
#' mobile(cars) %>% 
#'  mobile_point(aes(speed, dist)) %>% 
#'  mobile_tooltip(snap = TRUE)
#' 
#' @export 
mobile_tooltip <- function(m, ...) {

  m$x$tooltip <- list(...)
  
  return(m)
}

#' Legend
#' 
#' Customise the legend of the chart.
#' 
#' @inheritParams geom
#' @param ... Named options from the 
#' \href{https://f2.antv.vision/en/docs/api/chart/legend}{official documentation}.
#' 
#' @examples 
#' mobile(cars) %>% 
#'  mobile_point(aes(speed, dist)) %>% 
#'  mobile_legend(position = "right")
#' 
#' @export 
mobile_legend <- function(m, ...) {

  m$x$legend <- list(...)
  
  return(m)
}