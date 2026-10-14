library(tidyverse) # it loads an installed package
#into our R session so we can use the functions and datasets
library(billboard) # this loads a separate package billboard
#of spotify music datasets
library(dplyr)
library(tidyr)

billboard # it prints the billboard dataset
#in the console tab

billboard <- billboard # it shows in the environment pane

bb_long <- billboard |> pivot_longer(
  cols = starts_with("wk"),  # pick the columns we need to stack to every column
  names_to = "week",       # the old column name goes to the new column called "week" 
  names_prefix = "wk",      # remove the wk prefix so the wk1 becomes 1 
  names_transform = as.integer,   # convert the wk values from text to integers
  values_to = "rank",    # the values that were in the previous cell go to a new one called rank         
  values_drop_na = TRUE,   # it drops the values where the rank is NA     
) 

# the pipe passes billboard to pivot longer as its first argument
#the pivot_longer reshapes it from wide to long and instead of one 
#row per song with 76 weeks columns we get one row per song per week. 

ggplot(data = bb_long,
       mapping = aes(x = week, y = rank, colour = artist)) + geom_point()
# the legend grows bigger because there are atleast 228 different artists which 
# squeezes our actual plot and the colors are actually impossible to tell 
#apart because there are so many overlapping points that we cannot follow every single
#song

example_songs <- bb_long |>
  filter(track %in% c("Bye Bye Bye", "Kryptonite", "With Arms Wide Open"))
#it demonstrates filtering our long data and the %in% keeps 
#every row whose track would match any of the three song names.
