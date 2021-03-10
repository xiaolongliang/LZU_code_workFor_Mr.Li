setwd("/Users/lxl/Desktop/")
vcf <- read.table("vcf.txt")
bed <- read.table("bed.txt")



vcf$V4 <- NA
vcf$V5 <- NA
vcf$V6 <- NA

for (i in 1:nrow(vcf)) {
  for (j in 1:nrow(bed)) {
    if (vcf[i,1] == bed[j,1]) {
      if((vcf[i,2] > bed[j,3]) & (vcf[i,3] < bed[j,4])){
        vcf[i,4] <- bed[j,5]
        vcf[i,5] <- bed[j,6]
        vcf[i,6] <- bed[j,7]
      }
    }
  }

}









