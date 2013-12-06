\name{rnaseqWrapperCountData}
\alias{female_1.genes.results}
\alias{female_2.genes.results}
\alias{female_3.genes.results}
\alias{male_1.genes.results}
\alias{male_2.genes.results}
\alias{male_3.genes.results}
\docType{data}
\title{
  Expression data for use in examples for the rnaseqWrapper package
}
\description{
  Example expression data for 2654 genes,
  each of six files is data for a different sample.
  (read in with \code{mergeCountFiles}).
}
\usage{
data(male_1.genes.results)
}
\format{
Each file is a tab-delimited output from RSEM.  
  
}


\source{
  These are from a currently unpublished analysis, and were randomly chosen.
}
\seealso{
\code{\link{mergeCountFiles}}
}
\examples{
  data(male_1.genes.results)
  
  ## Will normally read in with mergeCountData()
}
\keyword{datasets}
