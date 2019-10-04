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


#' Mitocarta: an inventory of mammalian mitochondrial genes
#'
#' MitoCarta2.0 is an inventory of 1158 human genes encoding proteins with strong support of mitochondrial localization. To generate this inventory, the Mootha lab at MGH performed mass spectrometry of mitochondria isolated from fourteen tissues, assessed protein localization through large-scale GFP tagging/microscopy, and integrated these results with six other genome-scale datasets of mitochondrial localization, using a Bayesian approach. MitoCarta2.0, released 2015, is an update from the MitoCarta1.0 inventory published in Cell, 2008.
#'
#' @usage data(mitocarta)
#'
#' @docType data
#'
#' @format A data frame with 19,244 rows and 43 variables:
#' \describe{
#'   \item{training_dataset}{Tmito, Tnot_mito, or T_possible_mito (indicating evidence based on NCBI GO mitochondrial annotation or MitoP2 database, but not in Tmito)}
#'   \item{human_gene_id}{NCBI Entrez Gene ID for human ortholog of mouse gene (based on reciprocal BLASTP hit, expect<1e-3)}
#'   \item{mouse_ortholog_gene_id}{NCBI Entrez Gene ID for mouse gene}
#'   \item{symbol}{Official Entrez gene symbol}
#'   \item{synonyms}{NCBI Entrez gene synonyms (UniProt added at end)}
#'   \item{description}{NCBI Entrez gene description}
#'   \item{ensembl_gene_id}{Ensembl Gene Identifier (based on Ensembl mapper)}
#'   \item{protein_length}{Length of longest RefSeq protein isoform}
#'   \item{target_p_score}{TargetP confidence score (1-5, 1 is most confident) of mitochondrial targeting signal. Score 0 indicates no mitochondrial prediction}
#'   \item{mito_domain_score}{MitoDomain indicates exclusively mito domain; SharedDomain indicates shared mito & non-mito domain; NonMitoDomain indicates exclusively non-mito domain; NA indicates unknown}
#'   \item{coexpression_gnf_n50_score}{N50 score for coexpression across mouse GNFv3 tissue atlas (N50 = number of 50 nearest neighbors that are in Tmito)}
#'   \item{pgc_induction_score}{Foldchange in transcript induction following overexpression of PGC1a, known to induce mitochondrial biogenesis}
#'   \item{yeast_mito_homolog_score}{OrthologMitoHighConf (HomologMitoHighConf) if yeast ortholog (homolog) is annotated mitochondrial in SGD with high confidence; OrthologMitoLowConf (HomologMitoLowConf) if yeast ortholog (homolog) is annotated mitochondrial in SGD with low confidence (dual localized or only based on high throughput data), NoMitoHomolog indicates no yeast homolog or homolog is not annotated mitochondrial in SGD}
#'   \item{rickettsia_homolog_score}{Ortholog if 1:1 ortholog between mouse and Rickettsia prowazekii; Homolog if homology between mouse and Rickettsia prowazekii, otherwise NoHomolog}
#'   \item{msms_score}{Category indicating MS/MS abundance (coverage) and enrichment in subtractive proteomics (either pure-enriched, crude-enriched, or ambiguous)}
#'   \item{mcarta2_score}{Naïve Bayes score (sum of log-likelihood ratios for each of 7 above features)}
#'   \item{mcarta2_fdr}{Estimated corrected false discovery rate for all predictions >= given score}
#'   \item{mcarta2_list}{1 if gene is on final MitoCarta2.0 list}
#'   \item{mcarta2_evidence}{Type of experimental support}
#'   \item{hg19_chromosome}{Chromosome (hg19 assembly)}
#'   \item{hg19_start}{Start position (hg19)}
#'   \item{hg19_stop}{Stop position (hg19)}
#'   \item{msms_num_tissues}{Number 0-14 tissues where gene products were found by MS/MS }
#'   \item{msms_num_peptides_unique}{Number of unique peptides, based on pooling spectra from 14 tissues}
#'   \item{msms_num_spectra}{Number of spectra corresponding to this gene, based on pooling spectra from 14 tissues}
#'   \item{msms_total_intensity    }{total peak intensity, based on pooling spectra from 14 tissues}
#'   \item{msms_percent_coverage}{Coverage (percent of amino acids covered by MS/MS spectra), based on pooling spectra from 14 tissues}
#'   \item{tissues}{List of tissues with evidence of protein, based on 14 tissues}
#'   \item{cerebrum_total_peak_intensity_log10}{Total peak intensity of spectra found in this tissue (log base 10)}
#'   \item{cerebellum_total_peak_intensity_log10}{Total peak intensity of spectra found in this tissue (log base 10)}
#'   \item{brainstem_total_peak_intensity_log10}{Total peak intensity of spectra found in this tissue (log base 10)}
#'   \item{spinalcord_total_peak_intensity_log10}{Total peak intensity of spectra found in this tissue (log base 10)}
#'   \item{kidney_total_peak_intensity_log10}{Total peak intensity of spectra found in this tissue (log base 10)}
#'   \item{liver_total_peak_intensity_log10}{Total peak intensity of spectra found in this tissue (log base 10)}
#'   \item{heart_total_peak_intensity_log10}{Total peak intensity of spectra found in this tissue (log base 10)}
#'   \item{skeletalmuscle_total_peak_intensity_log10}{Total peak intensity of spectra found in this tissue (log base 10)}
#'   \item{adipose_total_peak_intensity_log10}{Total peak intensity of spectra found in this tissue (log base 10)}
#'   \item{smallintestine_total_peak_intensity_log10}{Total peak intensity of spectra found in this tissue (log base 10)}
#'   \item{largeintestine_total_peak_intensity_log10}{Total peak intensity of spectra found in this tissue (log base 10)}
#'   \item{stomach_total_peak_intensity_log10}{Total peak intensity of spectra found in this tissue (log base 10)}
#'   \item{placenta_total_peak_intensity_log10}{Total peak intensity of spectra found in this tissue (log base 10)}
#'   \item{testis_total_peak_intensity_log10}{Total peak intensity of spectra found in this tissue (log base 10)}
#'   \item{hpa_primary_subcellular_localization_2015}{Human Protein Atlas [September 2015] designation of primary subcellular localization based on immunofluorescence of antibodies in 3 human cell lines; Text in parenthesis indicates antibody reliability (where APE=antibody protein expression)}
#' }
#'
#' @keywords datasets
#'
#' @source \url{https://www.broadinstitute.org/scientific-community/science/programs/metabolic-disease-program/publications/mitocarta/mitocarta-in-0}
"mitocarta"


