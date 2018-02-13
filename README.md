# multigenome2blocks
Author Arturo Vera
Feb-2018
This pipeline give you a concatenated multi-alignment of 31 Single Copy Markers from genome assembly to create robust phylogenies.

#Multigenoe2Blocks predic CDS from a genome using Prodigal. From these CDS extract 31 Single Copy Markers using AMPHORA2 pipeline . After extraction all meker genes are concatenated and then aligned with MAFT to generate a single alignment file. Conserved protein blocks are then obtained by Gblocks.


For any inquiries sent an email to Arturo Vera: veraponcedeleon@osu.edu


DEPENDENCY

multigenome2blocks depends on external programs:

1. Prodigal (https://github.com/hyattpd/Prodigal). Required for CDS prediction.
2. AMPHORA2 MarkerScanner.pl (https://github.com/martinwu/AMPHORA2). Required for 31 Single Copy gene marker selection.
3. MAFTT (https://mafft.cbrc.jp/alignment/software/). Required for multifasta protein alingment.
4. Gblocks (http://molevol.cmima.csic.es/castresana/Gblocks.html). After alignmet conserved protein blocks are then obtained by this.

Make sure that these programs are installed and are in your system's executable search path. To test, in a terminal type:
  
    prodigal -h
    /home/foo/AMPHORA2/Scripts/MarkerScanner.pl
    mafft -h
    Gblocks
    
    If you see version or help messages, then these programs have been correctly installed. If not be sure to install all dependencies before run multigenome2blocks.

Running:

1. Donwload multigenome2bolcks
2. Make multigenome2blocks.AMPHORA.pipeline.sh and all scripts in directory /scripts executable: chmod -R +x *
3. For usage display just type:

        ./multigenome2blocks.AMPHORA.pipeline.sh
         usage: ./multigenome2blocks.AMPHORA.pipeline.sh path_to_multigenome2blocks_scripts_directory path_to_AMPHORA_scripts file_extention common_id_own_genomes genetic code num_cpus


    
    
    
    
    
