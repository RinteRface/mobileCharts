#' @importFrom ggplot2 aes
#' @export
ggplot2::aes

# is aesthetic?
is_aes <- function(x, cl = "uneval"){
  aes <- FALSE
  if(inherits(x, cl))
    aes <- TRUE
  return(aes)
}

get_aes <- function(...){
  aes <- list(...) %>% 
    keep(is_aes) 

  if(length(aes))
    aes[[1]]
  else
    list()
}

has_aes <- function(...){
  x <- list(...) %>% 
    map(is_aes)

  any(x)
}

combine_aes <- function(main_aes = NULL, aes = NULL, inherit = TRUE){

  if(isTRUE(inherit) && !length(main_aes))
    return(aes)

  if(isTRUE(inherit)){
    # aes overrides main_aes
    main_aes <- main_aes[!names(main_aes) %in% names(aes)]
    combined <- append(aes, main_aes)
    return(combined)
  }

  aes
}

extract_aes <- function(aes, var){
  if(is.null(aes[[var]]))
    return(NULL)

  if(rlang::is_bare_numeric(aes[[var]]) || rlang::is_bare_string(aes[[var]]))
    return(aes[[var]])

  rlang::as_label(aes[[var]])
}