setwd("~/svashisht/genomes_complete/ensembl/hsap_grch38.v.drer_grcz11.lastz_net/chromBychrom/bed_files/phasCons")

files<-list.files(pattern="chr[0-9]+_phast",all.files=F)

chrs<-sapply(strsplit(files,"_"),head,n=1)

for (j in 1:length(files)){
  
  dat<- read.table(files[j],stringsAsFactors = F, header=F,sep = "\t")
  element<-c()
  res<- data.frame(chr=rep("", N),start=rep(NA, N), end=rep(NA, N),avg=rep(NA,N),stringsAsFactors=FALSE)
  N=nrow(dat)-1
  cat(j,"\n")
  
  for (i in 1:N){
    if(dat$V3[i] == dat$V2[i+1]) 
    {   
      tmp <- dat[i,]
      element<-rbind(element,tmp) 
      
      element1<-rbind(element,dat[i+1,])
      
    } else if (dat$V3[i] != dat$V2[i+1]) {
      res[i,1]<-chrs[j]
      res$start[i]<-head(element1$V2,n=1) 
      res$end[i]<-dat$V3[i]
      res$avg[i]<-mean(element1$V5)
      res<-na.omit(res)
      element<-NULL
      cat(i,"\n")
    }
  }
  
  length_Ele=res[,3]-res[,2]+2
  res$length_Ele<-length_Ele
  filename=paste(chrs[j],"_ConsElemt_phastCons.bed",sep="")
  write.table(res,filename,col.names = F,row.names = F,sep="\t",quote = F)
  
}