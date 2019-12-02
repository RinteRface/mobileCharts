#' Initialise
#' 
#' Initialise a chart.
#' 
#' @param data A data.frame.
#' @param ... Mobile chart aesthetics.
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param elementId ID of element holding the mobile chart.
#' 
#' @examples 
#' mobile(cars) %>% 
#'  mobile_point(aes(speed, dist))
#'
#' @importFrom purrr keep map
#' @import htmlwidgets
#'
#' @export
mobile <- function(data = NULL, ..., width = NULL, height = NULL, elementId = NULL) {

  aes <- get_aes(...)
  x = list(
    data = data,
    aes = aes,
    geoms = list(),
    opts = list()
  )

  attr(x, "TOJSON_ARGS") <- list(dataframe = "rows")

  # create widget
  htmlwidgets::createWidget(
    name = 'mobile',
    x,
    preRenderHook = mobile_build,
    width = width,
    height = height,
    package = 'mobileCharts',
    elementId = elementId,
    sizingPolicy = htmlwidgets::sizingPolicy(
      padding = 0,
      browser.fill = TRUE
    )
  )
}

mobile_build <- function(m){
  m$x$aes <- NULL
  return(m)
}

mobile_html <- function(id, style, class, ...){
  htmltools::div(
    id = id, 
    class = class,
    htmltools::tags$canvas(id = paste0("canvas-", id), ...),
    ...
  )
}

#' Shiny bindings for mobile
#'
#' Output and render functions for using mobile within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a mobile
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name mobile-shiny
#'
#' @export
mobileOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'mobile', width, height, package = 'mobileCharts')
}

#' @rdname mobile-shiny
#' @export
render_mobile <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, mobileOutput, env, quoted = TRUE)
}
