box_volume <- function(cutout_size, length = 11, width = 8.5) {
  maximum_volume <- 0
  box_cutout_size <- 0
  precision_step_size <- 0.01
  lower_bound <-1
  upper_bound <- min(length / 2, width / 2) * 100
  
  for (cutout_size in seq(lower_bound, upper_bound, by = precision_step_size * 100)) {
    cutout_size <- cutout_size / 100
    boxlength <- length - 2 * cutout_size
    boxwidth <- width - 2 * cutout_size
    height <- cutout_size
    
    if (boxlength > 0 && boxwidth > 0) {
      volume_of_box <- boxlength * boxwidth * height
      if (volume_of_box > maximum_volume) {
        maximum_volume <- volume_of_box
        best_cutout_size <- cutout_size
      }
    }
    
  }
}

test_box_volume <- function(cutout_size, length = 11, width = 8.5) {
  boxlength <- length - 2 * cutout_size
  boxwidth <- width - 2 * cutout_size
  height <- cutout_size
  
  if (boxlength > 0 && boxwidth > 0) {
    volume_of_box <- boxlength * boxwidth * height
    return(volume_of_box)
  } else {
    return("Invalid cutout size.")
  }
}

cutout_size_test <- 2.11
volume <- test_box_volume(cutout_size_test)
cat(sprintf("The volume of the box with a cutout size of %.2f inches is: %.2f cubic inches\n", 
            cutout_size_test, volume))

plot_volume <- function(cutout_size, length = 11, width = 8.5) {
  boxlength <- length - 2 * cutout_size
  boxwidth <- width - 2 * cutout_size
  height <- cutout_size
  
  if (boxlength > 0 && boxwidth > 0) {
    volume_of_box <- boxlength * boxwidth * height
    return(volume_of_box)
  } else {
    return(NA)
  }
}

cutout_size_test <- seq(0.01, min(11/2, 8.5/2), by = 0.01)
volume <- sapply(cutout_size_test, plot_volume)

plot(cutout_size_test, volume, type = "l", xlab = "Cutout Size", ylab = "Volume", lwd = 2, col = "red",
     main = "Box Volume vs Cutout Size")

max_volume <- max(volume, na.rm = TRUE)
cat(sprintf("The maximum volume is: %.2f cubic inches\n", max_volume))

side_length <- cutout_size_test[which.max(volume)]
cat(sprintf("The side length of the square that results in this volume is: %.2f inches\n", side_length))
