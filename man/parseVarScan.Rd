\name{parseVarScan}
\alias{parseVarScan}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Parse a VarScan output
}
\description{
Separate the pool and sample call information into usable columns.
}
\usage{
parseVarScan(file, sampleNames = NULL, ignoreIndels = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{file}{
Either a character vector of length 1 giving the name of a tab-separated VarScan file to read in, or
a data.frame or matrix containing the VarScan output table.
}
  \item{sampleNames}{
A character vector giving the names to assign to the split sample calls.
}
  \item{ignoreIndels}{
Logical: should positions with indels be omitted from the returned file (default: TRUE)
}
}
\details{
This assumes that the headers have not been modified
}
\value{
Returns a data.frame with rows for each row (ommiting the indels if ignoreIndels == TRUE), but
with each portion of the calls separated.
}
\references{
Relies on the VarScan output documented here:
http://varscan.sourceforge.net/using-varscan.html
}
\author{
Mark Peterson
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\examples{

## Get example data
## This could be just read in using read.table for your data
data(varScanExample)

parseTest <- parseVarScan(varScanExample,
                          sampleNames=LETTERS[1:10])

head(parseTest)



}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
