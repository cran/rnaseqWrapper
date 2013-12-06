\name{runGOAnalysis}
\alias{runGOAnalysis}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Run basic GO analysis
}
\description{
This function wraps the \code{\link[topGO]{topGO-package}}
an provides a streamlined appraoch to GO analysis.
%
Sensible defaults are included,
though may not be sufficient for all uses.
}
\usage{
runGOAnalysis(sigGenes,
              expGenes,
              goAnno,
              pValThresh = 1,
              plotGO = FALSE,
              ontology = "BP",
              algorithm = "weight",
              statistic = "fisher",
              description = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{sigGenes}{
A character vector with the names of significant genes.
}
  \item{expGenes}{
A character vector with the names of all reference genes,
for example, those expressed in the tissu of interest.
}
  \item{goAnno}{
A (named) list of of character vectors with GO identifiers for each gene,
such as returned by \code{\link[topGO]{readMappings}}
}
  \item{pValThresh}{
Numeric, what p-value (not corrected, see value below) threshold should
be used to determine what should be returned.
%
Defaults to 1 to return all GO terms analyzed to allow the user to
perform multiple-testing corrections as desired.
}
  \item{plotGO}{
Logical - Should a plot be generated? If TRUE,
plots to the currently active device.
}
  \item{ontology}{
Which ontology should be analyzed by \code{\link[topGO]{runTest}}?
Can be any of "BP", "MF", or "CC",
for Biological Process, Molecular Function, or Cellular Component,
respectively.
}
  \item{algorithm}{
Which algorithm should be used by \code{\link[topGO]{runTest}}?
Available values can be found with \code{\link[topGO]{whichAlgorithms}};
defaults to "weight".
}
  \item{statistic}{
Which statistic should be used by \code{\link[topGO]{runTest}}?
Available values can be found with \code{\link[topGO]{whichTests}};
defaults to "fisher".
}
  \item{description}{
A string to use in describing the go data set.
Not currently used because the GOData object is not returned.
}
}
\value{
Returns a data.frame with a row for each significant GO term.
Note that it returns p-values, rather than adjusted p-values.
The authors of topGO appear to feel strongly about this,
so I have deferred to their choice.
%
I do agree with them that the GO graph is inherently
non-independent making most methods for correction overly-conservative.
%
In addition, the default method ("weight") has a built in correction.
}

\author{
Mark Peterson
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\examples{

## Load the sample data from topGO
require(topGO)
data(GOdata)

## Recreate the GO annotation
## NB: you will likely do this with readMappings()
goAnno <- inverseList(genesInTerm(GOdata,usedGO(GOdata)))

testOut <- runGOAnalysis(sigGenes(GOdata),
                         allGenes(GOdata),
                         goAnno,
                         algorithm = "classic",
                         pValThresh = 0.05)
                         
head(testOut)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
