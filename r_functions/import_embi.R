#####
#limpando o cash/workspace
rm(list = ls())

#limpando todas as figuras/graficos
graphics.off()

#definindo pasta de trabalho
my.d <- dirname(rstudioapi::getActiveDocumentContext()$path)
setwd(my.d)
getwd()

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

my.df <- risco
glimpse(my.df)
names(my.df)
class(my.df)

#renomenado as colunas do df
names(my.df) <- c('DATA', 'RISCO_PAIS')
names(my.df)
dim(my.df)

#primeiros elementos do dataframe
head(my.df)

#ultimos elementos do dataframe
tail(my.df)

#exportando
write_csv(x = my.df, path = 'D:/public/investimentos/0_others_db/db_embi.csv')
write_csv(x = my.df, path = '../data/embi.csv')
