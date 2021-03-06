% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/coord.R
\name{mobile_coord}
\alias{mobile_coord}
\title{Coordinates}
\usage{
mobile_coord(m, type = c("rect", "polar"), ...)
}
\arguments{
\item{m}{An object of class \code{mobile} as returned by \code{\link{mobile}}.}

\item{type}{Type of coordinate, \code{rect} for cartesian or \code{polar}.}

\item{...}{Named options from the 
\href{https://f2.antv.vision/en/docs/api/chart/coordinate}{official documentation}.}
}
\description{
Change chart coordinates.
}
\examples{
mobile(df, aes(label, value, color = label)) \%>\% 
 mobile_bar() \%>\% 
 mobile_coord("polar", transposed = TRUE, innerRadius = .7) \%>\% 
 mobile_hide_axis()

}
