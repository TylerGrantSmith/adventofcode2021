download_inputs <- function(day) {
  url <- glue::glue("https://adventofcode.com/2021/day/{day}/input")
  output <- here::here(glue::glue("inst/input/{day}.txt"))
  lines <- vroom::vroom(url)

  lines
  # vroom::vroom_write_lines(lines, output)
}
