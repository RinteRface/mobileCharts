#' Animate
#' 
#' Animate various aspects of the chart.
#' 
#' @inheritParams geom
#' @param aspect Aspect to animate, see section below for valid values.
#' @param ... Named options from the 
#' \href{https://f2.antv.vision/en/docs/api/chart/coordinate}{official documentation}.
#' 
#' @section Aspect:
#' Valid \code{aspect}:
#' \itemize{
#'  \item{\code{axis-label}}
#'  \item{\code{axis-grid}}
#'  \item{\code{axis-tick}}
#'  \item{\code{axis-line}}
#'  \item{\code{line}}
#'  \item{\code{area}}
#'  \item{\code{bar}}
#'  \item{\code{path}}
#'  \item{\code{point}}
#'  \item{\code{polygon}}
#'  \item{\code{schema}}
#' }
#' 
#' @examples 
#' mobile(cars, aes(speed, dist)) %>% 
#'  mobile_point() %>% 
#'  mobile_animate(
#'    "point", 
#'    appear = list(
#'      animation = 'fadeIn',
#'      duration = 5000
#'    )
#'  )
#' 
#' @export 
mobile_animate <- function(m, aspect, ...) {
  if(missing(aspect))
    stop("Missing `aspect`", call. = FALSE)

  aspect <- ifelse(aspect == "bar", "interval", aspect)
  opts <- list(list(...))
  names(opts) <- aspect

  m$x$animations <- append(m$x$animations, list(opts))
  return(m)
}