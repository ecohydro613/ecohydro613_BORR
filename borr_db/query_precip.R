#######################################################################
# name: borr_db_query_example.R
# author: Gopal Penny, modified from Michael Koohafkan
# purpose: function definitions for database querying and data cleaning
#######################################################################
#

source("borr-dbfuncs.R")

require(RPostgreSQL)

connectBORR <- function() {
  drv <- dbDriver("PostgreSQL")
  dbName <- 'BORRmod' 
  dbUser <- 'postgres' 
  dbPassword <- 'borr'
  port <- '5432'
  conn <- dbConnect(drv, host='LocalHost',dbname=dbName, port=port, user=dbUser, password=dbPassword)
  return(conn)
}

conn <- connectBORR()

query <- "SELECT * FROM public.es2000_sensor_results"

query <- "SELECT result_time, nodeid, rain, rainrate, raintotal, temp, humidity FROM es2000_sensor_results"

precip.query <- "SELECT es2000_sensor_results.result_time,
es2000_sensor_results.nodeid,
es2000_sensor_results.rain, 
es2000_sensor_results.rainrate, 
es2000_sensor_results.raintotal, 
es2000_sensor_results.temp, 
es2000_sensor_results.humidity,
xserv_join_map_info.deviceid
FROM es2000_sensor_results
LEFT JOIN xserv_join_map_info
ON es2000_sensor_results.nodeid=xserv_join_map_info.nodeid --USING (nodeid) --"



res <- dbSendQuery(conn, "SELECT * FROM node_properties")
abc <- fetch(res,n=-1)

# dbClearResult(dbListResults(conn)[[1]])