#' omim_mim2gene
#'
#' A dataset linking MIM numbers with NCBI Gene IDs, Ensembl Gene IDs, and HGNC Approved Gene Symbols. For more informaation, see: https://omim.org/help/faq.
#'
#' @usage data(omim_mim2gene)
#'
#' @docType data
#'
#' @format A data frame with 26,445 rows and 5 variables:
#' \describe{
#'   \item{number_mim_number}{Each OMIM entry is given a unique six-digit number.}
#'   \item{mim_entry_type}{Gene indicates that the entry contains the description of a gene of known sequence and a phenotype. See other types at faq 1.3 at https://omim.org help faq for more types.}
#'   \item{entrez_gene_id_ncbi}{Official Entrez gene ID from NCBI.}
#'   \item{approved_gene_symbol_hgnc}{Official gene symbol from HGNC.}
#'   \item{ensembl_gene_id_ensembl}{Official gene ID from Ensembl.}
#' }
#'
#' @keywords datasets
#'
#' @source \url{https://www.omim.org/downloads/}
"omim_mim2gene"


#' omim_mimtitles
#'
#' A dataset of MIM numbers and perferred titles.
#'
#' @usage data(omim_mimtitles)
#'
#' @docType data
#'
#' @format A data frame with 26,458 rows and 5 variables:
#' \describe{
#'   \item{number_prefix}{An (*) indicates a gene. A(#) indicates that it is a descriptive entry, usually of a phenotype, and not a unique locus. A (+) indicates the description of a gene of known sequence and a phenotype. A (%) indicates a confirmed mendelian phenotype or phenotypic locus for which the underlying molecular basis is not known. No symbol generally indicates a description of a phenotype for which the mendelian basis, although suspected, has not been clearly established. A (^) means the entry no longer exists because it was removed from the database or moved to another entry as indicated.}
#'   \item{mim_number}{Each OMIM entry is given a unique six-digit number.}
#'   \item{preferred_title_symbol}{ach entry has a “Preferred title” with symbol.}
#'   \item{alternative_title_s_symbol_s}{Synonymous names and symbols that have been used in the literature are included as “Alternative title(s)”.}
#'   \item{included_title_s_symbols}{“Included titles” mark placement of information on a topic that does not warrant a separate entry (e.g., fusion genes).}
#' }
#'
#' @keywords datasets
#'
#' @source \url{https://www.omim.org/downloads/}
"omim_mimtitles"


