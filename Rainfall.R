getwd()
library(tesseract)
eng <- tesseract("eng")
text <- ocr("http://www.fao.org/docrep/005/Y4473E/y4473e0r.gif",engine = eng)


a <- as.data.frame(substr(text,356,370))
b <- as.data.frame(substr(text,414,418))
colnames(a) <- c("xxx")
colnames(b) <- c("xxx")
Central_Europe <- cbind(a,b)
colnames(Central_Europe) <- c("Region","Water_Resource_in_Percentage")

a <- as.data.frame(substr(text,434,454))
b <- as.data.frame(substr(text,497,501))
colnames(a) <- c("xxx")
colnames(b) <- c("xxx")
Eastern_Europe <- cbind(a,b)
colnames(Eastern_Europe) <- c("Region","Water_Resource_in_Percentage")

a <- as.data.frame(substr(text,516,531))
b <- as.data.frame(substr(text,572,576))
colnames(a) <- c("xxx")
colnames(b) <- c("xxx")
Northern_Europe <- cbind(a,b)
colnames(Northern_Europe) <- c("Region","Water_Resource_in_Percentage")

a <- as.data.frame(substr(text,595,608))
b <- as.data.frame(substr(text,651,656))
colnames(a) <- c("xxx")
colnames(b) <- c("xxx")
Western_Europe <- cbind(a,b)
colnames(Western_Europe) <- c("Region","Water_Resource_in_Percentage")

Rainfall <- rbind(Central_Europe,Eastern_Europe,Northern_Europe,Western_Europe)
Rainfall$Region <- as.character(Rainfall$Region)
Rainfall$Water_Resource_in_Percentage <- as.character(Rainfall$Water_Resource_in_Percentage)
Rainfall$Region <- gsub(pattern = "Medilerranean" , Rainfall$Region, replacement = "Eastern")
Rainfall$Region <- gsub(pattern = "Weslern" , Rainfall$Region, replacement = "Western")

Rainfall$Water_Resource_in_Percentage <- as.numeric(Rainfall$Water_Resource_in_Percentage)
write.csv(Rainfall,file="Rainfall.csv",row.names = FALSE)



