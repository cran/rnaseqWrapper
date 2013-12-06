\name{rnaseqWrapperData}
\alias{varScanExample}
\alias{fastaExample}
\docType{data}
\title{
Data for use in examples for the rnaseqWrapper package
}
\description{
  A sample of 86 rows (from three genes) of a VarScan output,
  and the corrresponding fasta sequence information
  (read in with \code{read.fasta}).
}
\usage{data(varScanExample)
data(fastaExample)
}


\source{
These are from a currently unpublished analysis, and were randomly chosen.
}
\examples{
data(varScanExample)
head(varScanExample)

data(fastaExample)
fastaExample
}
\keyword{datasets}
