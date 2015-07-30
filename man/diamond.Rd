\name{diamond}
\alias{diamond}
\title{ Draw diamonds }
\description{ Draw diamonds on the graphics device. }
\usage{
diamond(x, y = NULL, radius, ...)
}
\arguments{
  \item{x, y}{ Position(s) of the centers of the diamonds. }
  \item{radius}{ Distances from the center to the vertex. }
  \item{\dots}{ Further arguments passed to \code{\link{polygon}} (e.g. \code{col}, \code{border}). }
}
\details{  
\code{x} and \code{y} can be passed to \code{diamond} in any form recognized by \code{\link{xy.coords}} (e.g. individual vectors, list, data frame, formula). 

Only \dQuote{square} (equilateral) diamonds are implemented here.  }
\seealso{ \code{\link{rect}} }
\examples{ 
  plot(1:10)
  diamond(1:10, rep(3, 10), radius = 0.4)
  diamond(3, 8, 1, border = 3)  
  diamond(1:10, rep(5, 10), radius = seq(0.1, 1, length = 10), col = 1:10)
}
\keyword{ aplot }
