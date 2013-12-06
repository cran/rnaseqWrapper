\name{DESeqWrapper}
\alias{DESeqWrapper}
\alias{plotDE}
\alias{plotDispEsts}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
A wrapper for DESeq
}
\description{
This function provides a useful wrapper for the DESeq package,
automating several of the manual steps to provide a basic DE analysis.
%
Users should use this as a guide, not necessarily as a final analysis.
%
The functions \code{plotDE} and \code{plotDispEsts} are only called from
within this function.
}
\usage{
DESeqWrapper(countData,
             conditions,
             whichGeneNames = 0,
             outNamePrefix = "DESeqOutputs",
             comps = "allPairwise",
             conds = NULL,
             colorSet = NULL,
             makePDFs = TRUE,
             writeScaled = FALSE,
             writeDE = TRUE,
             pCut = 0.05,
             dispMethod = "pooled",
             dispSharingMode = "maximum")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{countData}{
  A data.frame or matrix with raw count data for each
  gene (row) and sample (column).
}
  \item{conditions}{
  Character vector with the groups to be analyzed.
}
  \item{whichGeneNames}{
  Numeric or character, which column has the gene names.
  Defaults to 0, which is rownames (preferred).
}
  \item{outNamePrefix}{
  A string to prepend to written files;
  can included path specification.
}
  \item{comps}{
  character vector of which contrasts to run
  in the format 1vs2 with numbers matching order of \code{conditions} above
}
  \item{conds}{
  A character vector of the conditions for each column,
  matching the order of the columns in \code{countData}.
  If "NULL" (default) the function will use grep on conditions against column names
  to automatically generate the groups
}
  \item{colorSet}{
  Vector of colors, specified in any valid R format,
  to use as labels for the conditions.
  If "NULL" (default), default colors will be used.
}
  \item{makePDFs}{
  Logical, should figures be output as pdfs.
  If false, no figures will be generated.
}
  \item{writeScaled}{
  Logical, should the scaled countData be written as a .txt file.
}
  \item{writeDE}{
  Logical, should the DE results be written as .txt files.
}
  \item{pCut}{
  What (FDR-corrected) q-value should be used as a cut-off.
}
  \item{dispMethod}{
  Which method should be used for estimating dispersion by DESeq?
  See \code{\link[DESeq]{estimateDispersions}} for details and available options.
}
  \item{dispSharingMode}{
  Which sharing mode should be used for estimating dispersion by DESeq?
  See \code{\link[DESeq]{estimateDispersions}} for details and available options.
}

}
\value{
Writes txt and pdf files as run, and returns a list with:
\item{deOutputs}{A list with one data.frame for each contrast analyzed}
\item{normalizedReads}{The normalized read data}
\item{isSignificant}{A data.frame telling whether each gene is sig for each contrast}

}
\author{
Mark Peterson
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\examples{

## Create an example count data set
require(DESeq)
exampleCounts <- counts(makeExampleCountDataSet())[1:500,]

## Note, from your data, this might look like:
# exampleCounts <- myInputData[,grep("READS",names(myInputData))]
# row.names(exampleCounts) <- myInputData$geneNameColumn

## Note, outputs save to disk are turned off
## Set each to TRUE to save to your working directory
test <- DESeqWrapper(exampleCounts,
                     conditions=c("A","B"),
                     writeScaled=FALSE,
                     writeDE=FALSE,
                     makePDFs=FALSE)

## Look at the outputs
head(test$deOutputs$AvsB)
head(test$normalizedReads)
head(test$isSignificant)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
