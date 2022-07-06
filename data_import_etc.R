library(tidyverse)
library(readxl) 
# rsync -avzP ~/Desktop/file1.xlsx wangzhe@172.16.55.11:/home/wangzhe/projects/20220629_GWA_tutorial/PRS
leadsnp <- read_excel("/home/wangzhe/projects/20220629_GWA_tutorial/PRS/file1.xlsx",sheet = 1) #
# match <- data.table::fread("/home/wangzhe/projects/gwas_cov_pca_age_logic/res_pca10_age_4000.assoc_pvalue2.logistic.gz", header = T, data.table=F, check.names = F,sep = "\t" )
match1 <- data.table::fread("/home/wangzhe/projects/gwas_cov_pca_age_logic/res_pca10_age_4000.assoc_pvalue2.logistic.gz") 

colnames(match1)
[1] "CHR"   "SNP"   "BP"    "A1"    "TEST"  "NMISS" "OR"    "STAT"  "P"
rsID SNP
colnames(leadsnp)

# match1 SNP 筛选leadsnp rsID | 多种方法----

##  1 %in% ----
as_tibble(match1)
#leadsnp1 <- data.frame(leadsnp) # 重要%in%起作用的原因
#class(leadsnp1)
res <- match1 %>% # as.data
  filter(SNP %in% c(leadsnp1[,4])) # i donot konw, res is null
  # filter(SNP %in% c('1:713158'))

write_delim(res, "/home/wangzhe/projects/20220629_GWA_tutorial/PRS/file1.txt",col_names = T)

# error
# 替换




## i want leadsnp but leadsnp donot have OR

leadsnp1 <- data.frame(leadsnp)
class(leadsnp1)
