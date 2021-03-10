setwd("C:/Users/Administrator/Desktop/")
library(data.table)

aa <- data.table()

bed <- read.table("bed1.txt")
# bed <- bed[1:2,]

for(i in 1:nrow(bed)){
  if(bed$V2[i]=="+"){
    Contig <- rep(bed$V1[i],(bed$V4[i] - bed$V3[i] + 1))
    Contig_Pos <- seq(bed$V3[i],bed$V4[i],by=1)
    LG <- rep(bed$V5[i],(bed$V7[i] - bed$V6[i] + 1))
    LG_pos <- seq(bed$V6[i],bed$V7[i],by=1)
  } else{
    Contig <- rep(bed$V1[i],(bed$V4[i] - bed$V3[i] + 1))
    Contig_Pos <- seq(bed$V4[i],bed$V3[i],by=-1)
    LG <- rep(bed$V5[i],(bed$V7[i] - bed$V6[i] + 1))
    LG_pos <- seq(bed$V7[i],bed$V6[i],by=-1)
  }
  aa <- rbind(aa,data.table(Contig,Contig_Pos,LG,LG_pos))
  
}
write.csv(aa,file = "aa.csv",row.names = FALSE)
