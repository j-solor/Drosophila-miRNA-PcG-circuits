# Loading
setwd(dirname(rstudioapi::getActiveDocumentContext()$path)) # setwd to this script directory
source("robust-fdr.R") # From prot2D

PcG_results <- read.csv("PcG_miRNAs.tsv", sep= "\t")
trxG_results <- read.csv("trxG_miRNAs.tsv", sep= "\t")
trxG_core_results <- read.csv("trxG_core_miRNAs.tsv", sep= "\t")

# Main
## drop non tested miRNAs
PcG_non0_results <- PcG_results[complete.cases(PcG_results),]
trxG_non0_results <- trxG_results[complete.cases(trxG_results),]
trxG_core_non0_results <- trxG_core_results[complete.cases(trxG_core_results),]


## FDR calculation
### rFDR - continuous
PcG_rFDR_cont <- robust.fdr(p= PcG_non0_results$hyper_pval,
                            sides = 1, discrete = F)

trxG_rFDR_cont <- robust.fdr(p= trxG_non0_results$hyper_pval,
                             sides = 1, discrete = F)

trxG_core_rFDR_cont <- robust.fdr(p= trxG_core_non0_results$hyper_pval,
                             sides = 1, discrete = F)


## FDR result table construction
PcG_FDR_results<-cbind(PcG_non0_results,
                       rFDRc_q=PcG_rFDR_cont$q)

trxG_FDR_results<-cbind(trxG_non0_results,
                       rFDRc_q=trxG_rFDR_cont$q)

trxG_core_FDR_results<-cbind(trxG_core_non0_results,
                        rFDRc_q=trxG_core_rFDR_cont$q)

PcG_FDR_results<-PcG_FDR_results[PcG_rFDR_cont$ord,]
trxG_FDR_results<-trxG_FDR_results[trxG_rFDR_cont$ord,]
trxG_core_FDR_results<-trxG_core_FDR_results[trxG_core_rFDR_cont$ord,]


## plots
plot(PcG_FDR_results$hyper_pval, PcG_FDR_results$rFDRc_q, 
     col="blue", type = "l", asp = 1, lty = 1:6, xlim = c(0,1), ylim = c(0,1), 
     xlab = "p-value", ylab = "q-value", main = "PcG")

lines(trxG_FDR_results$hyper_pval, trxG_FDR_results$rFDRc_q, col= "red", asp = 1, lty = 1)
lines(trxG_core_FDR_results$hyper_pval, trxG_core_FDR_results$rFDRc_q, col= "green", asp = 1, lty = 1)
abline(coef = c(0,1))

legend(0.7, 0.6,legend=c("PcG", "trxG", "trxG_core"), 
       col=c("blue", "red", "green"), lty = 1)


## Export
dir.create("FDR",showWarnings = FALSE)
write.table(PcG_FDR_results, "FDR/PcG_FDR_results.tsv", sep='\t',row.names=F)
write.table(trxG_FDR_results, "FDR/trxG_FDR_results.tsv", sep="\t", row.names=F)
write.table(trxG_core_FDR_results, "FDR/trxG_core_FDR_results.tsv", sep='\t',row.names=F)
