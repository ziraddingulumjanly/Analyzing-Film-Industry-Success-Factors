# Load necessary libraries
library(ggplot2)
library(dplyr)

# Set working directory and load the dataset
setwd("C:\\Users\\zirad\\Downloads")
movies <- read.csv("new_movie_dataset.csv")

# Verify the dataset structure
str(movies)

# Create a boxplot for runtime by genre with filled colors and improved aesthetics
ggplot(movies, aes(x = genre, y = runtime, fill = genre)) +
  geom_boxplot(outlier.shape = NA, color = "black") +  # Exclude outliers and use black borders for clarity
  labs(title = "Distribution of Runtime by Genre",
       x = "Genre",
       y = "Runtime (minutes)",
       fill = "Genre") +  # Add legend title
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_fill_manual(values = rainbow(length(unique(movies$genre))))  # Assign a unique color to each genre

