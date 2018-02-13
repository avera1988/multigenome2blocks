#!/bin/bash
unset MAFFT_BINARIES
term=$1
cpu=$2
for i in ./*.$term
        do
        mafft --thread $cpu $i > $i.alin
        done
