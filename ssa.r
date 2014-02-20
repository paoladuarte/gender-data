library(plyr)
library(dplyr)
library(reshape2)
library(stringr)

# The years that we have data for
years <- 1880:2012

# Empty data frame to hold all the files
ssa_melted <- data.frame(name = character(0), gender = character(0), 
                         count = integer(0), year = integer(0),
                         stringsAsFactors = FALSE)

# Load each of the files and add them to the data
for (year in years) {
  cat(str_join(year, " ... "))
  current <- read.csv(str_join("ssa/yob", year, ".txt"), stringsAsFactors = FALSE,
                      header = FALSE, col.names = c("name", "gender", "count")) 
  current$year <- year
  current <- tbl_df(current)
  current[current == "F"] <- "female"
  current[current == "M"] <- "male"
  ssa_melted <- rbind(ssa_melted, current)
}

# Make male and female their own columns
ssa_national <- dcast(ssa_melted, name + year ~ gender, value.var = "count")
ssa_national[is.na(ssa_national)] <- 0

rm(current, year, years, ssa_melted)

save(ssa_national, file = "ssa_national.rda", compress = TRUE)
write.csv(ssa_national, file = "ssa_national.csv", row.names = F)