\name{calcLogVal}
\alias{calcLogVal}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Calculate log value of RNAseq columns
}
\description{
Calculate the log value of a series of columns,
allowing an offset to avoid returning "-Inf."
}
\usage{
calcLogVal(data, colID = "FPKM", offset = 0.1,
           setBase = 2, matchEnd = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{
  A matrix or data.frame containing gene (row) data for several individuals (columns). 
}
  \item{colID}{
  Either a numeric vector of columns to calculate the log of,
  or a character vector with patterns (e.g., FPKM) to match in the names of \code{data}.
  %
  If a character vector, make sure the names are unique enough to match only what you want them to,
  as they will be called to grep.
}
  \item{offset}{
  How much to add before taking log to avoid returning \code{-Inf}.
}
  \item{setBase}{
  A positive number to pass to \code{log} to set the logarthimic base.
  %
  Defaults to \code{setBase = 2}
}
  \item{matchEnd}{
  Logical, should the \code{colId} pattern only match the end of the string.
}
}
\value{
Returns a data.frame with the log value of the desired columns.
%
Rows match the input data, so can be appended using cbind or merge.
}
\author{
Mark Peterson
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\examples{
## Create sample data
## Could be reads or FPKM from your input
require(DESeq)
exampleCounts <- counts(makeExampleCountDataSet())

## Only calculate for the "2" columns
## This could be reads, if you have multiple column types
testLog <- calcLogVal(exampleCounts,
                      colID="2",
                      matchEnd=TRUE)
head(testLog)

## Calculate log of all columns
testLog2 <- calcLogVal(exampleCounts,
                       colID="*",
                       setBase=2)
head(testLog2)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
