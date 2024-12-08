# Load necessary libraries
library(ggplot2)
library(dplyr)

# Set working directory and load the dataset
setwd("C:\\Users\\zirad\\Downloads")
movies <- read.csv("new_movie_dataset.csv")

# Get a unique color for each genre
unique_genres <- unique(movies$genre)
genre_colors <- setNames(rainbow(length(unique_genres)), unique_genres)

# Plot 1: Average gross revenue by genre (including all movies)
avg_gross_all <- movies %>%
  group_by(genre) %>%
  summarise(avg_gross = mean(gross, na.rm = TRUE))  # Include all rows, even with budget = 0

plot1 <- ggplot(avg_gross_all, aes(x = reorder(genre, -avg_gross), y = avg_gross, fill = genre)) +
  geom_bar(stat = "identity", show.legend = FALSE) +
  labs(title = "Average Gross Revenue by Genre (All Movies)",
       x = "Genre",
       y = "Average Gross Revenue (USD)") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_fill_manual(values = genre_colors)  # Use explicit genre colors

print(plot1)

# Plot 2: Average gross revenue by genre (excluding budget = 0 or NA)
avg_gross_filtered <- movies %>%
  filter(budget > 0 & !is.na(budget)) %>%  # Exclude rows with budget = 0 or NA
  group_by(genre) %>%
  summarise(avg_gross = mean(gross, na.rm = TRUE))

plot2 <- ggplot(avg_gross_filtered, aes(x = reorder(genre, -avg_gross), y = avg_gross, fill = genre)) +
  geom_bar(stat = "identity", show.legend = FALSE) +
  labs(title = "Average Gross Revenue by Genre (Budget > 0)",
       x = "Genre",
       y = "Average Gross Revenue (USD)") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_fill_manual(values = genre_colors)  # Use explicit genre colors

print(plot2)
