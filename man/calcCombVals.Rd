\name{calcCombVals}
\alias{calcCombVals}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Calculate group values from RNAseq data
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
This script uses grep to combine the data from all individuals in a group,
for a specific data type(s),
and calculates the summary statistic requested.
}
\usage{
calcCombVals(data, groupID, colID = "FPKM", combineCols = TRUE,
matchEnd = TRUE, FUN = "mean", functionName = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{
  A data.frame or matrix containing the individual data (columns) for 
  several genes (rows) from which to calculate the test statistic \code{FUN}
  
}
  \item{groupID}{
  A character vector or list. If character, include the group IDs, to be used as patterns in grep.
  %
  Make sure the names are unique enough to match only what you want them to.
  %
  To include all groups for a data type, set \code{groupID = "all","", or "*"}.
  %
  If a list, give the column numbers for each group,
  named with your desired group output name
  (e.g. \code{groupID = list(control = c(1,2,3), treated = c(4,5,6))} )
}
  \item{colID}{
  A character vector of the columns of interest (e.g. FPKM).
  %
  To include all columns for each group, set \code{colID = "all","", or "*"}.
  %
  \code{colID} is ignored if \code{groupID} is a list.
}
  \item{combineCols}{
  Logical, should the resulting columns be put into one data.frame (default, \code{combineCols = TRUE}),
  or left as enteries in a list.
}
  \item{matchEnd}{
  Logical, should the \code{colId} pattern only match the end of the string.
}
  \item{FUN}{
  Either be a function or a character that can be coerced to function using \code{match.fun(FUN)}.
  %
  This will be used to name the output columns if \code{functionName} is not set.
  %
  If not a character, set functionName to assign column names for the output
}
  \item{functionName}{
  A string to use in naming the output columns or list names.
  %
  Defaults to \code{as.character(FUN)} if not set.
}
}
\details{
This function uses grep to grab a series of columns (by group and by column type),
and then runs a summary function (\code{FUN}) on each set.
%
This can effectivley calculate group statistics for visualization and course analysis,
such as means, medians, etc.
}
\value{
If \code{combineCols = TRUE}, returns a data.frame with one column for each set (groupID by colID).
%
If \code{combineCols = FALSE}, returns a list with one entry for each set (groupID by colID).
}
\author{
Mark Peterson
}


\seealso{
\code{\link{calcBasicDE}}
}
\examples{

## Create sample data
## Could be reads or FPKM from your input
require(DESeq)
exampleCounts <- counts(makeExampleCountDataSet())


testComb <- calcCombVals(exampleCounts,
                         groupID=c("A","B","*"),
                         colID=c("all"))
head(testComb)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
