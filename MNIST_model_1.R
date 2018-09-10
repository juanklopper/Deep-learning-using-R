model <- keras_model_sequential()
model %>% 
  layer_dense(units = 256, activation = "relu", input_shape = c(784)) %>% 
  layer_dense(units = 128, activation = "relu") %>%
  layer_dense(units = 10, activation = "softmax")
model %>% compile(loss = "categorical_crossentropy",
                  optimizer = "rmsprop",
                  metrics = c("accuracy"))
history <- model %>% fit(x_train,
                         y_train,
                         batch_size = 256,
                         epochs = 50,
                         callbacks = list(callback_early_stopping(monitor = "loss",
                                                                  patience = 2)),
                         verbose = 2,
                         validation_data = list(x_test,
                                                y_test))