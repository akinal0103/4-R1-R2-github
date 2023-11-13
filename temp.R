xfun::pkg_load2(c("nycflights13", "tidyverse", "data.table", "dplyr"))

flights1 <- nycflights13::flights
planes <- nycflights13::planes

joined1 <- dplyr::inner_join(
  x = flights1, y = planes,
  by = "tailnum"
)

accident <- read.csv('data/CRSS/ACCIDENT.csv')
person <- read.csv('data/CRSS/PERSON.csv')
vehicle <- read.csv('data/CRSS/VEHICLE.csv')

acc_per_in <-
  dplyr::inner_join(
    x = accident,
    y = person,
    by = c("CASENUM", "PSU")
  )

acc_veh_left <- dplyr::left_join(
  x = accident,
  y = vehicle,
  by = c("CASENUM", "PSU")
) |>
  dplyr::distinct()

acc_veh_right <- dplyr::right_join(
  x = accident,
  y = vehicle,
  by = c("CASENUM", "PSU")
)

