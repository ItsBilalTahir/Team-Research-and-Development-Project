# ------------------------------
# Load FastFoodNutritionMenuV2 Dataset
# ------------------------------

# 1. Set Working Directory
setwd("C:/Users/iamta/Downloads/Group B 170 Project/RProject")

# 2. Confirm working directory
getwd()

# 3. Load CSV dataset
data <- read.csv("FastFoodNutritionMenuV2.csv", header = TRUE)

# 4. Preview the data
head(data)
View(data)

# 5.  Print structure
str(data)

