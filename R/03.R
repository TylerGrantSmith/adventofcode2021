advent_of_code_day_03_part_1 <- function() {
  input <- readLines("input/03.txt")
  num_input <- length(input)
  num_digits <- nchar(input[1])
  input_mat <- do.call(rbind, lapply(strsplit(input, ""), as.integer))
  number_of_ones <- apply(input_mat, 2, sum)
  one_majority <- number_of_ones >= (num_input / 2)
  twos <- 2^((num_digits-1):0)
  gamma_rate <- sum(twos[one_majority])
  epsilon_rate <- sum(twos[!one_majority])
  gamma_rate * epsilon_rate
}

get_rating <- function(m, col = 1L, rating = c("oxygen", "co2")) {
  rating <- match.arg(rating)
  if (!is.matrix(m)) return(m > 0)
  num_val <- nrow(m)
  selected <- sum(m[,col]) >= num_val / 2
  if (rating == "co2") selected <- !selected
  m <- m[m[,col]==selected,]
  Recall(m, col = col + 1L, rating = rating)
}

advent_of_code_day_03_part_2 <- function() {
  input <- readLines("input/03.txt")
  num_input <- length(input)
  num_digits <- nchar(input[1])
  input_mat <- do.call(rbind, lapply(strsplit(input, ""), as.integer))

  twos <- 2^((num_digits-1):0)
  oxygen_generator_rating <- sum(twos[get_rating(input_mat, rating = "oxygen")])
  co2_scrubber_rating <- sum(twos[get_rating(input_mat, rating = "co2")])
  oxygen_generator_rating * co2_scrubber_rating
}
