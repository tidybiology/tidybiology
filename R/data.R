#' Human Genome Summary.
#'
#' A dataset containing summary information of the human genome.
#'
#' @format A data frame with 24 rows and 14 variables:
#' \describe{
#'   \item{chromosome}{Characters of the 23 chromosome pairs in cell nuclei, including the X and Y chromosome; mitochondrial DNA is excluded.}
#'   \item{length_mm}{Chromosome length calculated by multiplying the number of base pairs by 0.34 nanometers, the distance between base pairs in the DNA double helix.}
#'   \item{basepairs}{Number of base pairs, based on a reference genome that does not represent the sequence of any specific individual (Data source: Ensembl genome browser release 87, December 2016 for most values).}
#'   \item{variations}{Number of variations of unique DNA sequence differences that have been identified in the individual human genome sequences analyzed by Ensembl as of December 2016.}
#'   \item{protein_codinggenes}{Number of enes encoding proteins is based on the number of initial precursor mRNA transcripts, and does not include products of alternative pre-mRNA splicing, or modifications to protein structure that occur after translation.}
#'   \item{pseudo_genes}{Number of non-functional remnants of protein-coding genes}
#'   \item{totallongnc_rna}{Number of long non-coding RNAs -- RNA molecules longer than 200 bases that do not have protein-coding potential. These include: ribosomal RNAs, or rRNAs (the RNA components of ribosomes), and a variety of other long RNAs that are involved in regulation of gene expression, epigenetic modifications of DNA nucleotides and histone proteins, and regulation of the activity of protein-coding genes.}
#'   \item{totalsmallnc_rna}{Number of small non-coding RNAs -- RNAs of as many as 200 bases that do not have protein-coding potential. These include: microRNAs, or miRNAs (post-transcriptional regulators of gene expression), small nuclear RNAs, or snRNAs (the RNA components of spliceosomes), and small nucleolar RNAs, or snoRNA (involved in guiding chemical modifications to other RNA molecules).}
#'   \item{mi_rna}{Number of microRNA (abbreviated miRNA) -- small non-coding RNA molecule (containing about 22 nucleotides) found in plants, animals and some viruses, that functions in RNA silencing and post-transcriptional regulation of gene expression.}
#'   \item{r_rna}{Number of ribosomal ribonucleic acid (rRNA) -- the RNA component of the ribosome, which is essential for protein synthesis in all living organisms. rRNA is the predominant RNA in most cells, composing around 80% of cellular RNA. Ribosomes are approximately 60% rRNA and 40% protein by weight. A ribosome contains two subunits, the large ribosomal subunit (LSU) and small ribosomal subunit (SSU).}
#'   \item{sn_rna}{Number of small nuclear RNA (snRNA) -- a class of small RNA molecules that are found within the splicing speckles and Cajal bodies of the cell nucleus in eukaryotic cells. The length of an average snRNA is approximately 150 nucleotides.}
#'   \item{sno_rna}{Number of small nucleolar RNAs (snoRNAs) -- a class of small RNA molecules that primarily guide chemical modifications of other RNAs, mainly ribosomal RNAs, transfer RNAs and small nuclear RNAs. There are two main classes of snoRNA, the C/D box snoRNAs, which are associated with methylation, and the H/ACA box snoRNAs, which are associated with pseudouridylation.}
#'   \item{miscnc_rna}{Number of miscellaneous RNA, a general term for a series of miscellaneous small RNA. It serves a variety of functions, including some enzyme-like catalysis and processing RNA after it is formed.}
#'   \item{centromereposition_mbp}{Numeric indicating the position of the region that joins the two sister chromatids, or each half of the chromosome.}
#' }
#'
#' @docType data
#'
#' @source \url{https://en.wikipedia.org/wiki/Human_genome}
"genome"


#next template goes here.
