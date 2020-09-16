# P-M16S
PluMA P-M16S pipeline that performs downstream analysis on 16S mouse gut microbiome data, pre- and post- obesity

Data retrieved from the Mothur Tutorial, available at: https://www.mothur.org/wiki/MiSeq_SOP
Results of their experiment were published in:

Kozich JJ, Westcott SL, Baxter NT, Highlander SK, Schloss PD. (2013): Development of a dual-index sequencing strategy and curation pipeline for analyzing amplicon sequence data on the MiSeq Illumina sequencing platform. Applied and Environmental Microbiology. 79(17):5112-20.


To run this pipeline in PluMA:

1. Clone this repository into the pipelines/ directory of PluMA.
2. Run ./getPlugins.sh to automatically download all relevant PluMA plugins.
3. cd ..
4. Install the (currently) latest versions of Mothur (1.39.5, mothur.org), Cytoscape (3.6.0, cytoscape.org) and SCons (3.0.1, scons.org) and be sure they are in your system PATH.
5. Run 'scons perl=0'
6. ./pluma pipelines/P-M16S/config.Early.txt (for pre-obesity)
   ./pluma pipelines/P-M16S/config.Late.txt (for post-obesity)

