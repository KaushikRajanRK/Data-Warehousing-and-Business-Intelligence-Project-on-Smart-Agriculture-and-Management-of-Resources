setwd("D:/Education/IRELAND/NCI/Moodle Documents/SEM 1/DWBI/DataSets/Agriculture")
// Cleaning Datasets from FAO

library(countrycode)
library(tidyr)
library(sqldf)

Eastern_Europe<-read.csv("Eastern Europe.csv")
Western_Europe<-read.csv("Western Europe.csv")
Southern_Europe<-read.csv("Southern Europe.csv")
Northern_Europe<-read.csv("Northern Europe.csv")

Eastern_Europe$Region<- "Eastern_Europe"
Western_Europe$Region<- "Western_Europe"
Southern_Europe$Region<- "Southern_Europe"
Northern_Europe$Region<- "Northern_Europe"

Region<-rbind(Eastern_Europe,Western_Europe,Southern_Europe,Northern_Europe)

library(countrycode)
Region<-Region[c(4,8,10,12,15)]
Region$Country_Code <- countrycode(Region$Area,'country.name','iso3c')



//write.csv(Region,file="Region.csv")

//Importing data

Barley<- read.csv("Barley by area, production and humidity.csv")
Cereals<-read.csv("Cereals for the production of grain.csv")
Dry_pulses<-read.csv("Dry pulses and protein crops.csv")
Fresh_vegetables<-read.csv("Fresh vegetables and strawberries by area.csv")
Grain_maize<-read.csv("Grain maize and corn-cob-mix by area, production and humidity.csv")
Root_Crops<-read.csv("Root crops and plants harvested green from arable land by area.csv")
Grapes<-read.csv("Grapes by production.csv")
green_maize<-read.csv("Grapes by production.csv")
oats<-read.csv("Oats and spring cereal mixtures by area, production and humidity.csv")
Olives<-read.csv("Olives by production.csv")
Permanent_crops<-read.csv("Permanent crops for human consumption by area.csv")
turnip_rape<-read.csv("Rape, turnip rape, sunflower seeds and soya by area.csv")
Rye<-read.csv("Rye and winter cereal mixtures by area, production and humidity.csv")
Utilised_agricultural_area<-read.csv("Utilised agricultural area by categories.csv")
Wheat<-read.csv("Wheat.csv")
total_agriculture_land_statista<-read.csv("statistic_id315937_total-agricultural-land-area-in-the-united-kingdom--uk--2003-2017.csv")

//Cleaning

Barley<-Barley[c(2,6:44),]
Cereals<-Cereals[c(2,6:44),]
Dry_pulses<-Dry_pulses[c(2,6:44),]
Fresh_vegetables<-Fresh_vegetables[c(3,7:45),]
Grain_maize<-Grain_maize[c(2,6:44),]
Grapes<-Grapes[c(3,7:45),]
green_maize<-green_maize[c(3,7:45),]
oats<-oats[c(2,6:44),]
Olives<-Olives[c(3,7:45),]
Permanent_crops<-Permanent_crops[c(3,7:45),]
Root_Crops<-Root_Crops[c(3,7:45),]
Rye<-Rye[c(2,6:44),]
total_agriculture_land_statista<-total_agriculture_land_statista[c(2:17),]
turnip_rape<-turnip_rape[c(3,7:45),]
Utilised_agricultural_area<-Utilised_agricultural_area[c(3,7:45),]
Wheat<-Wheat[c(2,6:44),]

// Wheat Cleaning

Wheat<-read.csv("Wheat.csv")
Wheat<-Wheat[c(2,6:44),]
colnames(Wheat) <- as.character(unlist(Wheat[1,]))
Wheat = Wheat[-1, ]
rownames(Wheat) <- c(1:nrow(Wheat))
Wheat <- Wheat[,c(-3,-5,-7,-9,-11,-13,-15,-17,-19,-21,-23,-25)]
Wheat <- Wheat %>% gather(Year,Production,`2007`,`2008`,`2009`,`2010`,`2011`,`2012`,`2013`,`2014`,`2015`,`2016`,`2017`,`2018`)
colnames(Wheat) <- c("Country","Year","Production")



library(sqldf)
Wheat<- sqldf('Select * from Wheat Where Production != ":"')
Wheat$crop_name <- "wheat"
Wheat$Country_Code <- countrycode(Wheat$Country,'country.name','iso3c')

Wheat<- na.omit(Wheat)


// Barley cleaning

colnames(Barley)<-as.character(unlist(Barley[1,]))
Barley = Barley[-1,]
rownames(Barley)<-c(1:nrow(Barley))
Barley <- Barley[,c(-3,-5,-7,-9,-11,-13,-15,-17,-19,-21,-23,-25)]
Barley <- Barley %>% gather(Year,Production,`2007`,`2008`,`2009`,`2010`,`2011`,`2012`,`2013`,`2014`,`2015`,`2016`,`2017`,`2018`)
colnames(Barley) <- c("Country","Year","Production")

