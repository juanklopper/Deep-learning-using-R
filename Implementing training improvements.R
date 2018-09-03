setwd("C:\\Users\\juank\\OneDrive\\R\\Deep learning")

suppressWarnings(library(keras))
suppressMessages(library(readr))

train.import <- read_csv("ImprovementsTrain.csv")
test.import <- read_csv("ImprovementsTest.csv")

# Cast dataframe as a matrix and remove column names
train.import <- as.matrix(train.import)
dimnames(train.import) = NULL
test.import <- as.matrix(test.import)
dimnames(test.import) = NULL

# Create train and test sets
train_data <- train.import[, 1:12]
train_labels <- train.import[, 13]
test_data <- test.import[, 1:12]
test_labels <- test.import[, 13]

# Calculating the means of each of the training set feature variables
feature.means = vector(length = ncol(train_data))
for (i in 1:length(feature.means)){
  feature.means[i] = mean(train_data[, i])
}

# Calculating the standard deviations of each of the training set feature variables
feature.sds = vector(length = ncol(train_data))
for (i in 1:length(feature.sds)){
  feature.sds[i] = sd(train_data[, i])
}

# Normalizing the feature variables in the training set
train_data_normalized <- matrix(nrow = nrow(train_data),
                                ncol = ncol(train_data))
for (n in 1:ncol(train_data)){
  for (m in 1:nrow(train_data)){
    train_data_normalized[m, n] = (train_data[m, n] - feature.means[n]) / feature.sds[n]
  }
}

# Normalizing the feature variables in the test set
test_data_normalized <- matrix(nrow = nrow(test_data), ncol = ncol(test_data))
for (n in 1:ncol(test_data)){
  for (m in 1:nrow(test_data)){
    test_data_normalized[m, n] = (test_data[m, n] - feature.means[n]) / feature.sds[n]
  }
}

suppressMessages(library(tfruns))

tfruns::training_run(file = "Implementing improvements using tfruns.R")

latest_run()

training_run(file = "Implementing improvements using tfruns.R")

compare_runs()

training_run(file = "Implementing improvements using tfruns.R")

compare_runs()
