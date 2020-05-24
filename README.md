# estrutura_diretorio
Organizando o diretório do projeto.

[0_run_it_all.r]: Script principal onde é executado todos os códigos.

#listando as funcoes na pasta 'r_functions'
my.r.files <- list.files(path='r_functions',
                         pattern = '*.R',
                         full.names=TRUE)

#carregando todas as funcoes em R
sapply(my.r.files, source)

#importando todas as bases de dados e tratando variaveis
source('1_import_and_clear_data.R')

#rodando modelos e gerando resultados
source('2_run_models_research.R')

------------------------------------------------------------------------------------

[/r_functions]: Pasta onde contém os script em R para importação dos dados através do script principal.
[/result]: Pasta onde é gerado o arquivo importado através do script em R (script import dentro da pasta [/r_functions]). Aqui o arquivo já está devidamente tratado e pronto para ser utilizado pelo script '1_import_and_clear_data.R'.

[1_import_and_clear_data.R]: Script utilizado para importar o banco de dado devidamente tratado no diretório [/result]. Aqui pode ser feito qualquer alteração no BD para ser utilizado pelo script final '2_run_models_research.R'.
[2_run_models_research.R]: Script final onde é gerado o modelo especificado no projeto. Aqui também é possível gerar relatórios.  