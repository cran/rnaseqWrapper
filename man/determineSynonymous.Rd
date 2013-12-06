\name{determineSynonymous}
\alias{determineSynonymous}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Determine whether or not variants are synonomous
}
\description{
From a table of variants, determine whether each is synonymous or non-synonomous,
assuming all are in the coding region.
}
\usage{
determineSynonymous(varTable,
                    seqIDcol = 1,
                    refPosCol = "Reference.Position",
                    refAlleleCol = "Reference",
                    varAlleleCol = "Allele",
                    readCutoffs = 1,
                    colprepend = "snvs_",
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
  \item{colprepend}{
  What name should the output columns be prepended with.
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
Returns a list with:
\item{variantInfo}{A matrix of info for each variant,
      including the reference and variant values for
      allele and amino acid, and whether or not is synonomous}
\item{geneInfo}{A matrix of info for each gene,
      with number and proportion for both synonymous and non-synonomous
      variants for the gene.}
}
\author{
Mark Peterson
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link[seqinr]{read.fasta}},
\code{\link{nSynNonSites}},
\code{\link{kaksFromVariants}}
}
\examples{

## Load needed data
data(varScanExample)
data(fastaExample)

determineSynonymous(varTable=varScanExample,
                    refPosCol=2,
                    refAlleleCol="Ref",
                    varAlleleCol="Var",
                    referenceSeqs=fastaExample)
                 

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
