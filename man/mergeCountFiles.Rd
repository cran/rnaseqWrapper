\name{mergeCountFiles}
\alias{mergeCountFiles}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
  Merge multiple expression count data files for RNAseq
}
\description{
  Reads in the count data files from each sample of an RNAseq experiment
  and then combines the files into a single data.frame,
  useful for several downstream applications.
}
\usage{
  mergeCountFiles(fileDir,
                 fileID = "*.genes.results$",
                 fileSep = "\t",
                 seqIDcol = 1,
                 colsToKeep = c("expected_count","FPKM"),
                 idCols = NULL,
                 minMatchToMerge = 0.5)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{fileDir}{
    The path to the directory containing all of the count data files.
  }
  \item{fileID}{
    Character to use to limit which files are imported; regular expressions allowed.
    This \code{fileID} is also removed from the file names when naming the output columns.
    
  }
  \item{fileSep}{
  The column delimiter used in the file (e.g. "," or "\\t")
  }
  \item{seqIDcol}{
  Which column has the gene name or other identifier?
  Can be numeric or character.
  }
  \item{colsToKeep}{
  Which columns of info should be kept for the output?
  Can be a vector of either numeric or character.
  }
  \item{idCols}{
  Which columns of general site information should be kept?
  This limits these to one single column, rather than one for each sample.
  Note, that row.names of the output will already match \code{seqIDcol}.
  This can be a vector of either numeric or character,
  but must match the format of \code{seqIDcol} \emph{if}
  the rows of your input data are not all in the same order.
  }
  \item{minMatchToMerge}{
  If your data are not in the same order,
  what portion of gene names must be in common to proceed with merge?
  This is a protection step to avoid accidentally merging datasets
  from different references.
  }

  
}


\details{
  Reads in the count data files from \code{fileDir} and merges by gene.
  It checks to see if the information is all in the same order, 
  and issues a warning if not because it may suggest data are from different reference files.
}
\value{
  Returns a data.frame with a row for each gene, and columns (named from the file names),
  for each sample for each data type kept
}

\author{
  Mark Peterson
}

%% ~Make other sections like Warning with \section{Warning }{....} ~
  
\examples{
  
## Find where the data is stored (or use your own)
pathToData <- system.file("",package="rnaseqWrapper",mustWork=TRUE)

## Read in the data
## Note, the files here are compressed,
##  but yours do not need to be
testCountData <- mergeCountFiles(paste(pathToData,"/data/",sep=""),".genes.results.txt.gz")

## Display the contents
head(testCountData)

  
  
\dontrun{
    ## On your data, it will look more like:
    mergedCountData <- mergeCountFiles("/path/to/countData")
    head(mergedCountData)    
  } 
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
