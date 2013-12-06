\name{heatmap.mark}
\alias{heatmap.mark}
\title{ Enhanced Heat Map, further modified }
\description{

  This heatmap adds some functional control to the extensions
  provided by \code{\link[gplots]{heatmap.2}}
  to the standard R
  \code{\link[stats]{heatmap}} function.
  Namely, this function adds the ability to suppress the label of the color key,
  and modifies the defaults for \code{scale}, \code{trace},
  \code{col}, and \code{density.info}
  to match the more common usage in RNAseq analysis.
  In addition, it allows the suppression of the hardcoded layouts,
  using \code{plotNew = FALSE} to allow combining multiple heatmaps
  in a single figure, though caution is warranted in arranging your own layout.
  
  Usage and details below are borrowed from that function;
  for more complete examples, see those help pages.
}
\usage{
heatmap.mark (x,

           # dendrogram control
           Rowv = TRUE,
           Colv=if(symm)"Rowv" else TRUE,
           distfun = dist,
           hclustfun = hclust,
           dendrogram = c("both","row","column","none"),
           symm = FALSE,

           # data scaling
           scale = c("row","none", "column"),
           na.rm=TRUE,

           # image plot
           revC = identical(Colv, "Rowv"),
           add.expr,

           # mapping data to colors
           breaks,
           symbreaks=min(x < 0, na.rm=TRUE) || scale!="none",

           # colors
           col="rnaSeqColors",

           # block sepration
           colsep,
           rowsep,
           sepcolor="white",
           sepwidth=c(0.05,0.05),

           # cell labeling
           cellnote,
           notecex=1.0,
           notecol="cyan",
           na.color=par("bg"),

           # level trace
           trace=c("none","column","row","both"),
           tracecol="cyan",
           hline=median(breaks),
           vline=median(breaks),
           linecol=tracecol,

           # Row/Column Labeling
           margins = c(5, 5),
           ColSideColors,
           RowSideColors,
           cexRow = 0.2 + 1/log10(nr),
           cexCol = 0.2 + 1/log10(nc),
           labRow = NULL,
           labCol = NULL,
           srtRow = NULL,
           srtCol = NULL,
           adjRow = c(0,NA),
           adjCol = c(NA,0),
           offsetRow = 0.5,
           offsetCol = 0.5,

           # color key + density info
           key = TRUE,
           keysize = 1.5,
           density.info=c("none","histogram","density"),
           denscol=tracecol,
           symkey = min(x < 0, na.rm=TRUE) || symbreaks,
           densadj = 0.25,

           # plot labels
           main = NULL,
           xlab = NULL,
           ylab = NULL,

           # plot layout
           lmat = NULL,
           lhei = NULL,
           lwid = NULL,

           # extras for this function
           scaleLabel = NULL,
           plotNew = TRUE,
           ...
           )
           }
