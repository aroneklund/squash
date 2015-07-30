\name{cmap}
\alias{cmap}
\title{ Apply a color map to numeric data  }
\description{
  Map numeric (scalars, vectors, matrices) into colors, (optionally) using a specified color map.
}
\usage{
cmap(x, map, outlier = NULL, ...)
}
\arguments{
  \item{x}{ Something numeric (vector, matrix). }
  \item{map}{ The color map to use (as created by \code{\link{makecmap}}).  If missing, a color map is created. }
  \item{outlier}{ Color for values outside the map domain, or NULL to generate an error in case of such values (see Details).}
  \item{\dots}{ Arguments passed to \code{\link{makecmap}}, if \code{map} is undefined. }
}
\details{
 
  Values in \code{x} outside the domain of \code{map} cause either an error (if \code{outlier=NULL}) or a warning (otherwise).
}
\value{
  Something of the same size as \code{x}.  May be character (RGB) or integer
  (palettes) depending on the color map used.  Dimensions and dimnames are preserved.  
}
\seealso{  \code{\link{makecmap}}.  Also, \code{\link[grDevices]{as.raster}} and \code{\link[lattice]{level.colors}} have similar functionality. }
\examples{
  x <- y <- 1:50
  mat1 <- outer(x, y)
  
  ## several ways of visualizing the matrix mat1:
  plot(col(mat1), row(mat1), col = cmap(mat1), pch = 16)
  
  cimage(x, y, zcol = cmap(mat1))

  colorgram(x = x, y = y, z = mat1)
  
  ## treatment of out-of-domain values
  map <- makecmap(0:100, colFn = greyscale)
  x <- y <- -10:10
  mat2 <- outer(x, y, "*")

  \dontrun{
  ## Values outside the domain of "map" generate an error...
  plot(col(mat2), row(mat2), col = cmap(mat2, map), pch = 15, cex = 2)

  ## ... unless we specify "outlier", but this still generates a warning
  plot(col(mat2), row(mat2), col = cmap(mat2, map, outlier = 'red'), pch = 15, cex = 2)
  }
  
}
\keyword{ color }
