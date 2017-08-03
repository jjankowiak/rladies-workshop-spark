##### SET UP ENVIRONMENT #####
install.packages("devtools")
library(devtools)

# download lastest version of sparklyr
devtools::install_github("rstudio/sparklyr")
# SPARKLYR
# - Connect to Spark from R. The sparklyr package provides a complete dplyr backend.
# - Filter and aggregate Spark datasets then bring them into R for analysis and visualization.
# - Use Spark’s distributed machine learning library from R.

# You can install the sparklyr package from CRAN as follows:
install.packages("sparklyr")
# To upgrade to the latest version of sparklyr, run the following command and restart your r session:
# devtools::install_github("rstudio/sparklyr")
library(sparklyr)

# check available versions of spark
spark_available_versions()

# if spark_available_versions() does not work install
# devtools::install_github("rstudio/spark-install", subdir = "R")
# library(sparkinstall)

# install locally the latest version
spark_install(version = "2.2.0")

##### CONNECTING TO SPARK #####
# You can connect to both local instances of Spark as well as remote Spark clusters. 
# Here we’ll connect to a local instance of Spark via the spark_connect function:
    
library(sparklyr)
sc <- spark_connect(master = "local")
# The returned Spark connection (sc) provides a remote dplyr data source to the Spark cluster.
# now we can open SparkUI in browser

##### USING DPLYR #####
# http://spark.rstudio.com/dplyr.html
library(dplyr)

src_tbls(sc)

# for second and third data set
install.packages(c("nycflights13", "Lahman"))
library(nycflights13)
library(Lahman)
iris_tbl <- copy_to(sc, iris)
flights_tbl <- copy_to(sc, nycflights13::flights, "flights")
batting_tbl <- copy_to(sc, Lahman::Batting, "batting")
src_tbls(sc)

##### USING SQL #####
# http://spark.rstudio.com/dplyr.html#sql_translation
library(DBI)
# get from Spark to R (?)
iris_preview <- dbGetQuery(sc, "SELECT * FROM iris LIMIT 10")
iris_preview

##### MACHINE LEARNING #####
# http://spark.rstudio.com/mllib.html
# http://spark.rstudio.com/examples.html

# finally we disconnect from Spark
spark_disconnect(sc)
