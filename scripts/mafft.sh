#!/bin/bash
###############################################################
#This scritp run Maffts for multiple fasta files
#Author Arturo Vera
###############################################################

unset MAFFT_BINARIES
term=$1
cpu=$2
for i in ./*.$term
        do
        mafft --thread $cpu $i > $i.alin
        done