#' omim_genemap
#'
#' A dataset containing OMIM's Synopsis of the Human Gene Map, including additional information such as genomic coordinates and inheritance.
#'
#' @usage data(omim_genemap)
#'
#' @docType data
#'
#' @format A data frame with 17,053 rows and 14 variables:
#' \describe{
#'   \item{number_chromosome}{Chromosomal location from NCBI}
#'   \item{genomic_position_start}{Genomic position start from NCBI; for phenotypes with mapping key of (2) or genes not found in NCBI data, genomic coordinates are derived from OMIM's cyto location mapped to genomic using UCSC table.}
#'   \item{genomic_position_end}{Genomic position end from NCBI}
#'   \item{cyto_location}{Computed cyto location from UCSC}
#'   \item{computed_cyto_location}{Annotated cyto location from OMIM}
#'   \item{mim_number}{Each OMIM entry is given a unique six-digit number.}
#'   \item{gene_symbols}{Gene symbols from OMIM}
#'   \item{gene_name}{Gene name from OMIM}
#'   \item{approved_symbol}{Approved gene symbol from HGNC}
#'   \item{entrez_gene_id}{Official NCBI Entrez gene ID}
#'   \item{ensembl_gene_id}{Official Ensembl gene ID}
#'   \item{comments}{Curated, miscellaneous comments}
#'   \item{phenotypes}{Phenotype data from OMIM}
#'   \item{mouse_gene_symbol_id{Mouse gene symbol and ID from MGI}
#' }
#'
#' @keywords datasets
#'
#' @source \url{https://www.omim.org/downloads/}
"omim_genemap"


#' omim_morbidmap
#'
#' A dataset containing OMIM's Synopsis of the Human Gene Map (same as omim_genemap) sorted alphabetically by disorder.
#'
#' @usage data(omim_morbidmap)
#'
#' @docType data
#'
#' @format A data frame with 7,831 rows and 4 variables:
#' \describe{
#'   \item{number_phenotype}{Each Phenotype is followed by its MIM number, if different from that of the locus/gene, and then followed by its phenotype mapping key in parentheses.}
#'   \item{gene_symbols}{Gene symbol(s) associated with disease}
#'   \item{mim_number}{Each OMIM entry is given a unique six-digit number.}
#'   \item{cyto_location}{Computed cyto location from UCSC}
#'   }
#'
#' @keywords datasets
#'
#' @source \url{https://www.omim.org/downloads/}
"omim_morbidmap"


#' genes
#'
#' A dataset containing Ensembl's unique genes in the Human Genome (GRCh38.p13) and other associated information.
#'
#' @usage data(genes)
#'
#' @docType data
#'
#' @format A data frame with 61,187 rows and 11 variables:
#' \describe{
#'   \item{gene_name}{Official gene name}
#'   \item{gene_description}{Gene name and description}
#'   \item{chromosome_scaffold_name}{Genome assemblies are hierarchical. The shortest assembly components are contigs, which are sequences taken from individuals. Contigs are assembled into longer scaffolds, and scaffolds are assembled into chromosomes if there is sufficient mapping information. Many genome assemblies have only been assembled to the scaffold level.}
#'   \item{strand}{Indicates if gene is on positive or negative strand}
#'   \item{transcript_start_bp}{Position of gene start}
#'   \item{transcript_end_bp}{Position of gene end}
#'   \item{transcript_length}{Transcript length (including UTRs and CDS)}
#'   \item{gene_percent_gc_content}{Gene % GC content}
#'   \item{gene_stable_id}{Stable gene identifiers are ways that Ensembl labels genes in their database. Unlike gene names which can change as a result of improvements in scientific knowledge, stable identifiers should continue to refer to the same genomic features.}
#'   \item{transcript_stable_id}{Stable transcript identifiers are ways that Ensembl labels transripts in their database.}
#'   }
#'
#' @keywords datasets
#'
#' @source \url{https://www.ensembl.org/index.html}
"genes"

