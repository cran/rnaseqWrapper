\name{readVariantFiles}
\alias{readVariantFiles}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Read in variant files for RNAseq
}
\description{
Reads in the variant files from each sample of an RNAseq experiment
and then combines the files into a single data.frame,
useful for several downstream applications.
}
\usage{
readVariantFiles(fileDir,
                 sepSymbol = "_",
                 fileID = "*_variants.txt",
                 firstColName = "SEQ_ID",
                 fileSep = "\t",
                 idCols = 5,
                 refPosCol = "Reference.Position",
                 colToSort = "Coverage",
                 removeDups = TRUE,
                 returnMerged = TRUE,
                 returnSing = FALSE,
                 limitGenes = NULL,
                 omitRefMatches = TRUE,
                 refAlleleCol = "Reference$",
                 varAlleleCol = "Allele")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{fileDir}{
  The path to the directory containing all of the variant files.
}
  \item{sepSymbol}{
  The symbol that separates the sample names from other info in 
  the file name.
  Used to pull names for columns in the combined file. 
  Set to "" if the full file name should be used.
}
  \item{fileID}{
  character to use to limit which files are imported; regular expressions allowed
}
  \item{firstColName}{
  What should the first column be renamed to.
  Set to NULL or "" to leave the column as is.
  Intended to stanardize and to match the column names in other
  parts of the analysis pipeline.
}
  \item{fileSep}{
  The column delimiter used in the file (e.g. "," or "\\t")
}
  \item{idCols}{
  How many columns of position information are there?
  Avoids including duplicated information in the combined ouput.
}
  \item{refPosCol}{
  Which column has the reference position? 
  Can be numeric or character
}
  \item{colToSort}{
  Which column should be used to keep one line per position,
  if \code{removeDups == TRUE}?
  Can be numeric or character.
}
  \item{removeDups}{
  Logical, should duplicates at a position be removed?
  This is necessary to avoid massive over merging
}
  \item{returnMerged}{
  Logical, should the merged variants be returned?
}
  \item{returnSing}{
  Logical, should each of the separate variant files be returned?
}
  \item{limitGenes}{
  A character vector listing the genes to include.
  %
  This can be useful if your variant files include genes
  that you are not interested in analyzing
  (e.g. things without a blast hit).
}
  \item{omitRefMatches}{
  Logical, should 'variants' which match the reference be excluded?
  This is useful if your variant file includes rows for reads
  aligning to the reference allele,
  which may be accidentally set as the main 'variant' in this function.
  Defaults to TRUE.
  }
  \item{refAlleleCol}{
  Which column has the reference allele?
  Can be numeric or character.
}
  \item{varAlleleCol}{
  Which column has the variable alleles?
  Can be numeric or character.
}  

}


\details{
Reads in the variant files from \code{fileDir} and merges by gene and position.
}
\value{
Output is based on returnMerged & returnSing returns:

If returnMerged: a data.frame with the merged variants

If returnSing:   a list of the singVariants (cleaned if removeDups=TRUE)

If both TRUE:    a list with both of the above
}
\author{
Mark Peterson
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\examples{

\dontrun{

mergedVariants <- readVariantFiles (
      fileDir="path/to/variant/directory",
      fileID = "*_variants.txt",
      firstColName = "SEQ_ID",
      idCols = 4, 
      refPosCol = "Region"
      ) 

} 
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
