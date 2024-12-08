# Load necessary libraries
library(dplyr)
library(ggcorrplot)

# Set working directory and load the dataset
setwd("C:\\Users\\zirad\\Downloads")
movies <- read.csv("new_movie_dataset.csv")

# Select only the relevant numerical columns
selected_columns <- movies %>% select(runtime, gross, budget, votes, score)

# 1. Correlation matrix for all data (including budget = 0)
correlation_matrix_all <- cor(selected_columns, use = "complete.obs")

# 2. Correlation matrix excluding rows where budget = 0
movies_filtered <- filter(movies, budget > 0)
selected_columns_filtered <- movies_filtered %>% select(runtime, gross, budget, votes, score)
correlation_matrix_filtered <- cor(selected_columns_filtered, use = "complete.obs")

# Plot correlation matrix for all data
ggcorrplot(correlation_matrix_all, 
           lab = TRUE, 
           title = "Correlation Matrix (Including Budget = 0)",
           colors = c("blue", "white", "red")) +
  theme_minimal()

# Plot correlation matrix excluding rows with budget = 0
ggcorrplot(correlation_matrix_filtered, 
           lab = TRUE, 
           title = "Correlation Matrix (Excluding Budget = 0)",
           colors = c("blue", "white", "red")) +
  theme_minimal()
