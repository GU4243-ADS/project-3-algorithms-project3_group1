# A simplification of memory_based_model.R

# Path of functions.R
setwd("~/STAT4243/project-3-algorithms-project3_group1/lib")
source("functions.R")

### Builds UI Matrix for MS dataset

# Path of MS dataset
setwd("~/STAT4243/project-3-algorithms-project3_group1/data/MS_sample")

# Load the data
MS_train <- read.csv("data_train.csv", as.is = TRUE, header = TRUE)
MS_train <- MS_train[, 2:4]

# Transform from narrow to wide, i.e. user-item matrix 
# using MS_data_transform function

# Below takes 2.17 minutes
MS_UI <- MS_data_transform(MS_train)
save(MS_UI, file = "MS_UI.RData")

### Build the UI Matrix for Movie Dataset

# Path of Movie Dataset
setwd("~/STAT4243/project-3-algorithms-project3_group1/data/eachmovie_sample")

# Load the data
movie_train <- read.csv("data_train.csv", as.is = TRUE, header = TRUE)
movie_train <- movie_train[, 2:4]

# Compute the full matrix
# Below takes about 4 minutes

movie_UI <- movie_data_transform(movie_train)
save(movie_UI, file = "movie_UI.RData")

# Calculate the full weights on the movie data
# The below took 87 minutes on my Macbook, 35 on my iMac

movie_sim <- calc_weight(movie_UI)
save(movie_sim, file= "movie_sim.RData")


# Calculate the full weights on the MS data
# The below took 30 minutes on my Macbook and 14 on my iMac

MS_sim <- calc_weight(MS_UI)
save(MS_sim, file = "MS_sim.RData")

# Calculate predictions for MS
# This calculation took me 15 minutes

MS_pred <- pred_matrix(MS_UI, MS_sim)
save(MS_pred, file = "MS_pred.RData")

# Calculate predictions for movies
# This calculation took me 2493 second

movie_pred <- pred_matrix(movie_UI, movie_sim)
save(movie_pred, file = "movie_pred.RData")