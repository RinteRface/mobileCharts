% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/interactions.R
\name{mobile_interaction}
\alias{mobile_interaction}
\title{Add Interactions}
\usage{
mobile_interaction(m, interaction, ...)
}
\arguments{
\item{m}{An object of class \code{mobile} as returned by \code{\link{mobile}}.}

\item{interaction}{Name of the interaction.}

\item{...}{Named options from the 
\href{https://f2.antv.vision/en/docs/api/chart/interaction}{official documentation}.}
}
\description{
Add interactions on pan, pinch, bar selection or pie selection.
}
\section{Interactions}{

\itemize{
 \item{\code{bar-select}}
 \item{\code{pie-select}}
 \item{\code{pinch}}
 \item{\code{pan}}
}
}

\examples{
df <- data.frame(
 x = letters[1:5],
 y = runif(5)
)

mobile(df, aes(x, y)) \%>\% 
 mobile_bar() \%>\% 
 mobile_interaction("bar-select")

df <- data.frame(
 x = 1:20,
 y = runif(20, 1, 10)
)

mobile(df, aes(x, y)) \%>\% 
 mobile_bar() \%>\% 
 mobile_interaction("pan", limitRange = list(x = list(min = -20, max = 40)))

}
