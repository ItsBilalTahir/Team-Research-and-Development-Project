


# 2. Load dataset
data <- read.csv("FastFoodNutritionMenuV2.csv", header = TRUE, stringsAsFactors = FALSE)

# VISUALIZATIONS FOR FastFoodNutritionMenuV2


# 1. Load required libraries
install.packages("ggplot2")   # for plotting
install.packages("dplyr")     # for data manipulation
install.packages("corrplot")  # for correlation heatmap

library(ggplot2)
library(dplyr)
library(corrplot)

# Columns to convert
numeric_cols <- c(
  "Calories", "Calories.from.Fat", "Total.Fat..g.", "Saturated.Fat..g.",
  "Trans.Fat..g.", "Cholesterol..mg.", "Sodium...mg.", "Carbs..g.",
  "Fiber..g.", "Sugars..g.", "Protein..g.", "Weight.Watchers.Pnts"
)

# Remove any non-numeric characters and convert to numeric
data[numeric_cols] <- lapply(data[numeric_cols], function(x) {
  as.numeric(gsub("[^0-9\\.]", "", x))
})
str(data)
summary(data$Calories)

# 2. Histogram of Calories

library(ggplot2)

ggplot(data, aes(x = Calories)) +
  geom_histogram(binwidth = 50, fill = "skyblue", color = "black") +
  labs(title = "Distribution of Calories", x = "Calories", y = "Count") +
  theme_minimal()


# 3. Boxplot of Calories by Company

ggplot(data, aes(x = Company, y = Calories, fill = Company)) +
  geom_boxplot() +
  labs(title = "Calories by Company", x = "Company", y = "Calories") +
  theme_minimal() +
  theme(legend.position = "none")  # remove legend


# 4. Top 10 Items by Calories (Barplot)

top_items <- data %>%
  arrange(desc(Calories)) %>%
  head(10)

ggplot(top_items, aes(x = reorder(Item, Calories), y = Calories, fill = Calories)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  labs(title = "Top 10 Items by Calories", x = "Item", y = "Calories") +
  scale_fill_gradient(low = "lightgreen", high = "darkgreen") +
  theme_minimal()


# 5. Scatter plot: Calories vs Total Fat

ggplot(data, aes(x = Total.Fat..g., y = Calories)) +
  geom_point(color = "red", alpha = 0.6) +
  labs(title = "Calories vs Total Fat", x = "Total Fat (g)", y = "Calories") +
  theme_minimal()


# 6. Scatter plot: Calories vs Protein

ggplot(data, aes(x = Protein..g., y = Calories)) +
  geom_point(color = "blue", alpha = 0.6) +
  labs(title = "Calories vs Protein", x = "Protein (g)", y = "Calories") +
  theme_minimal()

# 7. Correlation Heatmap of Numeric Variables

numeric_cols <- c(
  "Calories", "Calories.from.Fat", "Total.Fat..g.", "Saturated.Fat..g.",
  "Trans.Fat..g.", "Cholesterol..mg.", "Sodium...mg.", "Carbs..g.",
  "Fiber..g.", "Sugars..g.", "Protein..g.", "Weight.Watchers.Pnts"
)

numeric_data <- data[numeric_cols]

corr_matrix <- cor(numeric_data, use = "complete.obs")

corrplot(corr_matrix, method = "color", type = "upper",
         tl.col = "black", addCoef.col = "black",
         title = "Correlation Heatmap of Nutritional Values", mar=c(0,0,1,0))

