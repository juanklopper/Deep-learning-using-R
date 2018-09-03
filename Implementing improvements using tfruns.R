# The model

init_W = initializer_lecun_normal(seed = 123)
init_B = initializer_zeros()

baseline_model <- 
  keras_model_sequential() %>%
  layer_dense(units = 12,
              activation = "relu",
              kernel_initializer = init_W,
              input_shape = c(12)) %>%
  layer_dense(units = 12,
              activation = "relu") %>%
  layer_dense(units = 1,
              activation = "sigmoid")

baseline_model %>% compile(
  optimizer = optimizer_rmsprop(lr = 0.0005,
                                rho = 0.95),
  loss = "binary_crossentropy",
  metrics = list("accuracy")
)

baseline_history <- baseline_model %>% 
  fit(train_data_normalized,
      train_labels,
      epochs = 40,
      batch_size = 512,
      validation_data = list(test_data_normalized, test_labels),
      verbose = 2)

