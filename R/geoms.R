#' Geoms
#' 
#' Add a geometry.
#' 
#' @param data A data.frame.
#' @param m An object of class \code{mobile} as returned by \code{\link{mobile}}.
#' @param ... Aesthetics.
#' @param inherit_aes Whether to inherit the aesthetics from \code{\link{mobile}}.
#' 
#' @examples 
#' mobile(cars) %>% 
#'  mobile_point(aes(speed, dist))
#' 
#' @name geom
#' @export
mobile_bar <- function(m, ..., data = NULL, inherit_aes = TRUE){
  mobile_geom(m, ..., data, inherit_aes = TRUE, type = "interval")
}

#' @rdname geom
#' @export
mobile_point <- function(m, ..., data = NULL, inherit_aes = TRUE){
  mobile_geom(m, ..., data, inherit_aes = TRUE, type = "point")
}

#' @rdname geom
#' @export
mobile_path <- function(m, ..., data = NULL, inherit_aes = TRUE){
  mobile_geom(m, ..., data, inherit_aes = TRUE, type = "path")
}

#' @rdname geom
#' @export
mobile_line <- function(m, ..., data = NULL, inherit_aes = TRUE){
  mobile_geom(m, ..., data, inherit_aes = TRUE, type = "line")
}

#' @rdname geom
#' @export
mobile_area <- function(m, ..., data = NULL, inherit_aes = TRUE){
  mobile_geom(m, ..., data, inherit_aes = TRUE, type = "area")
}

#' @rdname geom
#' @export
mobile_polygon <- function(m, ..., data = NULL, inherit_aes = TRUE){
  mobile_geom(m, ..., data, inherit_aes = TRUE, type = "polygon")
}

#' @rdname geom
#' @export
mobile_schema <- function(m, ..., data = NULL, inherit_aes = TRUE){
  mobile_geom(m, ..., data, inherit_aes = TRUE, type = "schema")
}

mobile_geom <- function(m, ..., data = NULL, inherit_aes = TRUE, type = "interval"){
  aes <- get_aes(...)
  aes <- combine_aes(m$x$aes, aes, inherit = inherit_aes)

  if(is.null(aes$x) || is.null(aes$y))
    stop("Missing `x` and `y` aes.", call. = FALSE)

  if(!is.null(data))
    m$x$data <- data

  layer <- list()
  layer$position <- list(extract_aes(aes, "x"), extract_aes(aes, "y"))
  layer$color <- extract_aes(aes, "colour")
  layer$size <- extract_aes(aes, "size")
  layer$shape <- extract_aes(aes, "shape")
  layer$adjust <- extract_aes(aes, "adjust")
  layer$style <- extract_aes(aes, "style")
  layer$animate <- extract_aes(aes, "animate")
  layer$type <- type

  m$x$layers <- append(m$x$layers, list(layer))
  m
}
