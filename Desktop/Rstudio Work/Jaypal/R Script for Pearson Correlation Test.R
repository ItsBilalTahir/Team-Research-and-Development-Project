
# HYPOTHESIS TEST: Pearson Correlation


# 1. Load dataset 
# setwd("C:/Users/iamta/Downloads/Group B 170 Project")
# data <- read.csv("FastFoodNutritionMenuV2.csv", header = TRUE, stringsAsFactors = FALSE)

# 2. Clean numeric columns (ensure proper numeric type)
numeric_cols <- c(
  "Calories", "Calories.from.Fat", "Total.Fat..g.", "Saturated.Fat..g.",
  "Trans.Fat..g.", "Cholesterol..mg.", "Sodium...mg.", "Carbs..g.",
  "Fiber..g.", "Sugars..g.", "Protein..g.", "Weight.Watchers.Pnts"
)

data[numeric_cols] <- lapply(data[numeric_cols], function(x) as.numeric(gsub(",", "", x)))

# 3. Perform Pearson correlation test
cor_test <- cor.test(data$Total.Fat..g., data$Calories, method = "pearson")

# 4. Print correlation test result to console
print(cor_test)

# 5. Scatter plot with regression line and correlation annotation
library(ggplot2)

# Calculate correlation coefficient
cor_val <- round(cor(data$Total.Fat..g., data$Calories, use = "complete.obs"), 2)

ggplot(data, aes(x = Total.Fat..g., y = Calories)) +
  geom_point(color = "red", alpha = 0.6) +                 # Scatter points
  geom_smooth(method = "lm", color = "blue", se = TRUE) +  # Regression line with confidence interval
  labs(
    title = "Calories vs Total Fat",
    subtitle = paste("Pearson Correlation:", cor_val),
    x = "Total Fat (g)",
    y = "Calories"
  ) +
  theme_minimal()

# 5. Save results to text file

sink("R_console_output.txt")
cat("First 6 rows of dataset:\n")
print(head(data))
cat("\nPearson Correlation Test Results:\n")
print(cor_test)
sink()  

# 6. Confirm file saved
cat("Results saved to R_console_output.txt\n")

