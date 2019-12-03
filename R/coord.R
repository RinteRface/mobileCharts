#' Coordinates
#' 
#' Change chart coordinates.
#' 
#' @inheritParams geom
#' @param type Type of coordinate, \code{rect} for cartesian or \code{polar}.
#' @param ... Named options from the 
#' \href{https://f2.antv.vision/en/docs/api/chart/coordinate}{official documentation}.
#' 
#' @examples 
#' mobile(df, aes(label, value, color = label)) %>% 
#'  mobile_bar() %>% 
#'  mobile_coord("polar", transposed = TRUE, innerRadius = .7) %>% 
#'  mobile_hide_axis()
#' 
#' @export
mobile_coord <- function(m, type = c("rect", "polar"), ...) {

  m$x$coord <- list(
    type = match.arg(type),
    opts = list(...)
  )

  return(m)

}

#' Axis
#' 
#' Customise axis.
#' 
#' @inheritParams geom
#' @param ... Named options from the 
#' \href{https://f2.antv.vision/en/docs/api/chart/coordinate}{official documentation}.
#' 
#' @examples 
#' df <- data.frame(
#'  label = c("banana", "apple", "cake"),
#'  value = c(50, 30, 20),
#'  x = "1" # phoney variable
#' )
#' 
#' mobile(df, aes(x, value, color = label, adjust = stack)) %>% 
#'  mobile_bar() %>% 
#'  mobile_coord("polar", transposed = TRUE) %>% 
#'  mobile_hide_axis()
#' 
#' @name axis
#' @export
mobile_hide_axis <- function(m){
  m$x$axisHide <- TRUE
  return(m)
}

#' @rdname axis
#' @export
mobile_axis_x <- function(m, ...) {
  var <- m$x$aes[["x"]]
  if(is.null(var))
    stop("No `x` aesthetic found.")

  m$x$axis <- append(m$x$scales, mobile_axis(rlang::as_label(var), ...))
  return(m)
}

#' @rdname axis
#' @export
mobile_axis_y <- function(m, ...) {
  var <- m$x$aes[["y"]]
  if(is.null(var))
    stop("No `y` aesthetic found.")

  m$x$axis <- append(m$x$scales, mobile_axis(rlang::as_label(var), ...))
  return(m)
}

mobile_axis <- function(var, ...){
  list(list(var = var, opts = list(...)))
}
