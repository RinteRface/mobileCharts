#' Theme
#' 
#' Set a theme
#' 
#' @inheritParams geom
#' @param colors A vector of colors to use as palette.
#' @param n Number of colors to generate.
#' @param ... Any other options.
#' @param background_color Background color of plot, 
#' if \code{NULL} will be transparent.
#' 
#' @importFrom utils getFromNamespace
#' 
#' @name theme
#' @export
mobile_theme <- function(m, colors, ..., background_color = NULL){
  if(missing(colors))
    stop("Missing `colors`")

  if(!is.null(background_color)){
    make_id <- getFromNamespace("createWidgetId", "htmlwidgets")
    id <- ifelse(is.null(m$elementId), make_id(), m$elementId)
    m$elementId <- id

    style <- sprintf("#%s {background-color:%s}", id, background_color) %>% 
      shiny::tags$style()
    m <- htmlwidgets::prependContent(m, style)
  }
  
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