## cleaning up the dataset
library(stringr)

dta <- read.delim("data/Resultats-Trail-Blanc-des-Vosges-2015.tsv",header=F,
	col.names=c('Classement_Scratch','Nom','Temps','Dossard','Classement_Categorie',
		'Categorie','Sexe','Club','Vitesse','bad.column'),
	dec=',',fileEncoding='UTF8'
)

# high level cleanup
dta[!is.na(dta$bad.column),'Vitesse'] <- dta[!is.na(dta$bad.column),'bad.column']
levels(dta$Categorie) <- str_trim(levels(dta$Categorie))
levels(dta$Nom) <- str_trim(levels(dta$Nom))
levels(dta$Nom) <- str_replace(levels(dta$Nom),' ','')
levels(dta$Nom) <- str_replace(levels(dta$Nom),'  ',' ')
levels(dta$Sexe) <- str_trim(levels(dta$Sexe))
levels(dta$Categorie) <- str_trim(levels(dta$Categorie))
levels(dta$Temps) <- str_trim(levels(dta$Temps))

# detail cleanup
levels(dta$Nom)[levels(dta$Nom)=='BONNET Elise bonnet nee le 14/01/1988'] <- 'BONNET Elise'
levels(dta$Nom)[levels(dta$Nom)=='?Dossard #1703'] <- 'INCONNU'

# unwanted spaces?
table(str_count(levels(dta$Nom),' '))
# several composite names, some composite surnames
levels(dta$Nom)[str_count(levels(dta$Nom),' ')>1]

# save back
write.table(dta[,c('Classement_Scratch','Nom','Temps','Dossard',
		'Classement_Categorie','Categorie','Sexe','Club','Vitesse')],
	'../Resultats-Trail-Blanc-des-Vosges-2015-clean.tsv',sep='\t',
	row.names=FALSE,quote=FALSE,fileEncoding='UTF8')

