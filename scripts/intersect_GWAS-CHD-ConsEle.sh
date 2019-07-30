#!/bin/bash

cd ~/svashisht/genomes_complete/ensembl/hsap_grch38.v.drer_grcz11.lastz_net/chromBychrom/bed_files/phyloP

ARRAY=(10 30 50)

for ((i=0; i<=2; i++)); do

bedtools intersect -wo -a /home/svashisht/svashisht/GWAS_catalog_CHD_SNP_analysis/human_Zebrafish_Ortho_${ARRAY[i]}.bed -b PhyloPCons_elements_allChrs.bed > AllchrPhyloPConsElementsIntrsct_GWASOrtho_${ARRAY[i]}.bed

bedtools intersect -wo -a /home/svashisht/svashisht/GWAS_catalog_CHD_SNP_analysis/human_Zebrafish_no-Ortho_${ARRAY[i]}.bed -b PhyloPCons_elements_allChrs.bed > AllchrPhyloPConsElementsIntrsct_GWAS_no-Ortho_${ARRAY[i]}.bed

sort -u AllchrPhyloPConsElementsIntrsct_GWASOrtho_${ARRAY[i]}.bed > AllchrPhyloPConsElementsIntrsct_GWASOrtho_uniq_${ARRAY[i]}.bed

sort -u AllchrPhyloPConsElementsIntrsct_GWAS_no-Ortho_${ARRAY[i]}.bed > AllchrPhyloPConsElementsIntrsct_GWAS_no-Ortho_uniq_${ARRAY[i]}.bed

      done

# phastCons

cd ~/svashisht/genomes_complete/ensembl/hsap_grch38.v.drer_grcz11.lastz_net/chromBychrom/bed_files/phasCons

#ARRAY=(10 30 50)

for ((i=0; i<=2; i++)); do

bedtools intersect -wo -a /home/svashisht/svashisht/GWAS_catalog_CHD_SNP_analysis/human_Zebrafish_Ortho_${ARRAY[i]}.bed -b PhastCons_elements_allChrs.bed > AllchrPhastConsElementsIntrsct_GWASOrtho_${ARRAY[i]}.bed

bedtools intersect -wo -a /home/svashisht/svashisht/GWAS_catalog_CHD_SNP_analysis/human_Zebrafish_no-Ortho_${ARRAY[i]}.bed -b PhastCons_elements_allChrs.bed > AllchrPhastConsElementsIntrsct_GWAS_no-Ortho_${ARRAY[i]}.bed

sort -u AllchrPhastConsElementsIntrsct_GWASOrtho_${ARRAY[i]}.bed > AllchrPhastConsElementsIntrsct_GWASOrtho_uniq_${ARRAY[i]}.bed

sort -u AllchrPhastConsElementsIntrsct_GWAS_no-Ortho_${ARRAY[i]}.bed > AllchrPhastConsElementsIntrsct_GWAS_no-Ortho_uniq_${ARRAY[i]}.bed

     done
     
     
ls | egrep "*GWASOrtho_uniq_[0-9]+|*GWASOrtho_Unique.bed" sort -V | xargs cat >AllWinSize_GWASintrsctPhastConsEles.bed

function runx() {
  for ((n=0;n<$1;n++))
    do ${*:2}
  done
}

LEN=$(wc -l AllchrPhyloPConsElementsIntrsct_GWASOrtho_Unique.bed | awk '{ print $1 }')
runx ${LEN} echo '0'





