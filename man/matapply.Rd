\name{matapply}
\alias{matapply}
\title{ Apply a function over z coordinates, binned by their x, y coordinates}
\description{
  Divide the range of x and y into intervals, thus forming a matrix of bins, and apply an arbitrary function to the z values corresponding to each bin.
}
\usage{
matapply(x, y = NULL, z = NULL, FUN,  
         nx = 50, ny = nx, 
         xlim = NULL, ylim = NULL, 
         xbreaks = NULL, ybreaks = NULL, 
         right = FALSE, include.lowest = TRUE, ...) 
}
\arguments{
  \item{x, y, z}{ Numeric vectors, or possibly a matrix. }
  \item{FUN}{ Function to summarize z values. }
  \item{nx, ny}{ Approximate number of bins along x and y axis. }
  \item{xlim, ylim}{ Limit the range of data points considered.}
  \item{xbreaks, ybreaks}{ Breakpoints between bins along x and y axes. }
  \item{right}{ Logical; if TRUE, the intervals will be closed on the right (and open on the left). }
  \item{include.lowest}{ Logical, indicating if an \code{x[i]} equal to the lowest (or highest, for right = FALSE) \code{breaks} value should be included. } 
  \item{\dots}{ Further arguments to \code{FUN}. }
}
\details{
  \code{x}, \code{y} and \code{z} values can be passed to \code{squash} in any form recognized by \code{\link{xyz.coords}} (e.g. individual vectors, list, data frame, formula).
  
  Alternatively, data that is already in a matrix can be passed in any format recognized by \code{\link{xyzmat.coords}}.

 \code{FUN} should accept a numeric vector and return a single numeric value (e.g. \code{mean}, \code{median}, \code{min}, \code{max}, \code{sd}).
    
  If \code{xbreaks} is not specified, approximately \code{nx} breakpoints will be generated automatically to span the data; likewise for \code{ybreaks} and \code{ny}.
    
  The output can be visualized with \code{\link{colorgram}}, \code{\link[graphics]{image}}, etc.
}
\value{
  A list with components
  \item{x }{Vector of breakpoints along the x-axis.}
  \item{y }{Vector of breakpoints along the y-axis.}
  \item{z }{Matrix of values representing the summary for each bin.}
  \item{xlab }{A label for the x-axis.}
  \item{ylab }{A label for the y-axis.}
  \item{zlab }{A label for the z-axis.}
}
\note{ 
  The defaults of \code{right} and \code{include.lowest} are opposite the defaults used in \code{\link{cut}}.
}
\seealso{  
This function is essentially a souped-up version of \code{\link{tapply}}.

\code{\link{squashgram}} has similar functionality but with graphical output.
}
\examples{
  ## earthquake depths as a function of longitude, latitude
  attach(quakes)
  quakedepth <- matapply(depth ~ long + lat, FUN = mean)
  colorgram(quakedepth)

  ## iris petal length vs. sepal length and width
  ipl <- matapply(iris[,1:3], FUN = median, nx = 20, ny = 15 )
  colorgram(ipl, main = 'iris')
    
  ## Example of matrix input; here used to downsample an image 
  colorgram(volcano, colFn = terrain.colors)
  volcano2 <- matapply(volcano, FUN = mean, nx = 20)
  colorgram(volcano2, colFn = terrain.colors)
  
}
\keyword{ misc }