Barley<- sqldf('Select * from Barley Where Production != ":"')
Barley$crop_name <- "Barley"
Barley$Country_Code <- countrycode(Barley$Country,'country.name','iso3c')

Barley<- na.omit(Barley)

// Cereals cleaning
colnames(Cereals)<-as.character(unlist(Cereals[1,]))
Cereals = Cereals[-1,]
rownames(Cereals)<-c(1:nrow(Cereals))
Cereals <- Cereals[,c(-3,-5,-7,-9,-11,-13,-15,-17,-19,-21,-23,-25)]
Cereals <- Cereals %>% gather(Year,Production,`2007`,`2008`,`2009`,`2010`,`2011`,`2012`,`2013`,`2014`,`2015`,`2016`,`2017`,`2018`)
colnames(Cereals) <- c("Country","Year","Production")

Cereals<- sqldf('Select * from Cereals Where Production != ":"')
Cereals$crop_name <- "Cereals"
Cereals$Country_Code <- countrycode(Cereals$Country,'country.name','iso3c')

Cereals<- na.omit(Cereals)

// Dry_pulses Cleaning

colnames(Dry_pulses)<-as.character(unlist(Dry_pulses[1,]))
Dry_pulses = Dry_pulses[-1,]
rownames(Dry_pulses)<-c(1:nrow(Dry_pulses))
Dry_pulses <- Dry_pulses[,c(-3,-5,-7,-9,-11,-13,-15,-17,-19,-21,-23,-25)]
Dry_pulses <- Dry_pulses %>% gather(Year,Production,`2007`,`2008`,`2009`,`2010`,`2011`,`2012`,`2013`,`2014`,`2015`,`2016`,`2017`,`2018`)
colnames(Dry_pulses) <- c("Country","Year","Production")

Dry_pulses<- sqldf('Select * from Dry_pulses Where Production != ":"')
Dry_pulses$crop_name <- "Dry_pulses"
Dry_pulses$Country_Code <- countrycode(Dry_pulses$Country,'country.name','iso3c')

Dry_pulses<- na.omit(Cereals)

// Fresh_vegetables Cleaning

colnames(Fresh_vegetables)<-as.character(unlist(Fresh_vegetables[1,]))
Fresh_vegetables = Fresh_vegetables[-1,]
rownames(Fresh_vegetables)<-c(1:nrow(Fresh_vegetables))
Fresh_vegetables <- Fresh_vegetables[,c(-3,-5,-7,-9,-11,-13,-15,-17,-19,-21,-23,-25)]
Fresh_vegetables <- Fresh_vegetables %>% gather(Year,Production,`2007`,`2008`,`2009`,`2010`,`2011`,`2012`,`2013`,`2014`,`2015`,`2016`,`2017`,`2018`)
colnames(Fresh_vegetables) <- c("Country","Year","Production")

Fresh_vegetables<- sqldf('Select * from Fresh_vegetables Where Production != ":"')
Fresh_vegetables$crop_name <- "Fresh_vegetables"
Fresh_vegetables$Country_Code <- countrycode(Fresh_vegetables$Country,'country.name','iso3c')

Fresh_vegetables<- na.omit(Fresh_vegetables)


// Grain_maize Cleaning

colnames(Grain_maize)<-as.character(unlist(Grain_maize[1,]))
Grain_maize = Grain_maize[-1,]
rownames(Grain_maize)<-c(1:nrow(Grain_maize))
Grain_maize <- Grain_maize[,c(-3,-5,-7,-9,-11,-13,-15,-17,-19,-21,-23,-25)]
Grain_maize <- Grain_maize %>% gather(Year,Production,`2007`,`2008`,`2009`,`2010`,`2011`,`2012`,`2013`,`2014`,`2015`,`2016`,`2017`,`2018`)
colnames(Grain_maize) <- c("Country","Year","Production")

Grain_maize<- sqldf('Select * from Grain_maize Where Production != ":"')
Grain_maize$crop_name <- "Grain_maize"
Grain_maize$Country_Code <- countrycode(Grain_maize$Country,'country.name','iso3c')

Grain_maize<- na.omit(Grain_maize)

// Grapes Cleaning

colnames(Grapes)<-as.character(unlist(Grapes[1,]))
Grapes = Grapes[-1,]
rownames(Grapes)<-c(1:nrow(Grapes))
Grapes <- Grapes[,c(-3,-5,-7,-9,-11,-13,-15,-17,-19,-21,-23,-25)]
Grapes <- Grapes %>% gather(Year,Production,`2007`,`2008`,`2009`,`2010`,`2011`,`2012`,`2013`,`2014`,`2015`,`2016`,`2017`,`2018`)
colnames(Grapes) <- c("Country","Year","Production")

