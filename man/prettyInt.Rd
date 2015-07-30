\name{prettyInt}
\alias{prettyInt}
\alias{prettyLog}
\title{ Pretty breakpoints }
\description{ Compute a sequence of around \code{n} values covering the range of \code{x}. 
 These functions are variations of the standard R function \code{\link{pretty}}. }
\usage{
prettyInt(x, n = 5, ...)
prettyLog(x, n = 5, small = NA, logrange = c(-100, 100))
}
\arguments{
  \item{x}{ Numeric vector. }
  \item{n}{ Approximate number of values to return. }
  \item{small}{ Value below which distinction from zero is unimportant. }
  \item{logrange}{ Log (base 10) of the range of values to consider as possible breakpoints. }
  \item{\dots}{ Further arguments passed to \code{\link{pretty}}. }
}
\details{ 
\code{prettyInt} returns integer values, even if this forces the number of values returned to be much lower than the requested number \code{n}. However, at least two values will be returned.

\code{prettyLog} returns values that are approximately evenly spaced on a log scale, such as (1, 3, 10, 30, ...) or (1, 2, 5, 10, 20, 50, ...) or (1, 10, 100, ...).  
Negative or zero values in \code{x} are accomodated by series such as (-100, -10, -1, 0, 1, 10, 100, ...). Setting the parameter \code{small} to a non-\code{NA} value will ignore \code{x} with absolute values below \code{small}. 

}
\value{ A numeric vector. }
\seealso{ \code{\link{pretty}} }
\examples{ 
##
x1 <- 1:3
pretty(x1)
prettyInt(x1)
prettyLog(x1)

## 
x2 <- pi ^ (1:8)
range(x2)
pretty(x2)
prettyLog(x2)
prettyLog(x2, n = 10)

##
x3 <- c(-x2, x2)
pretty(x3)
prettyLog(x3)
prettyLog(x3, small = 100)

}
\keyword{ dplot }
