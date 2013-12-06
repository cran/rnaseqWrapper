\name{calculateThirdPosBias}
\alias{calculateThirdPosBias}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Calculate the third position bias of polymorphisms
}
\description{
Determines which variant positions are in the third codon position,
or estimates that based on frequency,
and reports the proportion of variants in each gene that are
in the third position.
%
These are presumed to be synonomous more often,
but if codon information is known,
users should run \code{determineSynonymous} instead.
}
\usage{
calculateThirdPosBias(varTable,
                      seqIDcol = 1,
                      refPosCol = "Reference.Position",
                      readCutoffs = 0,
                      colprepend = "nVar_",
                      codonStartPos = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{varTable}{
  A data.frame with rows for each position in each gene with a variant present.
  %
  Columns give various information for each included individual.
  %
  This is expecting the format from \code{\link{readVariantFiles}},
  which should be easy to emulate
}
  \item{seqIDcol}{
  Which column is the sequence ID in?
  Can be numeric or character.
}
  \item{refPosCol}{
  Which column is the referencece position in?
  Can be numeric or character.
}
  \item{readCutoffs}{
  How many variable positions need to be present to calculate bias.
  Set to 1 (or 0 or NULL) to include all.
  Without a reference, small numbers will be almost meaningless.
}
  \item{colprepend}{
  What name should the output columns be prepended with
}
  \item{codonStartPos}{
  If "cds" assumes all start at position 1 (default).
  %
  If NULL, will treat the frame as unknown
  and assign the most frequent position as the putative third position.
  %
  In the future, can be a vector giving which position each gene starts at; currently not handled.
}
}
\value{
Returns a matrix with genes as rows and with the
number of variants in each position and
proportion of variants in the third position
as columns.
}
\author{
Mark Peterson
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{readVariantFiles}}, \code{\link{determineSynonymous}}
}
\examples{

## Load example data
data(varScanExample)

calculateThirdPosBias(varScanExample,
                      refPosCol="Position",
                      codonStartPos="cds")

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
