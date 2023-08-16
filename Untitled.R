#install.packages("tidyverse")
library(tidyverse)

Data2019 = read.csv("/Users/macbookpro/Desktop/housepricing/housepricing-2019.csv")

Data2020 = read.csv("/Users/macbookpro/Desktop/housepricing/housepricing-2020.csv")

Data2021 = read.csv("/Users/macbookpro/Desktop/housepricing/housepricing-2021.csv")

Data2022 = read.csv("/Users/macbookpro/Desktop/housepricing/housepricing-2022.csv")


View(Data2020)

#Binding Data

colnames(Data2020) = c("HouseID", "Price", "Date", "Postcode", "PAON", "SAON", "FL",
                     "HouseNum", "Flat","Street", "Locality","Town", "District", "County","Type1","Type2")
colnames(Data2020) = c("HouseID", "Price", "Date", "Postcode", "PAON", "SAON", "FL",
                     "HouseNum", "Flat","Street", "Locality","Town", "District", "County","Type1","Type2")
colnames(Data2021) = c("HouseID", "Price", "Date", "Postcode", "PAON", "SAON", "FL",
                     "HouseNum", "Flat","Street", "Locality","Town", "District", "County","Type1","Type2")
colnames(Data2022) = c("HouseID", "Price", "Date", "Postcode", "PAON", "SAON", "FL",
                     "HouseNum", "Flat","Street", "Locality","Town", "District", "County","Type1","Type2")

