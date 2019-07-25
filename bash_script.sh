!/bin/bash
cd /home/svashisht/svashisht/genomes_complete/ensembl/hsap_grch38.v.drer_grcz11.lastz_net

for ((i=1; i<=22; i++)); do

ls *chr${i}_*.maf | sort -V | xargs cat > /home/svashisht/svashisht/genomes_complete/ensembl/hsap_grch38.v.drer_grcz11.lastz_net/chromBychrom/chr${i}_PWalign.maf

sed -i -e 's/a# id/#id/g' /home/svashisht/svashisht/genomes_complete/ensembl/hsap_grch38.v.drer_grcz11.lastz_net/chromBychrom/chr${i}_PWalign.maf
sed -i -e 's/ score/a score/g' /home/svashisht/svashisht/genomes_complete/ensembl/hsap_grch38.v.drer_grcz11.lastz_net/chromBychrom/chr${i}_PWalign.maf
sed -i -e 's/ a/a/g' /home/svashisht/svashisht/genomes_complete/ensembl/hsap_grch38.v.drer_grcz11.lastz_net/chromBychrom/chr${i}_PWalign.maf
sed -i -e 's/DB CONNECT    :/# DB CONNECT    :/g' /home/svashisht/svashisht/genomes_complete/ensembl/hsap_grch38.v.drer_grcz11.lastz_net/chromBychrom/chr${i}_PWalign.maf
sed -i -e 's/\([0-9]\)\([a-zA-Z]\)/\1 \2/g' /home/svashisht/svashisht/genomes_complete/ensembl/hsap_grch38.v.drer_grcz11.lastz_net/chromBychrom/chr${i}_PWalign.maf

    done

 cd /home/svashisht/svashisht/genomes_complete/ensembl/hsap_grch38.v.drer_grcz11.lastz_net/chromBychrom
 for ((i=1; i<=22; i++)); do

 #phyloFit  --subst-mod U2S --EM --precision MED --out-root chr${i} chr${i}_PWalign.maf 
 
 phyloFit --precision HIGH --out-root chr${i} chr${i}_PWalign.maf
 phyloP --wig-scores --method LRT chr${i}_phyloPscore.mod chr${i}_PWalign.maf --chrom chr1  > chr${i}.wig
 phastCons chr${i}_PWalign.maf chr${i}.mod --estimate-trees chr${i}_newtree --viterbi --score > chr${i}_phastCons.wig

      done



