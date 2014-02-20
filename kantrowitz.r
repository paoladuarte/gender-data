library(dplyr)
library(stringr)

male_names <- read.csv("kantrowitz/male.txt", comment.char = "#", 
                       header = FALSE, col.names = "name", stringsAsFactors = F)
female_names <- read.csv("kantrowitz/female.txt", comment.char = "#", 
                         header = FALSE, col.names = "name", stringsAsFactors = F)
male_names$gender <- "male"
female_names $gender <- "female"
kantrowitz <-  rbind(male_names, female_names)
ambiguous <- semi_join(male_names, female_names, by = "name") 
kantrowitz$gender[kantrowitz$name %in% ambiguous$name] <- "either"
kantrowitz <- unique(kantrowitz)
row.names(kantrowitz) <- NULL 
kantrowitz$name <- tolower(kantrowitz$name)
rm(ambiguous, female_names, male_names)
kantrowitz <- tbl_df(kantrowitz)
save(kantrowitz, file = "kantrowitz.rda", compress = TRUE)
write.csv(kantrowitz, file = "kantrowitz.csv", row.names = F)
