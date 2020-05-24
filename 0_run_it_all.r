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

#listando as funcoes na pasta 'r_functions'
my.r.files <- list.files(path='r_functions',
                         pattern = '*.R',
                         full.names=TRUE)

#carregando todas as funcoes em R
sapply(my.r.files, source)

#importando todas as bases de dados
source('1_import_and_clear_data.R')

#rodando modelos e gerando resultados
source('2_run_models_research.R')
