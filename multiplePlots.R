# Load necessary libraries
library(ggplot2)
library(dplyr)

# Set working directory and load the dataset
setwd("C:\\Users\\zirad\\Downloads")
movies <- read.csv("new_movie_dataset.csv")

# Group data by year and genre to count the number of movies
movies_by_year_genre <- movies %>%
  group_by(year, genre) %>%
  summarise(movie_count = n(), .groups = "drop")

# Create a faceted plot
ggplot(movies_by_year_genre, aes(x = year, y = movie_count)) +
  geom_bar(stat = "identity", fill = "skyblue", color = "black", width = 0.8) +
  labs(title = "Number of Movies Released by Year and Genre",
       x = "Year",
       y = "Number of Movies") +
  theme_minimal(base_size = 14) +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, size = 8),
    strip.text = element_text(size = 12, face = "bold"),
    plot.title = element_text(size = 16, face = "bold"),
    axis.title = element_text(size = 12, face = "bold")
  ) +
  facet_wrap(~genre, scales = "free_y") 

