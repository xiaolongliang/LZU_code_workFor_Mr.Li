vcf <- read.table("vcf.txt")
bed <- read.table("bed.txt")

bed$V4<-NA
for (j in 1:nrow(bed)) {
  count = 0
  for (i in 1:nrow(vcf)) {
    if (vcf$V1[i] == bed$V1[j]) {
      if((vcf$V2[i] > bed$V2[j]) && (vcf$V3[i] < bed$V3[j])){
        count = count + 1
      }
    }
  }
  #print(count)
  bed$V4[j]<-count
}