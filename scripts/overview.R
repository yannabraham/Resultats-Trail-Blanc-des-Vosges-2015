library(ggplot2)
library(lubridate)
library(stringr)

dta <- read.delim("../Resultats-Trail-Blanc-des-Vosges-2015-clean.tsv",
	dec=','
)

dta$moi <- dta$Dossard==261

x11(960,960)
ggplot(dta,aes(x=as.numeric(dta$Temps),y=as.numeric(as.difftime(as.character(dta$Temps))),color=Sexe))+
	geom_point()

x11(960,960)
ggplot(dta,aes(x=as.numeric(dta$Temps),
		y=as.numeric(as.difftime(as.character(dta$Temps))),
		color=moi,size=moi))+
	geom_point()+
	scale_color_manual(values=c('lightgrey','royalblue'))+
	guides(color=FALSE,size=FALSE)

x11(960,960)
ggplot(dta,aes(x=as.numeric(dta$Temps),y=as.numeric(as.difftime(as.character(dta$Temps))),color=Categorie))+
	geom_point()

x11(960,960)
ggplot(subset(dta,Categorie=='V1'),aes(x=as.numeric(Temps),
		y=as.numeric(as.difftime(as.character(Temps))),
		color=moi,size=moi))+
	geom_point()+
	scale_color_manual(values=c('lightgrey','royalblue'))+
	guides(color=FALSE,size=FALSE)

x11(960,960)
ggplot(dta,aes(x=Categorie,y=Vitesse,fill=Categorie))+
	geom_boxplot()

clubs <- table(dta$Club)
top.clubs <- names(clubs)[clubs>=10]
top.clubs.dta <- subset(dta,Club %in% top.clubs)

head(table(tolower(dta$Club)))