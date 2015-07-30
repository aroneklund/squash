\name{cimage}
\alias{cimage}
\title{ Draw a matrix of colored rectangles  }
\description{
  Draw a matrix of colored rectangles, possibly of varying sizes.
}
\usage{
cimage(x = NULL, y = NULL, zcol = NULL, zsize = 1, 
       xlab = NULL, ylab = NULL, xlabels = NULL, ylabels = NULL, 
       border = NA, add = FALSE, axes = TRUE, useRaster = FALSE, ...) 
}
\arguments{
  \item{x}{ Vector of rectangle midpoints or breakpoints along X-axis (corresponding to the columns of zcol). }
  \item{y}{ Vector of rectangle midpoints or breakpoints along Y-axis (corresponding to the rows of zcol). }
  \item{zcol}{ Matrix of colors for each rectangle, e.g. RGB values or integer indices. }
  \item{zsize}{ Relative size for each rectangle, ranging from 0 to 1. Will be recycled if necessary.  }
  \item{xlab, ylab}{ Labels for the axes. }
  \item{xlabels, ylabels}{ Categorical labels for rows/columns. }
  \item{border}{ Color for rectangle borders. }
  \item{add}{ Add to the current plot instead of creating a new one? }
  \item{axes}{ Draw axes on the plot? }
  \item{useRaster}{ TRUE = draw a true raster image (using \code{\link[graphics]{rasterImage}}). FALSE = draw a series of individual rectangles. }
  \item{\dots}{ Further arguments passed to \code{\link{plot}}. }
}
\details{
  Data (\code{x}, \code{y}, and \code{zcol}) can be passed to this function in any format recognized by \code{\link{xyzmat.coords}}. 
  
  This function is somewhat similar to the function \code{\link[graphics]{image}}, except that the colors are specified explicitly, and the size of each rectangle can be adjusted.

  If \code{xlabels} is \code{NULL} (the default), standard numeric axes are drawn on the X-axis. If \code{xlabels} is \code{TRUE}, the rownames of \code{zcol} are placed below each column. Otherwise, \code{xlabels} is taken as a vector of labels to be placed below each column.  Likewise for \code{ylabels} and the Y-axis.
  
  Using \code{useRaster=TRUE} can reduce the file size for large matrices drawn to vector-based graphics output such as PDFs. However, the output may look strange with smaller matrices on graphics devices that do smoothing by default (such as PDF output viewed in Preview). 
}
\value{
  None.
}
\note{
  Currently, this function will may not behave as expected if the \code{x} and/or \code{y} values are specified as midpoints and are not evenly spaced.
}
\seealso{  
\code{\link[graphics]{image}} and \code{\link[graphics]{rasterImage}} provide somewhat similar functionality.

This function is called by \code{\link{colorgram}}, which accepts a numeric (rather than color) matrix as input.

The package \pkg{pixmap} may be more suitable for plotting images that are not data-driven (e.g. external files).
}
\examples{

  ## Visualize nearly all built-in R colors
  color.mat <- matrix(colors()[1:625], nrow = 25)
  cimage(zcol = color.mat)

  ## An example using "zsize"
  x <- y <- 1:10
  zcolor <- matrix( rainbow(100)[outer(x, y)], nrow = 10 )
  zsize <- matrix( runif(100), nrow = 10 )
  cimage(x, y, zcol = zcolor, zsize = zsize)

  ## Another simple example
  red <- green <- 0:255
  rg <- outer(red, green, rgb, blue = 1, maxColorValue = 255)
  cimage(red, green, zcol = rg)
  
  ## The same, but using useRaster (resulting in faster image generation, 
  ## and smaller file size if saved as a PDF)
  cimage(red, green, zcol = rg, useRaster = TRUE)

  ## An example with categorical axes
  colormixer <- function(x, y) {
      r <- (col2rgb(x) + col2rgb(y)) / 2
      rgb(as.data.frame(t(r)), maxColorValue = 255)
  }
  set.seed(123)
  x <- sample(colors(), 15)
  y <- sample(colors(), 10)
  mix <- outer(x, y, colormixer)
  op <- par(mar = c(8, 8, 2, 2), las = 2)
  cimage(zcol = mix, xlabels = x, ylabels = y, xlab = NA, ylab = NA)
  par(op)
  
  ## An example with non-uniform midpoints and breakpoints
  rg2 <- rg[seq(1, 255, by = 62), seq(1, 255, by = 62)]
  cimage(x = (1:5)^2, y = c(3, 5, 6, 9, 10, 11), zcol = rg2, 
         zsize = matrix(runif(25, min = 0.5), nrow = 5))
    
}
\keyword{ hplot }

