\name{ColorPalettes}
\alias{greyscale}
\alias{grayscale}
\alias{rainbow2}
\alias{blueorange}
\alias{bluered}
\alias{jet}
\alias{heat}
\alias{coolheat}
\alias{darkbluered}
\title{ Bonus color palettes }
\description{
  Generate a vector of contiguous colors of a specified length.
}
\usage{
rainbow2(n)
jet(n)
heat(n)
coolheat(n)
blueorange(n)
bluered(n)
darkbluered(n)
greyscale(n, start = 0.9, end = 0)
grayscale(n, start = 0.9, end = 0)
}
\arguments{
  \item{n}{ Number of colors to return. }
  \item{start, end}{ Levels of gray (1 = white, 0 = black). }
}
\details{
  \code{rainbow2} is a variation of \code{\link[grDevices]{rainbow}}, in which the colors do not cycle completely around. Thus, \code{rainbow2} may be less ambiguous as a color scale.  
  
  \code{jet} is similar to the Matlab color scheme of the same name and is taken from an example in \code{\link[grDevices]{colorRamp}}.

  \code{heat} is similar to \code{\link{heat.colors}}, but starts at black rather than red.

  \code{coolheat} is the diverging version of \code{heat}, running from cyan to black to yellow.

  \code{blueorange} and \code{bluered} range from blue to grey to orange (or red), and are intended to be used as diverging color scales.  
  
  \code{darkbluered} ranges from dark blue to grey to dark red, and is intended to be used as a diverging color scale that emphasizes the magnitude more than the sign.

  \code{greyscale} or \code{grayscale} ranges from off-white to black.
  
}
\value{
   A vector of RGB colors.
}
\seealso{ 
Standard R palettes such as \code{\link[grDevices]{rainbow}}.

Custom palettes can be generated with \code{\link[grDevices]{colorRamp}}.  
}
\examples{

## Present the squash palettes along with the built-in R palettes
squash.palettes <- c('rainbow2', 'jet', 'grayscale', 'heat', 
                     'coolheat', 'blueorange', 'bluered', 'darkbluered')
R.palettes <- c('rainbow', 'heat.colors', 'terrain.colors', 'topo.colors', 'cm.colors')

plot(0:8, type = 'n', ann = FALSE, axes = FALSE)
for (i in 1:5) {
  p <- R.palettes[i]
  hkey(makecmap(c(0, 9), colFn = get(p)), 
    title = p, x = 2, y = i - 1)
}
for (i in 1:8) {
  p <- squash.palettes[i]
  hkey(makecmap(c(0, 9), colFn = get(p)), 
    title = p, x = 6, y = i - 1)
}
text(3, 8, 'R palettes', font = 2)
text(7, 8, 'squash palettes', font = 2)

}
\keyword{ color }

