\name{xyzmat.coords}
\alias{xyzmat.coords}
\title{Extract (x, y, z) coordinates, where z is a matrix}
\description{
Extract (x, y, z) plotting coordinates, where z is a matrix.
}
\usage{
xyzmat.coords(x = NULL, y = NULL, z = NULL, 
    xlab = NULL, ylab = NULL, zlab = NULL,
    xds = NULL, yds = NULL, zds = NULL)
}
\arguments{
  \item{x, y}{ Numeric vectors. }
  \item{z}{ A matrix }
  \item{xlab, ylab, zlab}{ Labels }
  \item{xds, yds, zds}{ Results from \code{deparse(substitute(x))} (etc.); see below.}
}
\details{
This function is similar to \code{\link{xyz.coords}}, except that this function accepts a matrix for \code{z}.

If \code{x} is the same length as \code{nrow(z)}, \code{x} will be taken as the points at which the \code{z} values were sampled.  If \code{x} is the length of \code{nrow(z) + 1}, \code{x} is taken as the breakpoints between bins. If \code{x} is missing, the matrix indices (\code{1:nrow(z)}) will be used.  Similarly for \code{y} and the columns of \code{z}.

For convenience, the matrix can supplied as the \code{x} argument.  Or, \code{x} can be a list with elements including \{x, y, z, xlab, ylab, zlab\}.

When this function is used inside a higher-level plotting function, the arguments \code{xds}, \code{yds}, and \code{zds} should be set to \code{deparse(substitute(x))} (etc.) so that the function can generate informative default axis labels.  For example, see the code for \code{\link{colorgram}}.
}
\value{
A list with the following components:
  \item{x }{ X coordinates }
  \item{y }{ Y coordinates }
  \item{z }{ Z matrix }
  \item{xlab }{ Label for X axis }
  \item{ylab }{ Label for Y axis }
  \item{zlab }{ Label for Z axis }
}
\examples{
  ## 
  str(volcano)
  volcano.xyzmat <- xyzmat.coords(volcano)
  str(volcano.xyzmat)
}
\keyword{ manip }
