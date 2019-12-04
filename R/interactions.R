#' Add Interactions
#' 
#' Add interactions on pan, pinch, bar selection or pie selection.
#' 
#' @inheritParams geom
#' @param interaction Name of the interaction.
#' @param ... Named options from the 
#' \href{https://f2.antv.vision/en/docs/api/chart/interaction}{official documentation}.
#' 
#' @section Interactions:
#' \itemize{
#'  \item{\code{bar-select}}
#'  \item{\code{pie-select}}
#'  \item{\code{pinch}}
#'  \item{\code{pan}}
#' }
#' 
#' @examples 
#' df <- data.frame(
#'  x = letters[1:5],
#'  y = runif(5)
#' )
#' 
#' mobile(df, aes(x, y)) %>% 
#'  mobile_bar() %>% 
#'  mobile_interaction("bar-select")
#' 
#' df <- data.frame(
#'  x = 1:20,
#'  y = runif(20, 1, 10)
#' )
#' 
#' mobile(df, aes(x, y)) %>% 
#'  mobile_bar() %>% 
#'  mobile_interaction("pan", limitRange = list(x = list(min = -20, max = 40)))
#' 
#' @export 
mobile_interaction <- function(m, interaction, ...) {
  if(missing(interaction))
    stop("Missing `interaction`")

  interaction <- ifelse(interaction == "bar-select", "interval-select", interaction)
  
  m$x$interactions <- append(
    m$x$interactions, list(list(var = interaction, opts = list(...)))
  )
  return(m)
}
