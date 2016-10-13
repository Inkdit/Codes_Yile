FrequentUser <- function(Freq){
library(RPostgreSQL)
drv <- dbDriver("PostgreSQL")
conn <- dbConnect(drv, dbname = "Inkdit", user = "postgres", password = "314159")
result <- dbGetQuery(conn, "SELECT * FROM (select creator_id, count(*) AS totalNum from contracts group by creator_id) AS foo ORDER BY totalNum")

dim(result[2])
max(result[2])
aa = quantile(t(result[2]), probs = seq(0, 1, by= 0.01))

plot(1:nrow(result), cumsum(t(result[2]))/sum(t(result[2])))
aa
barplot(aa)

Frequent_user = subset(result, result[2] >= Freq)
return(Frequent_user)
}