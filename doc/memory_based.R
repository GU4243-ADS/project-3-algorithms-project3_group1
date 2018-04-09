######################################################
### Memory-based Collaborative Filtering Algorithm ###
######################################################

### Project 3
### ADS Spring 2018
### Group 1

### Install necessary packages
install.packages("infotheo")
install.packages("boot")
install.packages("lsa")
library(infotheo)
library(boot)
library(lsa)

### Set path for functions.R
setwd("~/STAT4243/project-3-algorithms-project3_group1/lib")
source("functions.R")

### Predict MS dataset

## Build UI Matrix

# Set path for MS dataset
setwd("~/STAT4243/project-3-algorithms-project3_group1/data/MS_sample")

# Load the data
MS_train <- read.csv("data_train.csv", as.is = TRUE, header = TRUE)
MS_train <- MS_train[, 2:4]

# Transform into UI matrix using MS_data_transform function
MS_UI <- MS_data_transform(MS_train)
save(MS_UI, file = "MS_UI.RData")

# Calculate similarity matrices using each measure
setwd("~/STAT4243/project-3-algorithms-project3_group1/output")

MS_sim_pearson <- calc_weight(MS_UI, method = "pearson")
save(MS_sim_pearson, file= "MS_sim_pearson.RData")

MS_sim_psig <- calc_weight(MS_UI, method = "psig")
save(MS_sim_psig, file= "MS_sim_psig.RData")

MS_sim_pvar <- calc_weight(MS_UI, method = "pvar")
save(MS_sim_pvar, file= "MS_sim_pvar.RData")

MS_sim_spearman <- calc_weight(MS_UI, method = "spearman")
save(MS_sim_spearman, file= "MS_sim_spearman.RData")

MS_sim_vector <- calc_weight(MS_UI, method = "vector")
save(MS_sim_vector, file= "MS_sim_vector.RData")

MS_sim_entropy <- calc_weight(MS_UI, method = "entropy")
save(MS_sim_entropy, file= "MS_sim_entropy.RData")

MS_sim_msd <- calc_weight(MS_UI, method = "msd")
save(MS_sim_msd, file= "MS_sim_msd.RData")

MS_sim_simrank <- calc_weight(MS_UI, method = "simrank")
save(MS_sim_simrank, file= "MS_sim_simrank.RData")

# Calculate predictions for MS using each measure
MS_pred_pearson <- pred_matrix(MS_UI, MS_sim_pearson)
save(MS_pred_pearson, file = "MS_pred_pearson.RData")

MS_pred_psig <- pred_matrix(MS_UI, MS_sim_psig)
save(MS_pred_psig, file = "MS_pred_psig.RData")

MS_pred_pvar <- pred_matrix(MS_UI, MS_sim_pvar)
save(MS_pred_pvar, file = "MS_pred_pvar.RData")

MS_pred_spearman <- pred_matrix(MS_UI, MS_sim_spearman)
save(MS_pred_spearman, file = "MS_pred_spearman.RData")

MS_pred_vector <- pred_matrix(MS_UI, MS_sim_vector)
save(MS_pred_vector, file = "MS_pred_vector.RData")

MS_pred_entropy <- pred_matrix(MS_UI, MS_sim_entropy)
save(MS_pred_entropy, file = "MS_pred_entropy.RData")

MS_pred_msd <- pred_matrix(MS_UI, MS_sim_msd)
save(MS_pred_pearson, file = "MS_pred_pearson.RData")

MS_pred_simrank <- pred_matrix(MS_UI, MS_sim_simrank)
save(MS_pred_simrank, file = "MS_pred_simrank.RData")

### Predict movie dataset

## Build UI Matrix

# Set path for Movie Dataset
setwd("~/STAT4243/project-3-algorithms-project3_group1/data/eachmovie_sample")

# Load the data
movie_train <- read.csv("data_train.csv", as.is = TRUE, header = TRUE)
movie_train <- movie_train[, 2:4]

# Transform into UI matrix using movie_data_transform function
movie_UI <- movie_data_transform(movie_train)
save(movie_UI, file = "movie_UI.RData")

# Calculate similarity matrices using each measure
setwd("~/STAT4243/project-3-algorithms-project3_group1/output")

movie_sim_pearson <- calc_weight(movie_UI, method = "pearson")
save(movie_sim_pearson, file= "movie_sim_pearson.RData")

movie_sim_psig <- calc_weight(movie_UI, method = "psig")
save(movie_sim_psig, file= "movie_sim_psig.RData")

movie_sim_pvar <- calc_weight(movie_UI, method = "pvar")
save(movie_sim_pvar, file= "movie_sim_pvar.RData")

movie_sim_spearman <- calc_weight(movie_UI, method = "spearman")
save(movie_sim_spearman, file= "movie_sim_spearman.RData")

movie_sim_vector <- calc_weight(movie_UI, method = "vector")
save(movie_sim_vector, file= "movie_sim_vector.RData")

movie_sim_entropy <- calc_weight(movie_UI, method = "entropy")
save(movie_sim_entropy, file= "movie_sim_entropy.RData")

movie_sim_msd <- calc_weight(movie_UI, method = "msd")
save(movie_sim_msd, file= "movie_sim_msd.RData")

movie_sim_simrank <- calc_weight(movie_UI, method = "simrank")
save(movie_sim_simrank, file= "movie_sim_simrank.RData")

# Calculate predictions for MS using each measure
movie_pred_pearson <- pred_matrix(movie_UI, movie_sim_pearson)
save(movie_pred_pearson, file = "movie_pred_pearson.RData")

movie_pred_psig <- pred_matrix(movie_UI, movie_sim_psig)
save(movie_pred_psig, file = "movie_pred_psig.RData")

movie_pred_pvar <- pred_matrix(movie_UI, movie_sim_pvar)
save(movie_pred_pvar, file = "movie_pred_pvar.RData")

movie_pred_spearman <- pred_matrix(movie_UI, movie_sim_spearman)
save(movie_pred_spearman, file = "movie_pred_spearman.RData")

movie_pred_vector <- pred_matrix(movie_UI, movie_sim_vector)
save(movie_pred_vector, file = "movie_pred_vector.RData")

movie_pred_entropy <- pred_matrix(movie_UI, movie_sim_entropy)
save(movie_pred_entropy, file = "movie_pred_entropy.RData")

movie_pred_msd <- pred_matrix(movie_UI, movie_sim_msd)
save(movie_pred_pearson, file = "movie_pred_pearson.RData")

movie_pred_simrank <- pred_matrix(movie_UI, movie_sim_simrank)
save(movie_pred_simrank, file = "movie_pred_simrank.RData")

### Evaluate prediction matrix

## MS test data

setwd("~/STAT4243/project-3-algorithms-project3_group1/data/MS_sample")
MS_test <- read.csv('data_test.csv', as.is = TRUE, header = TRUE)
MS_test_UI <- MS_data_transform(MS_test)
MS_score <- test_MS_predictions(MS_pred_pearson, MS_test_UI)
sprintf('MS data achieves score of %.2f', MS_score)

## Movie test data

setwd("~/STAT4243/project-3-algorithms-project3_group1/data/eachmovie_sample")
movie_test <- read.csv('data_test.csv', as.is = TRUE, header = TRUE)[,2:4]
movie_test_UI <- movie_data_transform(movie_test)

movie_MAE <- test_movie_predictions(movie_pred_pearson, movie_test_UI)
sprintf('movie data achieves MAE of %.2f', movie_MAE)