Grapes<- sqldf('Select * from Grapes Where Production != ":"')
Grapes$crop_name <- "Grapes"
Grapes$Country_Code <- countrycode(Grapes$Country,'country.name','iso3c')

Grapes<- na.omit(Grapes)

// green_maize Cleaning

colnames(green_maize)<-as.character(unlist(green_maize[1,]))
green_maize = green_maize[-1,]
rownames(green_maize)<-c(1:nrow(green_maize))
green_maize <- green_maize[,c(-3,-5,-7,-9,-11,-13,-15,-17,-19,-21,-23,-25)]
green_maize <- green_maize %>% gather(Year,Production,`2007`,`2008`,`2009`,`2010`,`2011`,`2012`,`2013`,`2014`,`2015`,`2016`,`2017`,`2018`)
colnames(green_maize) <- c("Country","Year","Production")

green_maize<- sqldf('Select * from green_maize Where Production != ":"')
green_maize$crop_name <- "green_maize"
green_maize$Country_Code <- countrycode(green_maize$Country,'country.name','iso3c')

green_maize<- na.omit(green_maize)

// oats Cleaning

colnames(oats)<-as.character(unlist(oats[1,]))
oats = oats[-1,]
rownames(oats)<-c(1:nrow(oats))
oats <- oats[,c(-3,-5,-7,-9,-11,-13,-15,-17,-19,-21,-23,-25)]
oats <- oats %>% gather(Year,Production,`2007`,`2008`,`2009`,`2010`,`2011`,`2012`,`2013`,`2014`,`2015`,`2016`,`2017`,`2018`)
colnames(oats) <- c("Country","Year","Production")

oats<- sqldf('Select * from oats Where Production != ":"')
oats$crop_name <- "oats"
oats$Country_Code <- countrycode(oats$Country,'country.name','iso3c')

oats<- na.omit(oats)

//Olives Cleaning

colnames(Olives)<-as.character(unlist(Olives[1,]))
Olives = Olives[-1,]
rownames(Olives)<-c(1:nrow(Olives))
Olives <- Olives[,c(-3,-5,-7,-9,-11,-13,-15,-17,-19,-21,-23,-25)]
Olives <- Olives %>% gather(Year,Production,`2007`,`2008`,`2009`,`2010`,`2011`,`2012`,`2013`,`2014`,`2015`,`2016`,`2017`,`2018`)
colnames(Olives) <- c("Country","Year","Production")

Olives<- sqldf('Select * from Olives Where Production != ":"')
Olives$crop_name <- "Olives"
Olives$Country_Code <- countrycode(Olives$Country,'country.name','iso3c')

Olives<- na.omit(Olives)

// Permanent_crops Cleaning

colnames(Permanent_crops)<-as.character(unlist(Permanent_crops[1,]))
Permanent_crops = Permanent_crops[-1,]
rownames(Permanent_crops)<-c(1:nrow(Permanent_crops))
Permanent_crops <- Permanent_crops[,c(-3,-5,-7,-9,-11,-13,-15,-17,-19,-21,-23,-25)]
Permanent_crops <- Permanent_crops %>% gather(Year,Production,`2007`,`2008`,`2009`,`2010`,`2011`,`2012`,`2013`,`2014`,`2015`,`2016`,`2017`,`2018`)
colnames(Permanent_crops) <- c("Country","Year","Production")

Permanent_crops<- sqldf('Select * from Permanent_crops Where Production != ":"')
Permanent_crops$crop_name <- "Permanent_crops"
Permanent_crops$Country_Code <- countrycode(Permanent_crops$Country,'country.name','iso3c')

Permanent_crops<- na.omit(Permanent_crops)

// Root_Crops Cleaning

colnames(Root_Crops)<-as.character(unlist(Root_Crops[1,]))
Root_Crops = Root_Crops[-1,]
rownames(Root_Crops)<-c(1:nrow(Root_Crops))
Root_Crops <- Root_Crops[,c(-3,-5,-7,-9,-11,-13,-15,-17,-19,-21,-23,-25)]
Root_Crops <- Root_Crops %>% gather(Year,Production,`2007`,`2008`,`2009`,`2010`,`2011`,`2012`,`2013`,`2014`,`2015`,`2016`,`2017`,`2018`)
colnames(Root_Crops) <- c("Country","Year","Production")

Root_Crops<- sqldf('Select * from Root_Crops Where Production != ":"')
Root_Crops$crop_name <- "Root_Crops"
Root_Crops$Country_Code <- countrycode(Root_Crops$Country,'country.name','iso3c')

Root_Crops<- na.omit(Root_Crops)

// Rye Cleaning

