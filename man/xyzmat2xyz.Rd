\name{xyzmat2xyz}
\alias{xyzmat2xyz}
\title{Convert (x, y, zmat) coordinates to (x, y, z) coordinates}
\description{
Convert a matrix of Z coordinates into (x, y, z) triples. 
}
\usage{
xyzmat2xyz(...)
}
\arguments{
  \item{\dots}{ Arguments passed to \code{\link{xyzmat.coords}} }
}
\details{
The input is based on \code{\link{xyzmat.coords}}.

The output is as returned by \code{\link{xyz.coords}}
}
\value{
A list; see \code{\link{xyz.coords}}.
}
\examples{
  ## 
  str(volcano)
  volcano.xyz <- xyzmat2xyz(volcano)
  str(volcano.xyz)
}
\keyword{ manip }
