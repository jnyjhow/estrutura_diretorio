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
ibov <- l.out$ctl00_contentPlaceHolderConteudo_grdResumoCarteiraTeorica_ctl00
class(ibov)

my.df.ibov <- tbl_df(ibov)
glimpse(my.df.ibov)
names(my.df.ibov)
class(my.df.ibov)

#renomenado oas colunas do df
names(my.df.ibov) <- c('ATIVO', 'NOME_EMPRESA', 'TIPO', 'QTD_TEORICA', 'PORC_PART')
names(my.df.ibov)
dim(my.df.ibov)

#tratando/convertendo variaveis
my.df.ibov$ATIVO <- as.character(my.df.ibov$ATIVO)
my.df.ibov$NOME_EMPRESA <- as.character(my.df.ibov$NOME_EMPRESA)
my.df.ibov$TIPO <- as.factor(my.df.ibov$TIPO)
my.df.ibov$QTD_TEORICA <- parse_double(str_replace_all(my.df.ibov$QTD_TEORICA, '[.]', ''),
                                  locale = locale(decimal_mark = ',',
                                                  grouping_mark = '.')
                                  )
my.df.ibov$PORC_PART <- parse_double(str_replace_all(my.df.ibov$PORC_PART, '[,]', ','),
                                locale = locale(decimal_mark = ',',
                                                grouping_mark = '.')
                                )
glimpse(my.df.ibov)

#primeiros elementos do dataframe
#head(my.df.ibov)

#ultimos elementos do dataframe
#tail(my.df.ibov)

#exportando
#write_xlsx(x = my.df, path = "../data/ibov.xlsx")
write_csv(x = my.df.ibov, path = 'D:/public/investimentos/0_others_db/b3_carteira_teorica/ibov.csv')
write_csv(x = my.df.ibov, path = 'result/ibov.csv')

print("import_carteira_teorica_ibov = OK")
