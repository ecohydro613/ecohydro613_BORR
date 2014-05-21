#######################################################################
# name: borr_db_query_example.R
# author: Gopal Penny, modified from Michael Koohafkan
# purpose: function definitions for database querying and data cleaning
#######################################################################
#

require(RPostgreSQL)

# connectBORR <- function(){
drv <- dbDriver("PostgreSQL")
dbName <- 'BORRmod' 
dbUser <- 'postgres' 
dbPassword <- 'borr'
port <- '5432'
conn <- dbConnect(drv, host='LocalHost',dbname=dbName, port=port, user=dbUser, password=dbPassword)

res <- dbSendQuery(conn, "SELECT * FROM node_properties")
abc <- fetch(res,n=-1)

# dbClearResult(dbListResults(conn)[[1]])
