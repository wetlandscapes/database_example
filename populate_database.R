library(glue)
library(duckdb)
library(tidyverse)

#Files
data_files <- c(
  CROP_DATA = "data/raw/Annual_Crop_Data.csv",
  FARM_PRICES = "data/raw/Monthly_Farm_Prices.csv",
  DAILY_FX = "data/raw/Daily_FX.csv",
  MONTHLY_FX = "data/raw/Monthly_FX.csv"
)

#Connect to database
conn <- dbConnect(duckdb(), "data/database/example.duckdb")

#Populate the tables
data_files |>
  map(~ .x |>
    read_csv()) |>
  #.x: The dataframe representing a table
  #.y: The name of a table
  iwalk(~ dbWriteTable(conn = conn, name = .y, value = .x, overwrite = TRUE))

#Check tables
dbListTables(conn)

#Disconnect
dbDisconnect(conn)
