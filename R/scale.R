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
  vars <- get_scaling_vars(m, "x", ...)

  m$x$scales <- append(m$x$scales, vars)
  return(m)
}

#' @rdname scale
#' @export
mobile_scale_y <- function(m, ...) {

  vars <- get_scaling_vars(m, "y", ...)

  m$x$scales <- append(m$x$scales, vars)
  return(m)
}

mobile_scale <- function(var, ...) {
  list(var = var, opts = list(...))
}

get_scaling_vars <- function(m, aes = c("x", "y"), ...){

  aes <- ifelse(aes == "x", 1, 2)

  var <- m$x$aes[["y"]] # get main aes

  # get layers aes
  vars <- purrr::map(m$x$layers, function(x, aes){
    x$position[[aes]]
  }, aes = aes) %>% 
    unlist()
  
  # append if layers found
  if(!is.null(var))
    vars <- c(vars, rlang::as_label(var))

  # distinct aes
  vars <- unique(vars)

  if(!length(vars))
    stop("No `y` aesthetic found.")

  purrr::map(vars, function(x, ...){
    mobile_scale(x, ...)
  }, ...)
}