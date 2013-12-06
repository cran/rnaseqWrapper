\name{calcHornMatrix}
\alias{calcHornMatrix}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Calculate a Horn distance matrix
}
\description{
This function calculates the pairwise Horn distance between
samples based on relative presence of observed variables.
}
\usage{
calcHornMatrix(inputTable)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{inputTable}{
  A matrix or data.frame of relative frequencies of whatever is being measured.
  %
  Each row is a variable (e.g. gene)
  and each column is a sample (e.g. individual).
  %
  The algorithm expects each column to sum to 1.
  %
  That is, each entry should be the portion of observations (e.g. reads)
  representing the variable (gene) from the total observations for a sample (individual).
}
}
\value{
Returns a matrix of pair-wise similarity scores for each column.
}
\references{
This was (heavily) modified from a script provided by a collaborator of Gina Lamendella's.
I need to get more information
}
\author{
Mark Peterson
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\examples{

## Create sample counts
## Thes could be the reads or FPKM from input data instead
require(DESeq)
exampleCounts <- counts(makeExampleCountDataSet())

testHorn <- calcHornMatrix(exampleCounts)
head(testHorn)


## Plot the results
distMat <-as.dist( (1-testHorn), diag=FALSE, upper=FALSE)

# scores to plot MDS (ecodist)
scores_ADNA <-nmds(distMat, mindim=2, maxdim=2) 
scores_ADNA <- nmds.min(scores_ADNA)

# Set colors to match treatments
treatCol <- c("red","red","blue","blue","blue")

plot(scores_ADNA[,1:2],pch=19,col=treatCol)



}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
