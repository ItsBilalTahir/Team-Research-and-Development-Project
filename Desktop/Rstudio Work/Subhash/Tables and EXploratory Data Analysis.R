pairs(data[numeric_cols])
ggplot(data, aes(x=Total.Fat..g., y=Calories)) +
  geom_point() +
  facet_wrap(~Company) +
  theme_minimal()

# ------------------------------
#  Summary Tables
# ------------------------------

# Table 1: Summary statistics for numeric variables
numeric_summary <- summary(data[numeric_cols])
print(numeric_summary)

# Table 2: Count of items per Company
company_counts <- table(data$Company)
print(company_counts)

# Table 3: Top 10 highest calorie items
top_calories <- data[order(-data$Calories), ][1:10, c("Company", "Item", "Calories")]
print(top_calories)

# Table 4: Correlation matrix of numeric variables
cor_matrix <- cor(data[numeric_cols], use = "complete.obs")
print(cor_matrix)
