calc_weight <- function(data, method = "simRank") {
  
  # Iniate the similarity weight matrix
  data       <- as.matrix(data)
  weight_mat <- matrix(NA, nrow = nrow(data), ncol = nrow(data))
  
  weight_func <- function(rowA, rowB) {
    
    # weight_func takes as input two rows (thought of as rows of the data matrix) and 
    # calculates the similarity between the two rows according to 'method'
    
    # Only with movie data
    rowA[rowA < 4] <- 0
    rowA[rowA > 3] <- 1
    rowB[rowB < 4] <- 0
    rowB[rowB > 3] <- 1
    
    joint_values <- rowA == 1 & rowB == 1
    joint_index <- names(which(joint_values == TRUE))
    
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
        
          sim_items <- matrix(NA, nrow = outA, ncol = outB)
          rownames(sim_items) <- names(which(rowA == 1))
          colnames(sim_items) <- names(which(rowB == 1))
        
          for (i in rownames(sim_items))  {
            for (j in colnames(sim_items))  {
              if (i == j) {
                sim_items[i, j] <- 1
              }
              else  {
                if (!(i %in% joint_index) & !(j %in% joint_index))  {
                  sim_items[i, j] <- c2 * sim1[k]
                }
                else  {
                  sim_items[i, j] <- c2 / 2 * (1 + sim1[k])
                }
              }
            }
          }
        
          sim2 <- c1 / (outA * outB) * (sum(sim_items))
          if (abs(sim1[k] - sim2) < 0.001)  {
            similarity <- sim1[k]
            break
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
  return(round(weight_mat, 4))
}
