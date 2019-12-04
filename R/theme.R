#' Theme
#' 
#' Set a theme
#' 
#' @inheritParams geom
#' @param colors A vector of colors to use as palette.
#' @param n Number of colors to generate.
#' @param ... Any other options.
#' 
#' @name theme
#' @export
mobile_theme <- function(m, colors, ...){
  if(missing(colors))
    stop("Missing `colors`")
  
  m$x$theme <- list(colors = colors, ...)
  return(m)
}

#' @name theme
#' @export
mobile_ggplot_theme <- function(m, n = 3, ...){
  c <- gg_color_hue(n)
  mobile_theme(m, colors = c, ...)
}

gg_color_hue <- function(n) {
  hues = seq(15, 375, length = n + 1)
  grDevices::hcl(h = hues, l = 65, c = 100)[1:n]
}