calc_weight <- function(data, method = "simRank") {
  
  # Iniate the similarity weight matrix
  data       <- as.matrix(data)
  weight_mat <- matrix(NA, nrow = nrow(data), ncol = nrow(data))
  
  weight_func <- function(rowA, rowB) {
    
    # weight_func takes as input two rows (thought of as rows of the data matrix) and 
    # calculates the similarity between the two rows according to 'method'
    
    # Only with movie data
    #    rowA[rowA < 4] <- 0
    #    rowA[rowA > 3] <- 1
    #    rowB[rowB < 4] <- 0
    #    rowB[rowB > 3] <- 1
    
    joint_values <- rowA == 1 & rowB == 1
    joint_index <- names(which(joint_values == TRUE))
    t <- length(joint_index)
    
    if (sum(joint_values, na.rm = T) == 0) {
      return(0)
    } 
    
    else {
      if (method == 'simRank') {
        
        c1 <- 0.8
        c2 <- 0.8
        outA <- sum(rowA, na.rm = T)
        outB <- sum(rowB, na.rm = T)
        
        sim1 <- seq(0.001, 1, 0.001)
        
        for (k in 1:length(sim1)) {
          
          sim_items <- t + (outA - t)*(outB - t)*(c2 * sim1[k]) + 
            ((outA * outB) - t - (outA - t)*(outB - t))*(c2 * 1/2 * (1 + sim1[k]))
          sim2 <- c1 / (outA * outB) * (sum(sim_items))
          if (abs(sim1[k] - sim2) < 0.001)  {
            similarity <- sim2
          }
        }
        return(similarity)
      }
    }
  }
  
  # Loops over the rows and calculate sall similarities using weight_func
  for(i in 1:nrow(data)) {
    weight_mat[i, ] <- apply(data, 1, weight_func, data[i, ])
    print(i)
  }
  diag(weight_mat) <- 1
  return(round(weight_mat, 4))
}
