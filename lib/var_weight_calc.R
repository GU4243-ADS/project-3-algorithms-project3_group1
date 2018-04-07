calc_weight <- function(data, method = "pearson") {
  
  install.packages("boot")
  library(boot)
  
  ## Calculate similarity weight matrix
  ##
  ## input: data   - movie data or MS data in user-item matrix form
  ##        method - 'pearson'
  ##
  ## output: similarity weight matrix
  
  # Iniate the similarity weight matrix
  data       <- as.matrix(data)
  weight_mat <- matrix(NA, nrow = nrow(data), ncol = nrow(data))
  
  weight_func <- function(rowA, rowB) {
    
    # weight_func takes as input two rows (thought of as rows of the data matrix) and 
    # calculates the similarity between the two rows according to 'method'
    
    joint_values <- !is.na(rowA) & !is.na(rowB)
    if (sum(joint_values) == 0) {
      return(0)
    } 
    else {
      if (method == 'pearson') {
        
        variances <- apply(data[, joint_values], 2, var, na.rm = TRUE)
        var.min <- min(variances)
        var.max <- max(variances)
        var.weight <- (variances - var.min) / var.max
        return(corr(cbind(rowA[joint_values], rowB[joint_values]), w = var.weight))
        
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