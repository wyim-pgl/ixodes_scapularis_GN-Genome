# Ixodes_scapularis_GN-Genome

*Will be removed*  
The repository contains methods on extracting amino acid FASTA sequence from genome amino acid file (FASTA) using gene ID lists using python.   
The require packages include: Biopython  

The input is a list of the Gene IDs including ">" symbol followed by the full gene ID. Note: when downloading amino acid file of genome from a site such as VectorBase the gene ID will followed by a "-PA" to indicate its a protein. This "-PA" will be considered part of the gene ID in order to extract the corresponding amino acid sequences.  
*Will be removed*

## Installation
Conda envrionment creation. 
Please check below link to use Conda
https://astrobiomike.github.io/unix/conda-intro

```bash
conda create -n tickdata -c bioconda -c anaconda seqkit blast ripgrep pandas
conda activate tickdata
```

## ISCGN vs Vectorbase sequence compare (BLASTP)
`run.sh` will download Vectobase and ISCGN amino acid sequences, run BLASTP to find homolog, generate Vectorbase description and filter homolog for ID comparison.
```
chmod 775 run.sh
bash scripts/run.sh
```
Below files will be generated.


### Raw BLASTP file
`VectorBase-59_IscapularisWikel_AnnotatedProteins_vs_ISCGN_v2_101122.blastp`

### Filtered BLASTP file (Identity 99% and coverage 90%)
`VectorBase-59_IscapularisWikel_AnnotatedProteins_vs_ISCGN_v2_101122.blastp.filtered`

## Additional files
### ISCGN description
https://nevada.app.box.com/file/979083922322

### ISCGN Pfam domain
https://nevada.app.box.com/file/920377643276

## Vectorebase description
After running `run.sh` description file `database/VectorBase-59_IscapularisWikel_description.txt` will be generated.

## FASTA extraction
```                                                                                                                                              seqkit grep -f example/ISCGN_ID_LIST.txt database/ISCGN_v2_101122.aa -o example/ISCGN_ID_LIST.fasta
```
