## Goal: Write a function that computes the height of the ball (from initial point) after t time
## Input: time, initial velocity and initial height
## output: height


Compute_ht <- function(t, init_vel, init_ht){
  
  G = -980.665
  ht_after_t <- (1/2)*G*t^2 + init_vel*t + init_ht
  return(ht_after_t)
  
}

#########################################
grav <- 980.665
intVel <-350
intHeight <- 71

getHeight <- function(time){
  
  height <- 0.5*grav*time^2 +intVel*time + intHeight
  return(height)
  
}