colnames(Rye)<-as.character(unlist(Rye[1,]))
Rye = Rye[-1,]
rownames(Rye)<-c(1:nrow(Rye))
Rye <- Rye[,c(-3,-5,-7,-9,-11,-13,-15,-17,-19,-21,-23,-25)]
Rye <- Rye %>% gather(Year,Production,`2007`,`2008`,`2009`,`2010`,`2011`,`2012`,`2013`,`2014`,`2015`,`2016`,`2017`,`2018`)
colnames(Rye) <- c("Country","Year","Production")

Rye<- sqldf('Select * from Rye Where Production != ":"')
Rye$crop_name <- "Rye"
Rye$Country_Code <- countrycode(Rye$Country,'country.name','iso3c')

Rye<- na.omit(Rye)

// turnip_rape Cleaning

colnames(turnip_rape)<-as.character(unlist(turnip_rape[1,]))
turnip_rape = turnip_rape[-1,]
rownames(turnip_rape)<-c(1:nrow(turnip_rape))
turnip_rape <- turnip_rape[,c(-3,-5,-7,-9,-11,-13,-15,-17,-19,-21,-23,-25)]
turnip_rape <- turnip_rape %>% gather(Year,Production,`2007`,`2008`,`2009`,`2010`,`2011`,`2012`,`2013`,`2014`,`2015`,`2016`,`2017`,`2018`)
colnames(turnip_rape) <- c("Country","Year","Production")

turnip_rape<- sqldf('Select * from turnip_rape Where Production != ":"')
turnip_rape$crop_name <- "turnip_rape"
turnip_rape$Country_Code <- countrycode(turnip_rape$Country,'country.name','iso3c')

turnip_rape<- na.omit(turnip_rape)

// Utilised_agricultural_area

Utilised_agricultural_area<-read.csv("Utilised agricultural area by categories.csv")
Utilised_agricultural_area<-Utilised_agricultural_area[c(3,7:45),]
Utilised_agricultural_area <- Utilised_agricultural_area[,c(-3,-5,-7,-9,-11,-13,-15,-17,-19,-21,-23,-25)]
colnames(Utilised_agricultural_area)<-as.character(unlist(Utilised_agricultural_area[1,]))
Utilised_agricultural_area = Utilised_agricultural_area[-1,]
rownames(Utilised_agricultural_area)<-c(1:nrow(Utilised_agricultural_area))

Utilised_agricultural_area <- Utilised_agricultural_area %>% gather(Year,Production,`2007`,`2008`,`2009`,`2010`,`2011`,`2012`,`2013`,`2014`,`2015`,`2016`,`2017`,`2018`)
colnames(Utilised_agricultural_area) <- c("Country","Year","Production")

Utilised_agricultural_area<- sqldf('Select * from Utilised_agricultural_area Where Production != ":"')
Utilised_agricultural_area$crop_name <- "Utilised_agricultural_area"
Utilised_agricultural_area$Country_Code <- countrycode(Utilised_agricultural_area$Country,'country.name','iso3c')

Utilised_agricultural_area<- na.omit(Utilised_agricultural_area)


crop <- rbind(Wheat,Barley,Cereals,Dry_pulses,Fresh_vegetables,Grain_maize,Grapes,green_maize,oats,Olives,Permanent_crops,Root_Crops,Rye,turnip_rape,Utilised_agricultural_area)
crop <- sqldf('select distinct b.Region,a.* from crop a join Region b on a.Country_Code = b.Country_Code')
colnames(Region)[4] <- "Value_pesticide"






// Statista

colnames(total_agriculture_land_statista)<-as.character(unlist(total_agriculture_land_statista[1,]))
total_agriculture_land_statista = total_agriculture_land_statista[-1,]
colnames(total_agriculture_land_statista) <- c("Year","Land use in thousand hectares")
library(stringr)


crop$Production<-as.numeric(crop$Production)
crop$Production<-round(crop$Production)
Region$Value_pesticide<-round(Region$Value_pesticide)

write.csv(crop, file = "crop.csv",row.names = FALSE)

write.csv(Region,file="Region.csv", row.names = FALSE)

//rm(Barley,Grain_maize,Grapes,green_maize,Northern_Europe,oats,Olives,Permanent_crops,Region,Root_Crops,Rye,Southern_Europe,total_agriculture_land_statista,turnip_rape,Z,Utilised_agricultural_area,Western_Europe,Wheat)
//rm(Barley,Cereals,crop,Dry_pulses,Eastern_Europe,Fresh_vegetables)
colnames(total_agriculture_land_statista)[2] <- "Agriculture_Land"
total_agriculture_land_statista$Agriculture_Land<- str_replace_all(total_agriculture_land_statista$Agriculture_Land, "[^[:alnum:]]", "")


write.csv(total_agriculture_land_statista,file="total_agriculture_land_Statista.csv",row.names = FALSE)


