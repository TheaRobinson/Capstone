library(reshape2)
library(tidyverse)

# Get Parcel ID Data
parcel_id <- read_csv("~/Documents/MKE_Parcel_ID.csv")

# Get MPROP Datea
mprop_19 <- read_csv("~/Downloads/MPROP_2019.csv")

# Clean Data
data <- mprop_19[, c(7, 10:12, 71)]
data$OWN_OCPD <- replace_na(data$OWN_OCPD, 'N')
data[6] <- paste(data$HOUSE_NR_LO, data$SDIR, data$STREET, data$STTYPE, sep = " ")
names(data)[6] <- 'address'

# Merge with Parcel IDs
new_data <- merge(parcel_id, data, by= 'address', all.x = TRUE)

# Write to CSV
write_csv(new_data, '~/Documents/owner_occupied_2019.csv')
