library(tidyverse)
library(dplyr)
library(stringi)
library(scales)

setwd("/Users/macbookpro/Desktop/DataScience_Ishwar")

house2019 = read_csv("Datasets/House Price-2019.csv", show_col_types = FALSE)

house2020 = read_csv("Datasets/House Price-2020.csv", show_col_types = FALSE)

house2021 = read_csv("Datasets/House Price-2021.csv",show_col_types = FALSE)

house2022= read_csv("Datasets/House Price-2022.csv",show_col_types = FALSE)

colnames(house2019) = c("ID" , "Price", "Year", "PostCode" , "PAON", "SAON", "FL", "House Num", "Flat", "Street Name",
                     
                     "Locality", "Town" , "District", "County", "Type1", "Type2" )

colnames(house2020) = c("ID" , "Price", "Year", "PostCode" , "PAON", "SAON", "FL", "House Num", "Flat", "Street Name",
                     
                     "Locality", "Town" , "District", "County", "Type1", "Type2")

colnames(house2021) = c("ID" , "Price", "Year", "PostCode" , "PAON", "SAON", "FL", "House Num", "Flat", "Street Name",
                     
                     "Locality", "Town" , "District", "County" , "Type1", "Type2")

colnames(house2022) = c("ID" , "Price", "Year", "PostCode" , "PAON", "SAON", "FL", "House Num", "Flat", "Street Name",
                     
                     "Locality", "Town" , "District", "County" , "Type1", "Type2")



HousePrices = rbind(house2019,house2020,house2021,house2022) %>% 
  
  na.omit() %>% 
  
  distinct() %>% 
  
  as_tibble()

View(HousePrices)
write.csv(HousePrices, "Cleaning/cleaned datasets/Combined_House_Pricing_2019-2022.csv")

FilteredHousePrices = filter(HousePrices, County == 'OXFORDSHIRE' | County == 'YORK' | County == 'WEST YORKSHIRE' | County == 'NORTH YORKSHIRE' | County == 'SOUTH YORKSHIRE' )



# Replace "YORK" with "YORKSHIRE" in the COUNTY column

FilteredHousePrices$County[FilteredHousePrices$County == "YORK"] <- "YORKSHIRE"





view(FilteredHousePrices)



pattern = ' .*$'
FilteredHousePrices = FilteredHousePrices %>% 
  
  mutate(shortPostcode=gsub(pattern,"",PostCode)) %>%
  
  mutate(Year = str_trim(substring(Year, 1,4))) %>% 
  
  select(PostCode,shortPostcode,Year,PAON,Price) %>% 
  
  na.omit() %>% 
  
  distinct() %>% 
  
  as_tibble()

View(FilteredHousePrices)

# exporting filteredhouseprices data set to  csv

write.csv(FilteredHousePrices, "Cleaning/Cleaned datasets/Cleaned_House_Pricing_2019-2022.csv",row.names = FALSE)



