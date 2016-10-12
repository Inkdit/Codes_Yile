rm(list = ls())
library(RPostgreSQL)
drv <- dbDriver("PostgreSQL")
conn <- dbConnect(drv, dbname = "Inkdit", user = "postgres", password = "314159")
result <- dbGetQuery(conn, "SELECT * FROM (select creator_id, count(*) AS totalNum from contracts group by creator_id) AS foo ORDER BY totalNum")
median(t(result[2]))
max(t(result[2]))
aa = quantile(t(result[2]), probs = seq(0, 1, by= 0.01))
barplot(aa)


