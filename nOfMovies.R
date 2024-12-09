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

# Improved plot: Number of movies released by year and genre
ggplot(movies_by_year_genre, aes(x = year, y = movie_count, fill = genre)) +
  geom_bar(stat = "identity", position = "stack", width = 0.8) +  # Stacked bar chart
  labs(title = "Number of Movies Released by Year and Genre",
       x = "Year",
       y = "Number of Movies",
       fill = "Genre") +
  theme_minimal(base_size = 14) +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, size = 12),
    axis.text.y = element_text(size = 12),
    axis.title = element_text(size = 14, face = "bold"),
    legend.text = element_text(size = 12),
    legend.title = element_text(size = 14, face = "bold")
  ) +
  scale_fill_manual(values = rainbow(length(unique(movies_by_year_genre$genre)))) +  
  guides(fill = guide_legend(ncol = 2))  
