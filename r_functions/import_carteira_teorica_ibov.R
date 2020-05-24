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
library(XML)
library(readr)
library(tidyverse)

#set url
#http://www.b3.com.br/pt_br/market-data-e-indices/indices/indices-amplos/indice-ibovespa-ibovespa-composicao-da-carteira.htm
#http://bvmf.bmfbovespa.com.br/indices/ResumoCarteiraTeorica.aspx?Indice=IBOV&idioma=pt-br
my.url <-paste0('http://bvmf.bmfbovespa.com.br/',
                'indices/ResumoCarteiraTeorica.aspx?Indice=IBOV&idioma=pt-br')

#lendo o site
l.out <- readHTMLTable(my.url, encoding = 'UTF-8')

#checando conteudos
glimpse(l.out)
class(l.out$ctl00_contentPlaceHolderConteudo_grdResumoCarteiraTeorica_ctl00)

my.df <- tbl_df(l.out$ctl00_contentPlaceHolderConteudo_grdResumoCarteiraTeorica_ctl00)
glimpse(my.df)
names(my.df)
class(my.df)

#renomenado oas colunas do df
names(my.df) <- c('ATIVO', 'NOME_EMPRESA', 'TIPO', 'QTD_TEORICA', 'PORC_PART')
names(my.df)
dim(my.df)

#tratando/convertendo variaveis
my.df$ATIVO <- as.character(my.df$ATIVO)
my.df$NOME_EMPRESA <- as.character(my.df$NOME_EMPRESA)
my.df$TIPO <- as.factor(my.df$TIPO)
my.df$QTD_TEORICA <- parse_double(str_replace_all(my.df$QTD_TEORICA, '[.]', ''),
                                  locale = locale(decimal_mark = ',',
                                                  grouping_mark = '.')
                                  )
my.df$PORC_PART <- parse_double(str_replace_all(my.df$PORC_PART, '[,]', ','),
                                locale = locale(decimal_mark = ',',
                                                grouping_mark = '.')
                                )
glimpse(my.df)

#primeiros elementos do dataframe
head(my.df)

#ultimos elementos do dataframe
tail(my.df)

#exportando
#write_xlsx(x = my.df, path = "../data/ibov.xlsx")
write_csv(x = my.df, path = 'D:/public/investimentos/0_others_db/b3_carteira_teorica/ibov.csv')
write_csv(x = my.df, path = '../data/ibov.csv')

