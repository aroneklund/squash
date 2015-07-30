\name{dendromat}
\alias{dendromat}
\title{ Plot a dendrogram with a colorgram underneath }
\description{ 
Plot a dendrogram with a colorgram underneath.  The colorgram typically indicates characteristics about each element in the dendrogram.
}
\usage{
dendromat(x, mat, 
         labRow = rownames(mat), labCol = colnames(mat),
         height = NA, gap = 0, matlabside = 2, border = NA, 
         cex.lab = par('cex.axis'), ...)
}
\arguments{
  \item{x}{ An object of type \code{\link{hclust}} or \code{\link{dendrogram}}. }
  \item{mat}{ A matrix or data frame of colors, with each row corresponding to an item in the dendrogram. }
  \item{labRow}{ Labels of items, to be placed underneath the matrix. }
  \item{labCol}{ Labels for characteristics, to be placed next to the matrix. }
  \item{height}{ Fraction of the plot area to reserve for the color matrix.  If NA, the spacing is set automatically. }
  \item{gap}{ Extra space (in lines) to add between the dendrogram and the matrix. }
  \item{matlabside}{ Which side of the matrix to put \code{labCol} (2 or 4). }
  \item{border}{ Border color for the color matrix. }
  \item{cex.lab}{ Relative text size for the item labels. }
  \item{\dots}{ Further arguments passed to \code{\link{plot.dendrogram}}. }
}
\details{ 
The order of \code{labRow} and the rows of \code{mat} should correspond to the input to \code{\link{hclust}} (or whatever function created \code{x}).  This function reorders \code{mat} and \code{labRow} to match the dendrogram, using \code{\link{order.dendrogram}}.

This function combines two plots using \code{\link{layout}}; therefore it is incompatible with other multiple-plot schemes (e.g. \code{par(mfrow)}).  

If \code{height == NA} (the default), the function tries to leave enough room for the item labels at the bottom, and enough room for the color matrix in the middle.  The leftover plotting area on the top is used for the dendrogram. The lower margin setting (see \code{\link{par}}) is ignored.

If \code{labRow} is set to \code{NULL}, or is equal to \code{NULL} because \code{mat} lacks rownames, then the item labels are taken from \code{x} instead.
}
\value{ none. }
\note{ 
Currently, horizontal dendrograms are not supported.

After \code{dendromat} is finished, the user coordinates are set to \code{c(0,1,0,1)}.
}
\seealso{ \code{\link{heatmap}} }
\examples{ 

## Motor Trend car road test data
mt.dend <- hclust(dist(mtcars[,1:7]))
mt.mat <- mtcars[,8:11]

## A minimal dendromat
dendromat(mt.dend, mt.mat)

## The same plot, but with a few enhancements
names(mt.mat) <- c('Straight', 'Manual', '# gears', '# carbs')
dendromat(mt.dend, mt.mat, gap = 0.5, border = 'gray', las = 2, 
  ylab = 'Euclidean distance', 
  main = 'mtcars, clustered by performance')
legend('topright', legend = 0:8, fill = 0:8)

## US state data, with color keys
us.dend <- hclust(dist(scale(state.x77)))

income <- state.x77[, 'Income']
frost <- state.x77[, 'Frost']
murder <- state.x77[, 'Murder']

income.cmap <- makecmap(income, n = 5, colFn = colorRampPalette(c('black', 'green')))
frost.cmap <- makecmap(frost, n = 5, colFn = colorRampPalette(c('black', 'blue')))
murder.cmap <- makecmap(murder, n = 5, colFn = colorRampPalette(c('black', 'red')))

us.mat <- data.frame(Frost = cmap(frost, frost.cmap),
                     Murder = cmap(murder, murder.cmap),
                     Income = cmap(income, income.cmap))

par(mar = c(5,4,4,3)+0.1)
dendromat(us.dend, us.mat,
  ylab = 'Distance', main = 'US states')

vkey(frost.cmap, 'Frost')
vkey(murder.cmap, 'Murder', y = 0.3)
vkey(income.cmap, 'Income', y = 0.7)

}
\keyword{ hplot }
