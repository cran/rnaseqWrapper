\name{nSynNonSites}
\alias{nSynNonSites}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Calculate the number of (non) synonomous sites
}
\description{
From gene sequences, determine the
number of synonomous/non-synonomous sites.
}
\usage{
nSynNonSites(geneNames,
             codonStartPos = "cds",
             referenceSeqs)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{geneNames}{
  A character vector or list (each with character element) giving the gene names to be analyzed.
  }
  \item{codonStartPos}{
  If "cds" assumes all start at position 1 (default).
  %
  In the future, can be a vector giving which position each gene starts at; currently not handled.
}
  \item{referenceSeqs}{
  List of FASTA sequences, with names being gene names as listed in \code{seqIDcol}
  and containing the sequences.
  This is the format produced by \code{read.fasta}, but can be emulated.
}
}
\value{
Returns a matrix of info for each gene with:
\item{nSynSites}{the number of sites deemed synonomous
      (includes half of the two-fold synonomous sites)}
\item{nNonSynSites}{the number of sites deemed non-synonomous
      (includes half of the two-fold synonomous sites)}
}
\author{
Mark Peterson
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{determineSynonymous}},
\code{\link{kaksFromVariants}},
\code{\link[seqinr]{kaks}},
\code{\link[seqinr]{read.fasta}}
}
\examples{

## Load needed data
data(fastaExample)

nSynNonSites(names(fastaExample),
             referenceSeqs=fastaExample)


}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
