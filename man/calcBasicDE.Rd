\name{calcBasicDE}
\alias{calcBasicDE}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Calculate basics differential expression between pairs of columns
}
\description{
Calculates the pairwise difference between a series of colums.
%
This assumes either differences between individuals,
or between a single column for each group
(e.g. mean, median, or log there of).
%
This function does not calculate statistical significance,
and it is intended only for quick, course-scale analysis and visualization,
not for final publication.
}
\usage{
calcBasicDE(data,
            colID = "_mean_FPKM_log2",
            whichIndex = "allPairwise",
            matchEnd = TRUE,
            appendName = "diff")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{
  data.frame or matrix with genes as rows and columns
  containing information, such as counts, FPKM, etc.

}
  \item{colID}{
  Which columns should be used for DE analysis,
  takes a single column per group,
  so expects either a single column per treatment (e.g. mean),
  or will report individual differences. 
  %
  Can be a vector for several things
  either character (to be grepped) or
  numeric to indicate which cols to analyze.
  %
  Accepts regexp arguments, so be careful.

}
  \item{whichIndex}{
  Which colID (e.g. "Control") should the others be compared against.
  %
  Can be numeric (which of the colID to use)
  or characther for grep against the names of the colID columns (can have regexp).
  %
  whichIndex="allPairwise" (default) calculates all pairwise comparisons.
}
  \item{matchEnd}{
  if colID is character,
  should only the end of the column name be matched.
  %
  This avoids matching unintended columns.
}
  \item{appendName}{
  What string should be added to the end of each output column?
  %
  Output column names will be "firstColName_minus_secondColName_appendName"
}
}
\details{
This function calculates the difference between pairs of columns,
but does not report a statistical test.
%
It is a simple wrapper to find the raw numerical differences
between several columns,
and output sensibly named columns.

}
\value{
Returns a data.frame with one column for each calculated difference.
%
Rows and names match the input data.frame, so can be appended to the original data.frame
using either cbind or merge.
}
\author{
Mark Peterson
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{DESeqWrapper}}, \code{\link{calcCombVals}}
}
\examples{

## Only run if DESeq is available
if(require(DESeq)){

## Create sample data
## Could be reads or FPKM from your input

exampleCounts <- counts(makeExampleCountDataSet())


testComb <- calcCombVals(exampleCounts,
                         groupID=c("A","B","*"),
                         colID=c("all"))
head(testComb)

basicTest <- calcBasicDE(testComb,"all_mean")

head(basicTest)

}



}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
