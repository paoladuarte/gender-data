library(dplyr)

male_names <- read.csv("male.txt", comment.char = "#", header = FALSE,
                       col.names = "name", stringsAsFactors = F)
female_names <- read.csv("female.txt", comment.char = "#", header = FALSE,
                         col.names = "name", stringsAsFactors = F)
male_names$gender <- "M"
female_names $gender <- "F"
names <-  rbind(male_names, female_names)
ambiguous <- semi_join(male_names, female_names, by = "name") 
names$gender[names$name %in% ambiguous$name] <- "either"
names <- unique(names)
names$row.names <- NULL
rm(ambiguous, female_names,male_names)
save(names, file = "kantrowitz.rda", compress = TRUE)
