##################################################
## title: Make shot charts
## description: 
## input(s): 
## output(s): 
##################################################

library(jpeg)
library(grid)
library(ggplot2)


data <- read.csv("data/shots-data.csv", stringsAsFactors = FALSE)

curry <- data[data$name == "Stephen Curry",]
#thompson <- data[data$name == "Klay Thompson",]
#iguodala <- data[data$name == "Andre Iguodala",]
#durant <- data[data$name == "Kevin Durant",]
#green <- data[data$name == "Draymond Green",]

# court image (to be used as background of plot)
court_file <- "images/nba-court.jpg"

# create raste object
court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc"))

curry_shot_chart <- ggplot(data = curry) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry (2016 season)') +
  theme_minimal()

thompson_shot_chart <- ggplot(data = thompson) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') +
  theme_minimal()

iguodala_shot_chart <- ggplot(data = iguodala) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') +
  theme_minimal()

durant_shot_chart <- ggplot(data = durant) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant (2016 season)') +
  theme_minimal()

green_shot_chart <- ggplot(data = green) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Green (2016 season)') +
  theme_minimal()

# Writing to PDF
pdf(file = "images/stephen-curry-shot-chart.pdf",
    width = 6.5, height = 5)
curry_shot_chart
dev.off()

pdf(file = "images/klay-thompson-shot-chart.pdf",
    width = 6.5, height = 5)
thompson_shot_chart
dev.off()

pdf(file = "images/andre-iguodala-shot-chart.pdf",
    width = 6.5, height = 5)
iguodala_shot_chart
dev.off()

pdf(file = "images/kevin-durant-shot-chart.pdf",
    width = 6.5, height = 5)
durant_shot_chart
dev.off()

pdf(file = "images/draymond-green-shot-chart.pdf",
    width = 6.5, height = 5)
green_shot_chart
dev.off()

sp <- ggplot(data = data) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Charts: GSW (2016 season)') +
  theme_minimal()

combined <- sp + facet_wrap( ~ name, nrow = 2)

pdf(file = "images/gsw-shot-charts.pdf",
    width = 8, height = 7)
combined
dev.off()

png(filename =  "images/gsw-shot-charts.png", res = 200,
    width = 8, height = 7, units = "in")
combined
dev.off()