\arguments{
  % Dendogram Control
  \item{x}{numeric matrix of the values to be plotted. }
  \item{Rowv}{determines if and how the \emph{row} dendrogram should be
    reordered.  By default, it is TRUE, which implies dendrogram is
    computed and reordered based on row means. If NULL or FALSE, then no
    dendrogram is computed and no reordering is done. If a
    \code{\link{dendrogram}}, then it is used "as-is", ie
    without any reordering. If a vector of integers, then dendrogram is
    computed and reordered based on the order of the vector.}
  \item{Colv}{determines if and how the \emph{column} dendrogram should be
    reordered.	Has the options as the \code{Rowv} argument above and
    \emph{additionally} when \code{x} is a square matrix, \code{Colv =
      "Rowv"} means that columns should be treated identically to the rows.}
  \item{distfun}{function used to compute the distance (dissimilarity)
    between both rows and columns.  Defaults to \code{\link{dist}}.}
  \item{hclustfun}{function used to compute the hierarchical clustering
    when \code{Rowv} or \code{Colv} are not dendrograms.  Defaults to
    \code{\link{hclust}}.}
  \item{dendrogram}{character string indicating whether to draw 'none', 
    'row', 'column' or 'both' dendrograms.  Defaults to 'both'. However,
  if Rowv (or Colv) is FALSE or NULL and dendrogram is 'both', then a
  warning is issued and Rowv (or Colv) arguments are honoured.}
  \item{symm}{logical indicating if \code{x} should be treated
    \bold{symm}etrically; can only be true when \code{x} is a square matrix.}
  % data scaling
  \item{scale}{character indicating if the values should be centered and
    scaled in either the row direction or the column direction, or
    none.  The default is \code{"row"} if \code{symm} false, and
    \code{"none"} otherwise.}
  \item{na.rm}{logical indicating whether \code{NA}'s should be removed.}
  % image plot
  \item{revC}{logical indicating if the column order should be
    \code{\link{rev}}ersed for plotting, such that e.g., for the
    symmetric case, the symmetry axis is as usual.}
  \item{add.expr}{expression that will be evaluated after the call to
    \code{image}.  Can be used to add components to the plot.}
  \item{breaks}{(optional) Either a numeric vector indicating the
    splitting points for binning \code{x} into colors, or a integer
    number of break points to be used, in which case the break points
    will be spaced equally between \code{min(x)} and \code{max(x)}.}
  \item{symbreaks}{Boolean indicating whether breaks should be
    made symmetric about 0. Defaults to \code{TRUE} if the data includes
    negative values, and to \code{FALSE} otherwise.}
  \item{col}{colors used for the image. Defaults to heat colors
    (\code{heat.colors}).}
  % block separation
  \item{colsep, rowsep, sepcolor}{(optional) vector of integers indicating
    which columns or rows should be separated from the preceding columns
    or rows by a narrow space of color \code{sepcolor}.}
  \item{sepwidth}{(optional)  Vector of length 2 giving the width (colsep) or height (rowsep) the separator box
   drawn by colsep and rowsep as a function of the width (colsep) or
   height (rowsep) of a cell. Defaults to \code{c(0.05, 0.05)}}
  % cell labeling
  \item{cellnote}{(optional) matrix of character strings which will be
    placed within each color cell, e.g. p-value symbols.}
  \item{notecex}{(optional) numeric scaling factor for \code{cellnote}
    items.}
  \item{notecol}{(optional) character string specifying the color for
    \code{cellnote} text.  Defaults to "green".}
  \item{na.color}{Color to use for missing value (\code{NA}). Defaults
    to the plot background color.}
  % level trace
  \item{trace}{character string indicating whether a solid "trace" line
    should be drawn across 'row's or down 'column's, 'both' or 'none'.
    The distance of the line from the center of each color-cell is
    proportional to the size of the measurement. Defaults to 'none'.}
  \item{tracecol}{character string giving the color for "trace"
    line. Defaults to "cyan".}
  \item{hline, vline, linecol}{Vector of values within cells where a
    horizontal or vertical dotted line should be drawn.  The color of
    the line is controlled by \code{linecol}.  Horizontal  lines are only
    plotted if \code{trace} is 'row' or 'both'.  Vertical lines are only
    drawn if \code{trace} 'column' or 'both'.   \code{hline} and
    \code{vline} default to the median of the breaks, \code{linecol}
    defaults to the value of \code{tracecol}.}
  % Row/Column Labeling
  \item{margins}{numeric vector of length 2 containing the margins
    (see \code{\link{par}(mar= *)}) for column and row names, respectively.}
  \item{ColSideColors}{(optional) character vector of length \code{ncol(x)}
    containing the color names for a horizontal side bar that may be used to
    annotate the columns of \code{x}.}
  \item{RowSideColors}{(optional) character vector of length \code{nrow(x)}
    containing the color names for a vertical side bar that may be used to
    annotate the rows of \code{x}.}
  \item{cexRow, cexCol}{positive numbers, used as \code{cex.axis} in
    for the row or column axis labeling.  The defaults currently only
    use number of rows or columns, respectively.}
  \item{labRow, labCol}{character vectors with row and column labels to
    use; these default to \code{rownames(x)} or \code{colnames(x)}, 
    respectively.}
  \item{srtRow, srtCol}{angle of row/column labels, in degrees from horizontal}
  \item{adjRow, adjCol}{2-element vector giving the (left-right,
    top-bottom) justification of row/column labels (relative to the text
           orientation).} 
  \item{offsetRow, offsetCol}{Number of character-width spaces to place
           between row/column labels and the edge of the plotting region.}
  % Color key and density info
  \item{key}{logical indicating whether a color-key should be shown.}
  \item{keysize}{numeric value indicating the size of the key}
  \item{density.info}{character string indicating whether to superimpose
    a 'histogram', a 'density' plot, or no plot ('none') on the
    color-key.}
  \item{denscol}{character string giving the color for the density
    display specified by \code{density.info}, defaults to the same value
    as \code{tracecol}.}
  \item{symkey}{Boolean indicating whether the color key should be
    made symmetric about 0. Defaults to \code{TRUE} if the data includes
    negative values, and to \code{FALSE} otherwise.}
  \item{densadj}{Numeric scaling value for tuning the kernel width when
    a density plot is drawn on the color key.  (See the \code{adjust}
    parameter for the \code{density} function for details.)  Defaults to
    0.25.}
  % plot labels
  \item{main, xlab, ylab}{main, x- and y-axis titles; defaults to none.}
  % figure layout
  \item{lmat, lhei, lwid}{visual layout: position matrix, column height,
    column width.  See below for details}
  \item{scaleLabel}{What label should be used for the colorkey? "NULL" suppresses the label}
  \item{plotNew}{Logical. Should this heatmap be drawn on a new plot.
    If FALSE, you need to provide your own layout that will encompass
    all plots you intend to put in the figure.
    Refer to the argument information for
    \code{lmat}, \code{lhei}, and \code{lwid} as well as the details and
    examples below for more information on your options for this.}
  \item{...}{additional arguments passed on to \code{\link{image}} } %
}
\details{
  If either \code{Rowv} or \code{Colv} are dendrograms they are honored
  (and not reordered).	Otherwise, dendrograms are computed as
  \code{dd <- as.dendrogram(hclustfun(distfun(X)))} where \code{X} is
  either \code{x} or \code{t(x)}.\cr

  If either is a vector (of \dQuote{weights}) then the appropriate
  dendrogram is reordered according to the supplied values subject to
  the constraints imposed by the dendrogram, by \code{\link{reorder}(dd, 
    Rowv)}, in the row case.
  %%
  If either is missing, as by default, then the ordering of the
  corresponding dendrogram is by the mean value of the rows/columns, 
  i.e., in the case of rows, \code{Rowv <- rowMeans(x, na.rm=na.rm)}.
  %%
  If either is \code{\link{NULL}}, \emph{no reordering} will be done for
  the corresponding side.

  If \code{scale="row"} the rows are scaled to have mean
  zero and standard deviation one.  There is some empirical evidence
  from genomic plotting that this is useful.

  The default colors range from red to white (\code{heat.colors}) and
  are not pretty.  Consider using enhancements such
  as the \pkg{RColorBrewer} package, 
  \url{http://cran.r-project.org/src/contrib/PACKAGES.html#RColorBrewer}
  to select better colors.

  By default four components will be displayed in the plot.  At the top
  left is the color key, top right is the column dendogram, bottom left
  is the row dendogram, bottom right is the image plot.  When
  RowSideColor or ColSideColor are provided, an additional row or column
  is inserted in the appropriate location.   This layout can be
  overriden by specifiying appropriate values for \code{lmat},
  \code{lwid}, and \code{lhei}.  \code{lmat} controls the relative
  postition of each element, while \code{lwid} controls the column
  width, and \code{lhei} controls the row height. See the help page for
  \code{\link[graphics]{layout}} for details on how to use these
  arguments.
  
  If \code{plotNew = FALSE}, then \code{heatmap.mark} will not reset the
  current layout before plotting.
  Thus, if this operates on a brand new plot, each of the four elements
  (described above) will be plotted as a separate plot.
  Instead, before running the first plot you intend to include,
  using \code{\link{layout}} or a similar function to specify
  the order in which plots should be placed.
  See the usage examples below for an example.
}
\note{
  The original rows and columns are reordered \emph{in any case} to
  match the dendrogram, e.g., the rows by
  \code{\link{order.dendrogram}(Rowv)} where \code{Rowv} is the
  (possibly \code{\link{reorder}()}ed) row dendrogram.

  \code{heatmap.2()} uses \code{\link{layout}} and draws the
  \code{\link{image}} in the lower right corner of a 2x2 layout.
  Consequentially, it can \bold{not} be used in a multi column/row
  layout, i.e., when \code{\link{par}(mfrow= *)} or \code{(mfcol= *)}
  has been called.
  
  \code{heatmap.mark()} allows this behavior to be over-ridden using
  \code{plotNew = FALSE}, though the user is cautioned that arranging
  the output manually may take substantial effort.
}
\value{
  Invisibly, a list with components
  \item{rowInd}{row index permutation vector as returned by
    \code{\link{order.dendrogram}}.}
  \item{colInd}{column index permutation vector.}
  \item{call}{the matched call}
  \item{rowMeans, rowSDs}{mean and standard deviation of each row: only
    present if \code{scale="row"}}
  \item{colMeans, colSDs}{mean and standard deviation of each column: only
    present if \code{scale="column"}}
  \item{carpet}{reordered and scaled 'x' values used generate the main
    'carpet'}
  \item{rowDendrogram}{row dendrogram, if present}
  \item{colDendrogram}{column dendrogram, if present}
  \item{breaks}{values used for color break points}
  \item{col}{colors used}
  \item{vline}{center-line value used for column trace, present only if
    \code{trace="both"} or \code{trace="column"} }
  \item{hline}{center-line value used for row trace, present only if
    \code{trace="both"} or \code{trace="row"} }
  \item{colorTable}{A three-column data frame providing the lower and upper
    bound and color for each bin} 
}
\author{Mark Peterson, making small revisions to the fantastic code of
        Andy Liaw, original; and 
        R. Gentleman, M. Maechler, W. Huber, G. Warnes, revisions.}

\seealso{\code{\link{image}}, \code{\link{hclust}},\code{\link[gplots]{heatmap.2}}}

\examples{
## Below are examples of the changes made from heatmap.2()
##  for more complete examples of all this code can do
##  see ?heatmap.2

######################################
## Read in and prepare data to plot ##
######################################

## Find where the data is stored (or use your own)
pathToData <- system.file("",package="rnaseqWrapper",mustWork=TRUE)

## Read in the data
## Note, the files here are compressed,
##  but yours do not need to be
countData <- mergeCountFiles(paste(pathToData,"/data/",sep=""),".genes.results.txt.gz")

## limit to count data for 50 rows
## note that these are not, necessarily DE genes
toPlot <- countData[51:100,grep(".expected_count",names(countData))]

## Trim the names to make the plots a bit nicer:
names(toPlot) <- gsub(".expected_count","", names(toPlot))

#################
## Simple plot ##
#################

heatmap.mark(as.matrix(toPlot),cexCol = 0.75,labRow = FALSE)


#########################################
## More complex, add labels and legend ##
#########################################

myLabelColors <- rep(c("red","blue"),each = dim(toPlot)[2]/2)

heatmap.mark(as.matrix(toPlot),
             cexCol = 0.75,labRow = FALSE,
             scaleLabel = "",
             ColSideColors = myLabelColors)

par(xpd=TRUE) ## To allow legend on top of other stuff
legend(x="topleft",inset=c(-.02,.08), 
       bty="n", cex=.8, 
       legend= c("Female","Male"), 
       fill=unique(myLabelColors), 
       title="Sex") 
par(xpd=FALSE) ## To reset




##########################
## With multiple panels ##
##########################

## Set your own layout
## Note, that each heatmap plots 4 objects when no color labels are included
## So the offset for each additional one needs to b 4 + the options
## If you use row or column labels, additional plots are drawn
## In addition, you will likely want to play with the widths and 
## heights of each element.

baseLayout <- matrix(c(4,3,2,1), nrow = 2, byrow = TRUE)

layout(cbind(baseLayout,baseLayout + 4), 
       widths = c(1,2,1,2), heights = c(1,2), respect = FALSE)

heatmap.mark(as.matrix(toPlot),
             cexCol = 0.75,labRow = FALSE,
             scaleLabel = "",
             plotNew = FALSE)

heatmap.mark(as.matrix(toPlot),
             cexCol = 0.75,labRow = FALSE,
             scaleLabel = "",
             plotNew = FALSE)

 
}
\keyword{hplot}
