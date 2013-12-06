\name{kaksFromVariants}
\alias{kaksFromVariants}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Calculate Ka/Ks ratios from a table of variants
}
\description{
From a table of variants, determine the ka/ks ratio and the
number of synonomous/non-synonomous sites.
}
\usage{
kaksFromVariants(varTable,
                    seqIDcol = 1,
                    refPosCol = "Reference.Position",
                    refAlleleCol = "Reference",
                    varAlleleCol = "Allele",
                    readCutoffs = 1,
                    codonStartPos = "cds",
                    referenceSeqs)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{varTable}{
  A data.frame with rows for each position in each gene with a variant present.
  %
  Columns give various information for each included individual.
  %
  This is expecting the format from \code{\link{readVariantFiles}},
  which should be easy to emulate.
  Small changes to the names make it ideal for VarScan formats as well.
  }
  \item{seqIDcol}{
  Which column is the sequence ID in?
  Can be numeric or character.
}
  \item{refPosCol}{
  Which column is the referencece position in?
  Can be numeric or character.
}
  \item{refAlleleCol}{
  Which column has the reference allele?
  Can be numeric or character.
}
  \item{varAlleleCol}{
  Which column has the variable alleles?
  Can be numeric or character.
}
  \item{readCutoffs}{
  How many variable positions need to be present to calculate bias.
  Set to 1 (or 0 or NULL) to include all.
  Without a reference, small numbers will be almost meaningless.
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
\item{ka}{rate of non-synonomous subsitutions}
\item{ks}{rate of synonomous subsitutions}
\item{kaks}{the ka/ks ratio;
            Note that ka/ks will be NA for genes with no scored variants
            and for any gene for which ka or ks are returned as negative}
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
%% ~~objects to See Also as \code{\link{help}}, ~~~
\code{\link{nSynNonSites}},
\code{\link{determineSynonymous}},
\code{\link[seqinr]{kaks}},
\code{\link[seqinr]{read.fasta}}
}
\examples{

## Load needed data
data(varScanExample)
data(fastaExample)

kaksFromVariants(varTable=varScanExample,
                 refPosCol=2,
                 refAlleleCol="Ref",
                 varAlleleCol="Var",
                 referenceSeqs=fastaExample)
                 

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
