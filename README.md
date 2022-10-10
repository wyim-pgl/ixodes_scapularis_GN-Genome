# Ixodes_scapularis_GN-Genome


The repository contains methods on extracting amino acid FASTA sequence from genome amino acid file (FASTA) using gene ID lists using python.   
The require packages include: Biopython  

The input is a list of the Gene IDs including ">" symbol followed by the full gene ID. Note: when downloading amino acid file of genome from a site such as VectorBase the gene ID will followed by a "-PA" to indicate its a protein. This "-PA" will be considered part of the gene ID in order to extract the corresponding amino acid sequences. 
