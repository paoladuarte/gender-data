library(plyr)
library(dplyr)
library(reshape2)
library(stringr)

# Concatenate the files that contain data for each state
setwd("ssa_state")
system("find . -iname '*.TXT' -exec cat {} > ssa_state.csv \\;")
setwd("..")

state_raw <- read.csv("ssa_state/ssa_state.csv", stringsAsFactors = FALSE,
                      header = FALSE, 
                      col.names = c("state", "gender", "year", "name", "count"))

# Cast the data so it has male and female columns 
ssa_state <- state_raw %.% dcast(name + year + state ~ gender, value.var = "count")

rm(ssa_raw)

ssa_state$name <- tolower(ssa_state$name)
ssa_state[is.na(ssa_state)] <- 0
ssa_state <- tbl_df(ssa_state)

save(ssa_state, file = "ssa_state.rda", compress = TRUE)
write.csv(ssa_state, file = "ssa_state.csv", row.names = F)
