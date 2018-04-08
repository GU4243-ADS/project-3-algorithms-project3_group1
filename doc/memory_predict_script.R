######################################################
### Memory-based Collaborative Filtering Algorithm ###
######################################################

### Project 3
### ADS Spring 2018
### Group 1

### Set path for functions.R

setwd("~/STAT4243/project-3-algorithms-project3_group1/lib")
source("functions.R")

### Build UI Matrix for MS dataset

# Set path for MS dataset
setwd("~/STAT4243/project-3-algorithms-project3_group1/data/MS_sample")

# Load the data
MS_train <- read.csv("data_train.csv", as.is = TRUE, header = TRUE)
MS_train <- MS_train[, 2:4]

# Transform into UI matrix using MS_data_transform function
MS_UI <- MS_data_transform(MS_train)
save(MS_UI, file = "MS_UI.RData")

### Build UI Matrix for Movie Dataset

# Set path for Movie Dataset
setwd("~/STAT4243/project-3-algorithms-project3_group1/data/eachmovie_sample")

# Load the data
movie_train <- read.csv("data_train.csv", as.is = TRUE, header = TRUE)
movie_train <- movie_train[, 2:4]

# Transform into UI matrix using movie_data_transform function
movie_UI <- movie_data_transform(movie_train)
save(movie_UI, file = "movie_UI.RData")

### Calculate the full weights on each data

# Movie data
movie_sim_pearson <- calc_weight(movie_UI, method = "pearson")
save(movie_sim_pearson, file= "movie_sim_pearson.RData")

movie_sim_psig <- calc_weight(movie_UI, method = "psig")
save(movie_sim_psig, file= "movie_sim_psig.RData")

movie_sim_pvar <- calc_weight(movie_UI, method = "pvar")
save(movie_sim_pvar, file= "movie_sim_pvar.RData")

movie_sim_spearman <- calc_weight(movie_UI, method = "spearman")
save(movie_sim_spearman, file= "movie_sim_spearman.RData")

movie_sim_simrink <- calc_weight(movie_UI, method = "simrink")
save(movie_sim_simrink, file= "movie_sim_simrink.RData")


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
