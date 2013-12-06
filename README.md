To install:
===========

- Download the tar.gz file from the "downloads" tab
- Open R, and setwd() to the location of the tar file
- Run the following:

Code:

	### Install dependencies ###
	install.packages(c("ecodist","gplots","seqinr","gdata"))
	
	source("http://bioconductor.org/biocLite.R")
	biocLite(c("DESeq","topGO"))
	
	## note that DESeq, topGO and seqinr are only "suggested" and only needed for certain functions
	
	### Install this package ###
	install.packages("rnaseqWrapper_1.0.tar.gz",repos=NULL,type="source")


To start using
==============

### Load the package ###
library(rnaseqWrapper)

### List functions available in rnaseqWrapper ###
lsf.str("package:rnaseqWrapper")


Available functions
===================

I will write some sort of vignette in the near(ish) future (I hope).


### Merge count data ##

- mergeCountFiles - Reads all the count files from a directory and
			merges them into a single file.


### Run DESeq ###

- DESeqWrapper - runs DESeq with sensible defaults and outputs the results and some plots


### Make basic calculations on data ##

These represent the most commonly done/used calculations on basic read/FPKM data,
and (hopefully) make it easier to calculate them

- calcLogVal - Calculates the log value (your choice of base)
                for multiple similarly named columns at once
- calcCombVals - Calculates summary stats for basic columns
                  (e.g. reads) based on matches,
                  thus allowing separate calculations by treatment.
- calcBasicDE - Calculates the difference between treatments,
                  (generally by the mean of log values,
                  calculated with the above)


### A distance function ###

- calcHornMatrix - Calculates a distance measure between samples,
                    which is useful for plotting.
                    (See the help for a good example.)

### A slight tweak to a plot ###

- heatmap.mark - This marginally tweaks the heatmap.2 function,
                  but allows a bit more control useful for DESeq.


### Reading in variant files ###

These are just two common variant formats,
  but most of the other possible formats won't need to be modified
  for downstream use in the package.
  
- readVariantFiles - Reads in individual variant files,
                      and can merge them.
                      This is especially useful for CLC genomics,
                      and other formats run separately on different samples.
- parseVarScan - Separates the columns of varScan output format,
                  which improves some usability.
                  This step is *not* needed for downstream use,
                  but may still prove helpful for other applications.


### Variant Analysis ###

These functions should work on nearly any input format
 of variant information, and (I hope)
 represent the most commonly used basic analyses.
All but calculateThirdPosBias require a reference file,
and even calculateThirdPosBias is only sort of worthwhile without one

- kaksFromVariants - Calculate Ka/Ks ratios
- nSynNonSites - Calculate the number of synonymous and non-synonymous sites in genes
                  from a reference.
                  Useful to complement the Ka/Ks output for genes with no identified variants.
- determineSynonymous - Determines whether each variant is synonymous or non-synonymous
                          compared to the reference position.
                          Also calculates dN/dS (wihout respect to sites).
- calculateThirdPosBias - Calculate the portion of variants (in each gene)
                            at each codon position.
                            A nominal proxy for Ka/Ks and dN/dS,
                            if needed.
                            When no reference is used,
                            it assumes the most common variant position is the third position.


Miscellaneous info
==================

For more usage information, or to report bugs and enhancement requests, please contact the authors.
This package was very recently converted from in-house scripts, so some idiosyncrasies may persist. 
