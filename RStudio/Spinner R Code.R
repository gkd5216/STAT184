the_spinner_game <- function(A, B) {
  player_A_wins <- 0
  player_B_wins <- 0
  sectors <- c(rep("A", A), rep("B", B)) #repeat sets
  while (player_A_wins < 5 && player_B_wins < 5) {
    outcome <- sample(sectors, 1)
    if (outcome == 'A') {
      player_A_wins <- player_A_wins + 1
    } else {
      player_B_wins <- player_B_wins + 1
    }
  }
  if (player_A_wins == 5) {
    return("Player A wins the game")
  } else {
    return("Player B wins the game")
  }
}

Maxine <- 6
Jacy <- 4
simResults <- replicate(
  n = 100000,
  expr = the_spinner_game(Maxine, Jacy)
)
counts <- table(simResults)
counts[1]/sum(counts)

