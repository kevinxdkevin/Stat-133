# ===================================================================
# Title: Lab 5: More Bash and Intro to Git
# Description:
#   This script contains codes that compute descriptive statistics and produce visual analysis
#   of our file 'nba2018-players.csv'. 
# Input(s): data file 'nba2018-players.csv'
# Output(s): Descriptive statistics, visual analysis (graphs, tables)
# Author: Kevin Ma
# Date: 10-02-2019
# ===================================================================


library(dplyr)
library(ggplot2)


## Exporting Some Data Tables
dat <- read.csv("~/Desktop/gitdemo/data/nba2018-players.csv", sep = ",", header =TRUE)
warriors <- arrange(filter(dat, team == "GSW"), salary)
write.csv(warriors, "~/Desktop/gitdemo/data/warriors.csv", row.names=FALSE)

## Exporting Some R Output
sink(file = "~/Desktop/gitdemo/output/data-structure.txt")
str(dat)
sink()
sink(file = "~/Desktop/gitdemo/output/summary-warriors.txt")
summary(warriors)
sink()
sink(file = "~/Desktop/gitdemo/output/summary-lakers.txt")
summary(arrange(filter(dat, team == "LAL"), salary))
sink()

## Exporting Graphs
jpeg(filename = "~/Desktop/gitdemo/images/histogram-age.jpeg", width = 600, height = 400)
hist(dat$age, xlab = "Age", main = "Histogram of all NBA Players' Ages")
dev.off()
png(filename = "~/Desktop/gitdemo/images/scatterplot2-height-weight.png", pointsize = 20)
plot(dat$height, dat$weight, pch = 20, 
     xlab = 'Height', ylab = 'Weight')
dev.off()
height_weight_by_position <- ggplot(data = dat) + geom_point(aes(x=height, y=weight)) +
      facet_grid(.~position)
ggsave(filename = "~/Desktop/gitdemo/images/height_weight_by_position.pdf", 
       plot = height_weight_by_position)

                      