#!/bin/bash
###########################################################################################################
##This script produces a fasta file for phylogeny using 31 Markers from AMPHORA2 Pipeline
##It needs genome in format .fna and all of them must to be in the same directory
##Autor Arturo Vera
##December 2017
###########################################################################################################
if [ $# -eq 0 ]; then
        echo "usage: $0 path_to_multigenome2blocks_scripts_directory path_to_AMPHORA2_scripts file_extention common_id_own_genomes genetic code num_cpus";
        exit 1;
        fi

script=$1
bin=$2
term=$3
genome_name=$4
gen_code=$5
cpu=$6

mkdir gen_predicted.prodigal
echo "predicting"
cd gen_predicted.prodigal
ln -s ../*.$term .
for ENS in ./*.$term
        do
        echo $ENS
        echo 'starting gen prediction using genome'
        prodigal -a $ENS.prot.faa -d $ENS.cds.fna -o $ENS.prodigal.out -f gff -g $gen_code -i $ENS
        echo "one line"
        perl  $script/multifasta2oneline.pl $ENS.prot.faa > $ENS.una.faa
done

for i in GC*.una.faa ;
         do a=$(echo $i|awk -F "_" '{print $1"_"$2}') ;
         perl $script/headers.mod.prop.pl $i $a > $i.mod ;
done
for i in $genome_name*.una.faa ;
        do
        perl $script/header.afterprod.parama.pl $i > $i.name
done
for i in $genome_name*.name ;
        do
        a=$(echo $i|awk '{split($0, b, "."); print b[1]}');
        perl $script/headers.mod.prop.pl $i $a > $i.amph.mod;
 done
mkdir amphora
echo "Aplying AMPHORA2"
cd amphora
ln -s ../*.mod .
cat *.mod > all.for.amphora.fasta
perl $bin/MarkerScanner.pl -Bacteria all.for.amphora.fasta

mkdir alin
cd alin/
ln -s ../*pep .
for i in *.pep ;
        do
        $script/multifasta2oneline.pl $i > $i.una ;
done
for i in *.una ;
        do
        perl -e 'while(<>){chomp; if($_ =~ /^>/){@header=split(/\:/);}else{$seq=$_; print "$header[0]\t$header[1]\n$seq\n";}}' $i > $i.mod ;
done
mkdir mafft
 cd mafft/
 mv ../*.mod .
echo "mafft alignment"
$script/mafft.sh mod $cpu

mkdir concatenated
 cd concatenated/
 ln -s ../*alin .
cat *.alin > all.amphora.alin.fasta
$script/multifasta2oneline.pl all.amphora.alin.fasta > all.amphora.alin.fasta.una
perl -e 'while(<>){chomp; if($_ =~ /^>/){@header=split(/\s/);}else{$seq=$_; print "$header[0]\n$seq\n";}}' all.amphora.alin.fasta.una > all.amphora.alin.fasta.una.mod
perl $script/merge_seqs.pl all.amphora.alin.fasta.una.mod > all.amphora.alin.fasta.una.mod.merged
sed 's/*//g' all.amphora.alin.fasta.una.mod.merged > all.amphora.alin.fasta.una.mod.sinstar.merged
echo "Mafft end"
unset MAFFT_BINARIES
mafft --thread $cpu all.amphora.alin.fasta.una.mod.sinstar.merged > all.amphora.alin.fasta.una.mod.sinstar.merged.alin.end
$script/Gblocks all.amphora.alin.fasta.una.mod.sinstar.merged.alin.end g
echo "all results are in:"
out_dir=$(pwd)
echo $out_dir
echo "your final alin file is: all.amphora.alin.fasta.una.mod.sinstar.merged.alin.end-gb"
