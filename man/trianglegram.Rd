\name{trianglegram}
\alias{trianglegram}
\title{ Draw a color-coded triangular matrix }
\description{ This function is called by \code{\link{distogram}}, and probably isn't very useful by itself. }
\usage{
trianglegram(x, labels = rownames(x), 
    lower = TRUE, diag = FALSE, right = FALSE, 
    add = FALSE, xpos = 0, ypos = 0, xlim, ylim, ...)
}
\arguments{
  \item{x}{ A square matrix containing color values. }
  \item{labels}{ Labels. }
  \item{lower}{ If TRUE, use \code{\link{lower.tri}}, else use \code{\link{upper.tri}}. }
  \item{diag}{ Include the diagonal elements of \code{x}? }
  \item{right}{ Should triangle point to the right or left? }
  \item{add}{ Add to an existing plot? }
  \item{xpos, ypos}{ Location of bottom point of the triangle. }
  \item{xlim, ylim}{ Plotting limits. }
  \item{\dots}{ Further arguments passed to \code{\link{plot}}. }
}
\details{ 
The input must be a (square) matrix; however, only part of the matrix (the upper or lower triangle) is displayed.
}
\value{ none. }
\seealso{ \code{\link{distogram}}, \code{\link{corrogram}} }
\examples{ 
  m <- matrix(jet(40), nrow = 20, ncol = 20)
  trianglegram(m)

  ## just for fun
  trianglegram(m, labels = NA, right = TRUE, add = TRUE, xpos = 1)
}
\keyword{ aplot }
