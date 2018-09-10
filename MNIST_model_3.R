model <- keras_model_sequential()
model %>% 
  layer_dense(units = 128, activation = "relu", input_shape = c(784)) %>% 
  layer_dropout(0.2) %>% 
  layer_dense(units = 128, activation = "relu") %>%
  layer_dropout(0.2) %>% 
  layer_dense(units = 10, activation = "softmax")
model %>% compile(loss = "categorical_crossentropy",
                  optimizer = optimizer_adam(lr = 0.003,
                                             beta_1 = 0.92,
                                             beta_2 = 0.95) ,
                  metrics = c("accuracy"))
history <- model %>% fit(x_train,
                         y_train,
                         batch_size = 512,
                         epochs = 50,
                         callbacks = list(callback_early_stopping(monitor = "loss",
                                                                  patience = 3)),
                         verbose = 2,
                         validation_data = list(x_test,
                                                y_test))