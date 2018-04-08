# Path of functions.R
setwd("~/STAT4243/project-3-algorithms-project3_group1/lib")
source("functions.R")

# Tests MS dataset
setwd("~/STAT4243/project-3-algorithms-project3_group1/data/MS_sample")

# Loads MS_pred
load('MS_pred.RData')
MS_test <- read.csv('data_test.csv', as.is = TRUE, header = TRUE)
MS_test_UI <- MS_data_transform(MS_test)
MS_score <- test_MS_predictions(MS_pred, MS_test_UI)
sprintf('MS data achieves score of %.2f', MS_score)

# Tests movie dataset
setwd("~/STAT4243/project-3-algorithms-project3_group1/data/eachmovie_sample")
# Loads movie_pred
load('movie_pred.RData')
movie_test <- read.csv('data_test.csv', as.is = TRUE, header = TRUE)[,2:4]
movie_test_UI <- movie_data_transform(movie_test)

movie_MAE <- test_movie_predictions(movie_pred, movie_test_UI)
sprintf('movie data achieves MAE of %.2f', movie_MAE)
