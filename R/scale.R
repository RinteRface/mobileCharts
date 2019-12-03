#' Scale
#' 
#' Scale variables.
#' 
#' @inheritParams geom
#' @param ... Named options from the 
#' \href{https://f2.antv.vision/en/docs/api/chart/scale}{official documentation}.
#' 
#' @examples 
#' mobile(cars, aes(speed, dist)) %>% 
#'  mobile_point() %>% 
#'  mobile_scale_x(min = -10, tickCount = 20)
#' 
#' @name scale
#' @export
mobile_scale_x <- function(m, ...) {
  var <- m$x$aes[["x"]]
  if(is.null(var))
    stop("No `x` aesthetic found.")

  m$x$scales <- append(m$x$scales, mobile_scale(rlang::as_label(var), ...))
  return(m)
}

#' @rdname scale
#' @export
mobile_scale_y <- function(m, ...) {
  var <- m$x$aes[["y"]]
  if(is.null(var))
    stop("No `y` aesthetic found.")

  m$x$scales <- append(m$x$scales, mobile_scale(rlang::as_label(var), ...))
  return(m)
}

mobile_scale <- function(var, ...) {
  list(list(var = var, opts = list(...)))
}