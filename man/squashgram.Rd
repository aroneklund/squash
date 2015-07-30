\name{squashgram}
\alias{squashgram}
\title{ Visualize a function of z coordinates, binned by x, y coordinates} 
\description{
  This is a convenience function combining \code{matapply} and \code{colorgram}. 3-dimensional data is summarized in 2-dimensional bins and represented as a color matrix. Optionally, the number of observations in each bin is indicated by relative size of the matrix elements.
}
\usage{
squashgram(x, y = NULL, z = NULL, FUN, 
    nx = 50, ny = nx, xlim = NULL, ylim = NULL,
    xbreaks = NULL, ybreaks = NULL,
    xlab = NULL, ylab = NULL, zlab = NULL, 
    shrink = 0, ...) 
}
\arguments{
  \item{x, y, z}{ Numeric vectors; see Details. }
  \item{FUN}{ Function to summarize z values. }
  \item{nx, ny}{ Approximate number of bins along x and y axis. }
  \item{xlim, ylim}{ Limit the range of data points considered. }
  \item{xbreaks, ybreaks}{ Breakpoints between bins along x and y axes. }
  \item{xlab, ylab }{ Axis labels. }
  \item{zlab}{ Label for color key. }
  \item{shrink}{ Rectangle shrinkage cutoff. }
  \item{\dots}{ Further arguments passed to \code{\link{colorgram}}. }
}
\details{
  This function may be useful for visualizing the dependence of a variable (\code{z}) on two other variables (\code{x} and \code{y}).
  
  \code{x}, \code{y} and \code{z} values can be passed to \code{squash} in any form recognized by \code{\link{xyz.coords}} (e.g. individual vectors, list, data frame, formula).

  This function calls \code{\link{matapply}} and plots the result along with a color key.
    
  If non-zero, the \code{shrink} parameter reduces the size of rectangles for 
  the bins in which the number of samples is smaller than \code{shrink}. This may be useful to reduce the visual impact of less reliable observations.
}
\value{
  None.
}
\seealso{ The lower-level functions \code{\link{matapply}} and \code{\link{colorgram}}. }
\examples{
  ## earthquake depths in Fiji
  attach(quakes)
  squashgram(depth ~ long + lat, FUN = mean)

  ## iris measurements 
  attach(iris)
  squashgram(Sepal.Length, Sepal.Width, Petal.Length, 
    FUN = median, nx = 20, ny = 15)

  ## Here indicate sample size by size of rectangles
  squashgram(iris[,1:3], FUN = median, 
    nx = 20, ny = 15, shrink = 5)

  ## What is the trend in my noisy 3-dimensional data?
  set.seed(123)
  x <- rnorm(10000)
  y <- rnorm(10000)
  z <- rnorm(10000) + cos(x) + abs(y / 4)
  squashgram(x, y, z, median, colFn = bluered, shrink = 5)

}
\keyword{ hplot }


