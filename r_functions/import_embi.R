#####
#instalar pacotes

#####
#carregar bibliotecas/pacotes
library(writexl)
library(dplyr)
library(readr)
library(ecoseries)

#importando dados do IPEAData
risco <- series_ipeadata("40940", periodicity = "D")$serie_40940
#renomenado oas colunas do df
colnames(risco) = c('date', 'risco')
class(risco)

my.df.risco <- risco
glimpse(my.df.risco)
names(my.df.risco)
class(my.df.risco)

#renomenado as colunas do df
names(my.df.risco) <- c('DATA', 'RISCO_PAIS')
names(my.df.risco)
dim(my.df.risco)

#primeiros elementos do dataframe
#head(my.df.risco)

#ultimos elementos do dataframe
#tail(my.df.risco)

#exportando
write_csv(x = my.df.risco, path = 'D:/public/investimentos/0_others_db/db_embi.csv')
write_csv(x = my.df.risco, path = 'result/embi.csv')

print("import_embi = OK")
