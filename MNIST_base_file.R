# Set working directory
setwd("C:\\Users\\juank\\OneDrive\\R\\Deep learning")

# Import keras and plotly
library(keras)
suppressMessages(library(plotly))


# THE DATA

# Importing the built-in MNIST dataset
c(c(x_train, y_train), c(x_test, y_test)) %<-% dataset_mnist()

# The shape of X-train shows 60000 images of 28 by 28 pixels
dim(x_train)

# Reshape the square image pixel values to vectors
x_train <- array_reshape(x_train, c(nrow(x_train), 784))
x_test <- array_reshape(x_test, c(nrow(x_test), 784))

# The dimension of the tarining dataset after reshaping
dim(x_train)

# Normalize the pixel values by dividing by the maximum value
x_train <- x_train / 255
x_test <- x_test / 255

# Showing the first training target class
y_train[1]

# One-hot-encoding of target variabes indicating the 10 classes
y_train <- to_categorical(y_train, 10)
y_test <- to_categorical(y_test, 10)

# Showing the first training sample
y_train[1, ]

## USING tfruns

library(tfruns)
tfruns::training_run("MNIST_model_1.R")

training_run("MNIST_model_2.R")

compare_runs()

training_run("MNIST_model_3.R")

compare_runs()
