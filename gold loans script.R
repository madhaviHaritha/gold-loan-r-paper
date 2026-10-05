getwd()
library(readxl)
#reading excel file and load data in data frame
df <- read_excel("master_dataset_gold_personal_loans_credit_card.xlsx",sheet="Master_Dataset")
#inspect first few rows and columns
head(df)
summary.data.frame(df)

# 1. Define the specific variables used in Model 1
vars_model1 <- c("Ln_Gold_Loans", "Repo_t", "Ln_IIP_Index", "Ln_CPI_Index", "India_GPR")
#2.checking and making them to numeric values in data frame
df[vars_model1] <- lapply(df[vars_model1],as.numeric)
#3.checking for na values in data set and omitting them
df_clean <- na.omit(df1[,vars_model1])
#4. checking if all the  66rows are preserved
nrow(df_clean)
#5. Run Model 1 that is whether repo affects the gold loans 
model1 <- lm(Ln_Gold_Loans ~ Repo_t + Ln_IIP_Index + Ln_CPI_Index + India_GPR, data = df_clean)
#6.view summary of model1
summary(model1)
#7.lets test model 2 on how gold prices affect gold loans 
#variables for model 2 
vars_model2 <- c("Ln_Gold_Loans", "Ln_IIP_Index", "Ln_CPI_Index", "India_GPR","Ln_Gold_Price")
#8.chaecking if all variables are numeric and assigning so to them
df[vars_model2] <- lapply(df[vars_model2],as.numeric)
#9.checking for na values and ommiting them
df_clean2 <- na.omit(df[,vars_model2])
#10.checking if all rows are still there
nrow(df_clean2)
#11. running regression for gold loans and gold prices
model2 <- lm(Ln_Gold_Loans ~ Ln_Gold_Price + Ln_IIP_Index + Ln_CPI_Index + India_GPR, data = df_clean2)
#12.summary of model2 
summary(model2)




