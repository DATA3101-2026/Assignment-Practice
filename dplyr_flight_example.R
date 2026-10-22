# ------adding in packages from library

library(nycflights13) # installing packages here
library(dplyr)
library(tidyverse) # load in flight from NYC in 2013

# ------looking my data for the first time-----
flights #prints out the tibble into the console to see the overview

jan1<-flights|> # Using a pipe operator to create a tibble dataframe of all flight on january 1, 2013
  filter(month == 1 & day ==1)

#---- Create summaries of the output, grouped by year, month, and day. The average arrival delay was calculated for each date,
flights |> filter(dest == "IAH") |> group_by("year,monty,day") |> summarize(arr_delay = mean(arr_delay, na.rm = TRUE)) 

#-----different flight exercises done in class
flights |> filter("dep_delay" > 120)

flights |>
  arrange(year, month, day, dep_time)

flights |>
  arrange(desc(dep_delay))

flights |>
  distinct("origin", "dest")

flights |>
  count(origin, dest, sort = TRUE)

#Exercise question 1 Sort flights to find the flights with the longest departure delays. Find the flights that left earliest in the morning.
# Find the flights with the longest departure delays (in descending order)
longest_dep_delay <- flights %>%
  arrange(desc(dep_delay))

print("delay time 1301", "N384HA")

earliest_morning_flights <- flights %>% 
  filter(dep_time >= 500) %>%  
  arrange(dep_time)

print("N178US","N563UW","N176UW")

#Exercise question 2 Sort flights to find the fastest flights.
(fastest_flights <- flights %>% 
    mutate(speed_mph = (distance / air_time) * 60) %>% 
    arrange(desc(speed_mph)))
print("fast speed 703.3846mph", "flights N666DN")

#mutate try 1
flights |>
  mutate(gain = dep_delay - arr_delay, na.rm = TRUE)

showflightsinenv <- flights
sf <- shadowflightsinenv

#mutate attempt 2
flights_gain <- flights|>
  mutate(
    gain = dep_delay - arr_delay, na.rm = TRUE
  )

flights |>
  select(where(is,character),
         tail_num = tailnum
  )

flight_delay_gain <- flights |>
  mutate(gain = dep_delay - arr_faindelay,
         speed = distance / (air_time / 60),
         gph = gain/ (air_time/60))#, .keep = "used")

flights_avg_delay <- flights |>
  group_by(dest) |>
  summarize(avg_delay = mean(dep_delay, na,rm = TRUE))