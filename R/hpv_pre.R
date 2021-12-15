
#' @title Prediction of human papillomavirus-positive cervical cancers status
#'
#' @description
#' \code{hpv_pre} Prediction of HPV+ tumors from gene expression profiling data.
#'
#' @details
#' One or multiple tumor samples to be predicted as HPV+G1 or HPV+G2 based on their expression profiles of the gene panel.
#'
#' @param input_data Tumor samples to be predicted. (Note: Gene expression values of the samples need to be normalized (scaling to [0, 1] range) by the function \link{data_pre} first)
#' @import class
#' @export
#' @return A dataframe with 2 columns:
#' \item{Sample_ID}{Tumor samples to be predicted.}
#' \item{HPV_status}{Prediction results ("1" indicates HPV+G1, and "0" HPV+G2).}
#' @author Shengwei Li <lishengwei98@@163.com>, Xiaosheng Wang <xiaosheng.wang@@cpu.edu.cn>
#' @examples
#' path = system.file("extdata", "example.txt", package = "PreHPVcc", mustWork = TRUE)
#' input_data = data_pre(path, type = "ID")
#' hpv_pre(input_data)

hpv_pre <- function(input_data) {

  ## Predict HPV+
  if (dim(input_data)[2] != dim(training_data)[2] - 1) {
    training_data <- training_data[,c(1, match(colnames(input_data), colnames(training_data)))]
  }
  if (dim(input_data)[1] != 1) {
    training_data[-1] <- apply(training_data[-1], 2, function(x) {
      (x - min(x)) / (max(x) - min(x))
    })
  }
  set.seed(1)
  knn.pred <- knn(training_data[,-1], input_data, training_data[,1], k = 5, prob = TRUE)
  result <- data.frame(Sample = rownames(input_data),HPV_status = knn.pred, check.names = FALSE)
  return(result)

}


