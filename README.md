# multigenome2blocks
Author Arturo Vera

Feb-2018
modif. Apr-2020

This pipeline gives you a concatenated multi-alignment of 31 Single Copy Markers from genome assembly to create robust phylogenies.

multigenome2blocks predic CDS from a genome using Prodigal. From these CDS extract 31 Single Copy Markers genes using AMPHORA2 pipeline for phylogenomic clustering. After extraction all marker genes are concatenated and then aligned with MAFFT to generate a single alignment file. Conserved protein blocks are then obtained by Gblocks.


For any inquiries sent an email to Arturo Vera: veraponcedeleon@osu.edu


DEPENDENCY

multigenome2blocks depends on external programs:

1. Prodigal (https://github.com/hyattpd/Prodigal). Required for CDS prediction.
2. AMPHORA2 MarkerScanner.pl (https://github.com/martinwu/AMPHORA2). Required for 31 Single Copy gene marker selection.
3. MAFFT (https://mafft.cbrc.jp/alignment/software/). Required for multifasta protein alignment.
4. Gblocks (http://molevol.cmima.csic.es/castresana/Gblocks.html). After alignmet conserved protein blocks are then obtained by this.

Make sure that these programs are installed and are in your system's executable search path. To test, in a terminal type:
  
    prodigal -h
    /home/foo/AMPHORA2/Scripts/MarkerScanner.pl
    mafft -h
    Gblocks
    
    If you see version or help messages, then these programs have been correctly installed. If not be sure to install all dependencies before run multigenome2blocks.

Running:

1. Download multigenome2bolcks

        https://github.com/avera1988/multigenome2blocks.git

2. Make multigenome2blocks.pipeline.sh and all scripts in directory /scripts executable: chmod -R +x *
3. For usage display just type:

        ./multigenome2blocks.pipeline.sh
         usage: ./multigenome2blocks.pipeline.sh path_to_multigenome2blocks_scripts_directory path_to_AMPHORA_scripts file_extention common_id_own_genomes genetic code num_cpus


**Please use this paper to cite the repository: Vera-Ponce de León A, Jahnes BC, Duan J, Camuy-Vélez LA, Sabree ZL. 2020. Cultivable, host-specific Bacteroidetes symbionts exhibit diverse polysaccharolytic strategies. Appl Environ Microbiol 86:e00091-20. https://doi.org/10.1128/AEM.00091-20.
    
    
    
