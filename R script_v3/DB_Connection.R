rm(list = ls())
library(RPostgreSQL)

libs <- c('tm','wordcloud','Rgraphviz')
lapply(libs,require, character.only = TRUE)

drv <- dbDriver("PostgreSQL")
conn <- dbConnect(drv, dbname = "Inkdit", user = "postgres", password = "314159")
result <- dbGetQuery(conn, "SELECT content FROM contracts WHERE creator_id = 39024")
result = t(result)

cleanFun <- function(htmlString) {
  htmlString<-(gsub("<.*?>", "", htmlString))
  return(gsub("\n", "", htmlString))
  
}

kankan <- cleanFun(result)
View(kankan)

kankan <-  Corpus(VectorSource(kankan))


myStpwdlist = c("hello")
cleanCorpus <- function(corpus){
  corpus_cl <- tm_map(corpus,content_transformer(gsub),pattern = '[[:punct:]]',replacement = ' ')
  corpus_cl <- tm_map(corpus_cl,stripWhitespace)
  corpus_cl <- tm_map(corpus_cl,content_transformer(tolower))
  corpus_cl <- tm_map(corpus_cl,removeWords,c(myStpwdlist,stopwords('english')))
  corpus_cl <- tm_map(corpus_cl,removeNumbers)
  #  corpus_cl <- tm_map(corpus_cl, stemDocument)
  
  result <- corpus_cl
}
kankan2 = cleanCorpus(kankan)
dtm <- DocumentTermMatrix(kankan2)
dim_dtm <- dim(dtm)
TDM = inspect(dtm[1:dim_dtm[1], 1:dim_dtm[2]])
TDM <- t(TDM)
write.csv(TDM, file = "G:\\Codes\\Text_Mining\\R script_v3\\kankan.csv")


###############################################
# txt <- c("Hello to you.", "Blah me, too.")
# library(tm)
# corp <- Corpus(VectorSource(txt))
# dtm <- DocumentTermMatrix(corp)
# dim_dtm <- dim(dtm)
# TDM = inspect(dtm[1:dim_dtm[1], 1:dim_dtm[2]])
# TDM <- t(TDM)
# View(TDM)