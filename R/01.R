count_increases <- function(x)  {
  sum(sign(diff(x) > 0), na.rm = T)
}

advent_of_code_day_01_part_1 <- function(input = as.integer(vroom::vroom_lines(here::here("input/01.txt")))) {
  count_increases(input)
}

advent_of_code_day_01_part_2 <- function(input = as.integer(vroom::vroom_lines(here::here("input/01.txt")))) {
  windowed_sums <- filter(input, c(1,1,1), sides = 1)
  count_increases(windowed_sums)
}
