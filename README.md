# A genome-wide computational approach to define microRNA-Polycomb/trithorax gene regulatory circuits in Drosophila

<img src="https://github.com/j-solor/Drosophila-miRNA-PcG-circuits/blob/main/misc/Figure1.png">

All the data and code from ("insert reference here")
is aviliable in this repository. It can be further
divided in 3 parts each one containing a html of 
the Jupyter noteboook for fast access
  

### A) Generation of the Refined miRNA target predictions set (RmiRTps)
> Located at ["RmiRTps_generation" directory](https://github.com/j-solor/Drosophila-miRNA-PcG-circuits/tree/main/RmiRTps_generation)

Code and data from the generation of RmiRTps through the integration of TargetScanFlyV7 predictions with Wessels et al., 2019 AGO-PARCLIP experimental microRNA target set.
<br/><br/>


### B) Generation of the Refined PRE predictions set (RPREps) 
> Located at ["RPREps_generation" directory](https://github.com/j-solor/Drosophila-miRNA-PcG-circuits/tree/main/RPREps_generation)

Code and data from the generation of RPREps  through the intersection of SVM-MOCCA and Khabiri and Freddolino, 2019 Polycomb response element (PRE) predictions.
<br/><br/>


### C) Analysis of miRNA-PcG/trxG crosstalk interactions: Definition of regulatory circuits
> Located at ["Analysis" directory](https://github.com/JacoboSolorzano/TFM/tree/master/Analysis "Title")

Code and data from the analysis of RmiRTps and RPREps. This section includes from the enrichment analysis and distance to the closest PRE calculation to the exploration of mIRNA-PcG/trxG regulatory circuits.

as a final result of this scrtipt a network containing the miRNAs predicted to be forming regulatory circuits with PcG/trxG is built. This network is accessible through [NDEx](https://www.ndexbio.org/#/networkset/998959df-1a4e-11ed-ac45-0ac135e8bacf?accesskey=6e232187b6745a196eca1d0321b2f8befd6dbd737e83a4407e6c9ce29e9842a0).

<br/><br/>


