#' Human chromosome summary
#'
#' A dataset containing summary information of the human chromosomes
#'
#' @usage data(chromosome)
#'
#' @docType data
#'
#' @format A data frame with 24 rows and 14 variables:
#' \describe{
#'   \item{id}{Identified for each of the 23 chromosome pairs in cell nuclei, including the X and Y chromosome; mitochondrial DNA is excluded.}
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
#' @keywords datasets
#'
#' @source \url{https://en.wikipedia.org/wiki/Human_genome}
"chromosome"


#' simplechromosome
#'
#' A dataset containing simple chromosome information of the human chromosomes and number of basepairs
#'
#' @usage data(simplechromosome)
#'
#' @docType data
#'
#' @format A data frame with 24 rows and 2 variables:
#' \describe{
#'   \item{id}{Identified for each of the 23 chromosome pairs in cell nuclei, including the X and Y chromosome; mitochondrial DNA is excluded.}
#'   \item{basepairs}{Number of base pairs, based on a reference genome that does not represent the sequence of any specific individual (Data source: Ensembl genome browser release 87, December 2016 for most values).}
#' }
#'
#' @keywords datasets
#'
#' @source \url{https://en.wikipedia.org/wiki/Human_genome}
"simplechromosome"


#' id
#'
#' A dataset with gene summary information, as well as linking MIM numbers, NCBI Gene IDs, Uniprot IDs, and HGNC Approved Gene Symbols.
#'
#' @usage data(id)
#'
#' @docType data
#'
#' @format A data frame with 26,445 rows and 5 variables:
#' \describe{
#'   \item{hgnc_id}{A unique ID provided by the HGNC for each gene with an approved symbol. IDs are of the format HGNC:n, where n is a unique number. HGNC IDs remain stable even if a name or symbol changes}
#'   \item{approved_symbol}{The official gene symbol approved by the HGNC, which is typically a short form of the gene name. Symbols are approved in accordance with the Guidelines for Human Gene Nomenclature}
#'   \item{approved_name}{The full gene name approved by the HGNC; corresponds to the approved symbol above}
#'   \item{aka}{This is a symbol or name by which a gene has been alternatively referred to in the literature or databases, or which groups it into a known gene family. Synonyms are recorded along with the approved symbols and names as part of the gene entry to facilitate database searching}
#'   \item{chromosome}{Indicates the cytogenetic location of the gene or region on the chromosome}
#'   \item{ref_seq_i_ds}{The Reference Sequence (RefSeq) identifier for that entry, provided by the NCBI. As we do not aim to curate all variants of a gene only one selected RefSeq is displayed per gene report. RefSeq aims to provide a comprehensive, integrated, non-redundant set of sequences, including genomic DNA, transcript (RNA), and protein products}
#'   \item{ncbi_gene_id}{The NCBI Gene ID refers to page at the NCBI provides curated sequence and descriptive information about genetic loci including official nomenclature, synonyms, sequence accessions, phenotypes, EC numbers, MIM numbers, UniGene clusters, homology, map locations, and related web sites}
#'   \item{locus_type}{Specifies the genetic class of each gene entry}
#'   \item{omim_id_supplied_by_omim}{ID links to the Online Mendelian Inheritance in Man page for the gene. OMIM is described as a catalog of human genes and genetic phenotypes containing textual information, and links to MEDLINE, sequence records in the Entrez system, and additional related resource}
#'   \item{uni_prot_id_supplied_by_uni_prot}{The UniProt page for the encoded gene protein product. The UniProt Protein Knowledgebase is a curated protein sequence database that provides a high level of annotation, a minimal level of redundancy and high level of integration with other databases}
#'   \item{entrez_summary}{NCBI Entrez Gene summary manually curated and provided by RefSeq}
#' }
#'
#' @keywords datasets
#'
#' @source \url{https://www.ncbi.nlm.nih.gov}
"id"
