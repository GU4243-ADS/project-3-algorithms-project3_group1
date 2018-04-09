######################################################
### Memory-based Collaborative Filtering Algorithm ###
######################################################

### Project 3
### ADS Spring 2018
### Group 1

### Set path for functions.R

setwd("~/STAT4243/project-3-algorithms-project3_group1/lib")
source("functions.R")

#### Predict MS dataset

### Build UI Matrix

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

# Calculate predictions for MS
MS_pred <- pred_matrix(MS_UI, MS_sim)
save(MS_pred, file = "MS_pred.RData")



#### Predict movie dataset

### Build UI Matrix

# Set path for Movie Dataset
setwd("~/STAT4243/project-3-algorithms-project3_group1/data/eachmovie_sample")
# Load the data
movie_train <- read.csv("data_train.csv", as.is = TRUE, header = TRUE)
movie_train <- movie_train[, 2:4]
# Transform into UI matrix using movie_data_transform function
movie_UI <- movie_data_transform(movie_train)
save(movie_UI, file = "movie_UI.RData")

### Calculate similarity matrices using each measure

# Movie data
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

# Calculate predictions for movies
movie_pred <- pred_matrix(movie_UI, movie_sim)
save(movie_pred, file = "movie_pred.RData")
