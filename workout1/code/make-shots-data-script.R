##################################################
## title: Make shots data
## description: For creating and exporting tables
## input(s): Data for invididual players
## output(s): Combined table for the 5 players and summary tables
##################################################

library(dplyr)

# example: reading file with relative path
curry <- read.csv("data/stephen-curry.csv", stringsAsFactors = FALSE)
thompson <- read.csv("data/klay-thompson.csv", stringsAsFactors = FALSE)
iguodala <- read.csv("data/andre-iguodala.csv", stringsAsFactors = FALSE)
durant <- read.csv("data/kevin-durant.csv", stringsAsFactors = FALSE)
green <- read.csv("data/draymond-green.csv", stringsAsFactors = FALSE)

curry <- mutate(curry, name = "Stephen Curry")
thompson <- mutate(thompson, name = "Klay Thompson")
iguodala <- mutate(iguodala, name = "Andre Iguodala")
durant <- mutate(durant, name = "Kevin Durant")
green <- mutate(green, name = "Draymond Green")

curry$shot_made_flag[curry$shot_made_flag == 'y'] <- 'shot_yes'
curry$shot_made_flag[curry$shot_made_flag == 'n'] <- 'shot_no'

thompson$shot_made_flag[thompson$shot_made_flag == 'y'] <- 'shot_yes'
thompson$shot_made_flag[thompson$shot_made_flag == 'n'] <- 'shot_no'

iguodala$shot_made_flag[iguodala$shot_made_flag == 'y'] <- 'shot_yes'
iguodala$shot_made_flag[iguodala$shot_made_flag == 'n'] <- 'shot_no'

durant$shot_made_flag[durant$shot_made_flag == 'y'] <- 'shot_yes'
durant$shot_made_flag[durant$shot_made_flag == 'n'] <- 'shot_no'

green$shot_made_flag[green$shot_made_flag == 'y'] <- 'shot_yes'
green$shot_made_flag[green$shot_made_flag == 'n'] <- 'shot_no'

curry$minute <- curry$period * 12 - curry$minutes_remaining
thompson$minute <- thompson$period * 12 - thompson$minutes_remaining
iguodala$minute <- iguodala$period * 12 - iguodala$minutes_remaining
durant$minute <- durant$period * 12 - durant$minutes_remaining
green$minute <- green$period * 12 - green$minutes_remaining

sink(file = 'output/stephen-curry-summary.txt')
summary(curry)
sink()

sink(file = 'output/klay-thompson-summary.txt')
summary(thompson)
sink()

sink(file = 'output/andre-iguodala-summary.txt')
summary(iguodala)
sink()

sink(file = 'output/kevin-durant-summary.txt')
summary(durant)
sink()

sink(file = 'output/draymond-green-summary.txt')
summary(green)
sink()

data <- rbind(curry, thompson, iguodala, durant, green)

write.csv(
  x = data, # R object to be exported
  file = 'data/shots-data.csv'  # file path
)

sink(file = 'output/shots-data-summary.txt')
summary(data)
sink()
