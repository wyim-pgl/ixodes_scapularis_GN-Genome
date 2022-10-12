#!/usr/bin/bash
######################################
###  DOWNLOAD VECTORBASE DATA    ####
######################################

if [[ ! -f database/VectorBase-59_IscapularisWikel_AnnotatedProteins.fasta ]]
then
   wget https://vectorbase.org/common/downloads/Current_Release/IscapularisWikel/fasta/data/VectorBase-59_IscapularisWikel_AnnotatedProteins.fasta \
   -O database/VectorBase-59_IscapularisWikel_AnnotatedProteins.fasta
fi


######################################
###  DOWNLOAD ISCGN DATA    ####
######################################

if [[ ! -f database/ISCGN_v2_101122.aa ]]
then
   wget https://www.dropbox.com/s/ofhkrmpa6wx6r79/ISCGN_v2_101122.aa \
   -O database/ISCGN_v2_101122.aa
fi


###################################
###  BUILD DESCRIPTION TABLE   ####
###################################
if [[ ! -f database/VectorBase-59_IscapularisWikel_description.txt ]]
then
   egrep ">" database/VectorBase-59_IscapularisWikel_AnnotatedProteins.fasta | cut -f 1,5 -d "|" | sed 's/>//g; s/\ |\ /\t/g; s/gene_product=//g' > database/VectorBase-59_IscapularisWikel_description.txt
fi 

#######################################
###  BUILD and RUN BLAST DATABASE  ####
#######################################

makeblastdb -in database/ISCGN_v2_101122.aa -dbtype prot

blastp \
-query database/VectorBase-59_IscapularisWikel_AnnotatedProteins.fasta \
-db database/ISCGN_v2_101122.aa \
-outfmt 6 \
-out VectorBase-59_IscapularisWikel_AnnotatedProteins_vs_ISCGN_v2_101122.blastp \
-num_threads 8 \
-evalue 1e-100


perl scripts/blastp_parser.pl \
-q database/VectorBase-59_IscapularisWikel_AnnotatedProteins.fasta \
-i VectorBase-59_IscapularisWikel_AnnotatedProteins_vs_ISCGN_v2_101122.blastp \
-b 0 \
-d 0.98 \
-c 0.9 \
-o VectorBase-59_IscapularisWikel_AnnotatedProteins_vs_ISCGN_v2_101122.blastp.filtered
