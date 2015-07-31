\name{hist2}
\alias{hist2}
\title{ Bivariate histogram }
\description{
  Calculate data for a bivariate histogram and (optionally) plot it as a colorgram.
}
\usage{
hist2(x, y = NULL, 
      nx = 50, ny = nx,  
      xlim = NULL, ylim = NULL, 
      xbreaks = NULL, ybreaks = NULL,
      plot = TRUE, 
      xlab = NULL, ylab = NULL, zlab = "Counts", 
      colFn = heat, breaks = prettyInt, ...) 
}
\arguments{
  \item{x, y}{ Numeric vectors. }
  \item{nx, ny}{ Approximate number of intervals along x and y axes. }
  \item{xlim, ylim}{ Limit the range of data points considered. }
  \item{xbreaks, ybreaks}{ Breakpoints between bins along x and y axes. }
  \item{plot}{ Plot the histogram? }
  \item{xlab, ylab }{ Axis labels. }
  \item{zlab}{ Label for the color key. }
  \item{colFn, breaks}{ Color key parameters; see \code{\link{makecmap}}. }
  \item{\dots}{ Further arguments passed to \code{\link{colorgram}}. }
}
\details{
  Data can be passed to \code{hist2} in any form recognized by \code{\link{xy.coords}} (e.g. individual vectors, list, data frame, formula). 
    
}
\value{
  Invisibly, a list with components:
  \item{x }{Vector of breakpoints along the x-axis.}
  \item{y }{Vector of breakpoints along the y-axis.}
  \item{z }{Matrix of counts.}
  \item{xlab }{A label for the x-axis.}
  \item{ylab }{A label for the y-axis.}
  \item{zlab }{A label for the color key.}
}
\seealso{ 
\code{\link[graphics]{hist}}, for a standard (univariate) histogram.

\code{hist2d} in the \pkg{gplots} package for another implementation. 

The \pkg{hexbin} package, for a hexagonal implementation.
}
\examples{
  set.seed(123)
  x <- rnorm(10000)
  y <- rnorm(10000) + x
  hist2(x, y)
  
  ## pseudo-log-scale color breaks:
  hist2(x, y, breaks = prettyLog, key.args = list(stretch = 4))

  ## log-scale color breaks; the old way using 'base'
  ## (notice box removal to make space for the vertical color key)
  hist2(x, y, base = 2, key = vkey, nz = 5, bty = 'l')

}
\keyword{ hplot }
