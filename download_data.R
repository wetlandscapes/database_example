#Dependencies
library(glue)
library(tidyverse)

#"Main" download directory
ibm_dir <- paste0("https://cf-courses-data.s3.us.cloud-object-storage.",
  "appdomain.cloud/IBM-RP0203EN-SkillsNetwork/labs/Final%20Project/")

#Indivdual table names and download locations
data_files <- c(
  CROP_DATA = "Annual_Crop_Data.csv",
  FARM_PRICES = "Monthly_Farm_Prices.csv",
  DAILY_FX = "Daily_FX.csv",
  MONTHLY_FX = "Monthly_FX.csv"
)

#Read in the data
db_data <- data_files |>
  map(
    #Combine the main and table strings
    ~ paste0(ibm_dir, .x) |>
    #Read in the data to memory
    read_csv())

#Write files
db_data |>
  enframe() |>
  rename(data = value) |>
  left_join(enframe(data_files), by = "name") |>
  mutate(dir = glue("data/raw/{value}")) |>
  pull(data, name = dir) |>
  iwalk(~ write_csv(x = .x, file = .y))
