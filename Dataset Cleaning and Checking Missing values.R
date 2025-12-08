# ------------------------------
# DATA CLEANING FOR FastFoodNutritionMenuV2
# ------------------------------

# 1. Set working directory
setwd("C:/Users/iamta/Downloads/Group B 170 Project")  

# 2. Load dataset
data <- read.csv("FastFoodNutritionMenuV2.csv", header = TRUE, stringsAsFactors = FALSE)

# 3. Preview structure
str(data)

# ------------------------------
# 4. Clean numeric columns
# ------------------------------

numeric_cols <- c(
  "Calories", "Calories.from.Fat", "Total.Fat..g.", "Saturated.Fat..g.",
  "Trans.Fat..g.", "Cholesterol..mg.", "Sodium...mg.", "Carbs..g.",
  "Fiber..g.", "Sugars..g.", "Protein..g.", "Weight.Watchers.Pnts"
)

# Convert selected columns to numeric
data[numeric_cols] <- lapply(data[numeric_cols], function(x) {
  as.numeric(gsub(",", "", x))
})

# ------------------------------
# 5. Check for missing values
# ------------------------------
colSums(is.na(data))

# ------------------------------
# 6. Remove rows with all NA values
# ------------------------------
data <- data[rowSums(is.na(data)) != ncol(data), ]

# ------------------------------
# 7. Clean text columns
# ------------------------------
data$Company <- trimws(data$Company)
data$Item <- trimws(data$Item)

# ------------------------------
# 8. Final structure check
# ------------------------------
str(data)
head(data)
View(data)
