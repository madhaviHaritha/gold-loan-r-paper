# ==============================================================================
# BASELINE OLS REGRESSIONS (MODEL 1 & MODEL 2)
# ==============================================================================

library(readxl)

# Load data
df <- read_excel("master_dataset_gold_personal_loans_credit_card.xlsx", sheet = "Master_Dataset")

# Inspect dataset
head(df)
summary(df)

# ------------------------------------------------------------------------------
# MODEL 1: MONETARY POLICY CHANNEL (REPO RATE -> GOLD LOANS)
# ------------------------------------------------------------------------------

# 1. Define variables for Model 1
vars_model1 <- c("Ln_Gold_Loans", "Repo_t", "Ln_IIP_Index", "Ln_CPI_Index", "India_GPR")

# 2. Convert variables to numeric
df[vars_model1] <- lapply(df[vars_model1], as.numeric)

# 3. Handle missing values (FIXED: replaced df1 with df)
df_clean1 <- na.omit(df[, vars_model1])

# 4. Check remaining row count
nrow(df_clean1)

# 5. Run Model 1 OLS regression
model1 <- lm(Ln_Gold_Loans ~ Repo_t + Ln_IIP_Index + Ln_CPI_Index + India_GPR, data = df_clean1)

# 6. Summary output for Model 1
summary(model1)


# ------------------------------------------------------------------------------
# MODEL 2: COLLATERAL VALUE CHANNEL (GOLD PRICE -> GOLD LOANS)
# ------------------------------------------------------------------------------

# 7. Define variables for Model 2
vars_model2 <- c("Ln_Gold_Loans", "Ln_Gold_Price", "Ln_IIP_Index", "Ln_CPI_Index", "India_GPR")

# 8. Convert variables to numeric
df[vars_model2] <- lapply(df[vars_model2], as.numeric)

# 9. Handle missing values
df_clean2 <- na.omit(df[, vars_model2])

# 10. Check remaining row count
nrow(df_clean2)

# 11. Run Model 2 OLS regression
model2 <- lm(Ln_Gold_Loans ~ Ln_Gold_Price + Ln_IIP_Index + Ln_CPI_Index + India_GPR, data = df_clean2)

# 12. Summary output for Model 2
summary(model2)