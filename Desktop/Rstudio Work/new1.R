

library(dplyr)
library(ggplot2)

company_cor <- data %>%
  group_by(Company) %>%
  summarize(
    correlation = cor(Calories, Total.Fat..g., use = "complete.obs", method = "pearson"),
    n = sum(!is.na(Calories) & !is.na(Total.Fat..g.))
  )

print(company_cor)

ggplot(company_cor, aes(x = reorder(Company, correlation), y = correlation, fill = correlation)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  labs(
    title = "Correlation Between Calories and Total Fat by Company",
    x = "Company",
    y = "Pearson Correlation"
  ) +
  scale_fill_gradient(low = "lightblue", high = "darkblue") +
  theme_minimal()

write.csv(company_cor, "Company_Calorie_Fat_Correlation.csv", row.names = FALSE)

cat("Company-wise correlation table saved to Company_Calorie_Fat_Correlation.csv\n")
