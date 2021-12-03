read_day_02_input <- function() {
  read.delim("input/02.txt",
             header = FALSE, sep = " ",
             col.names = c("move", "amount"),
             colClasses = c("character", "integer"))
}

advent_of_code_day_02_part_1 <- function() {
  with(read_day_02_input(),
       {
         horizontal <- cumsum((move == "forward") * amount)
         depth <- cumsum((move == "down") * amount - (move == "up") * amount)
         tail(depth, 1) * tail(horizontal, 1)
       }
  )
}

advent_of_code_day_02_part_2 <-function() {
  with(read_day_02_input(),
       {
         horizontal <- cumsum((move == "forward") * amount)
         aim <- (move == "down") * amount - (move == "up") * amount
         depth <- cumsum(cumsum(aim) * (move == "forward") * amount)
         tail(depth, 1) * tail(horizontal, 1)
       }
  )
}
