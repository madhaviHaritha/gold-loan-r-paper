#draw scatter plot of model 1 for repo vs gold loans
plot(df$Repo_t,df$Ln_Gold_Loans,
     main = "model1:reporate versus gold loans",
     xlab = "repo rate(%)",
     ylab = "gold loans",
     pch=19,
     col="navy")
#draw red trend line
abline(lm(Ln_Gold_Loans~Repo_t,data=df),col="red",lwd=2)

#draw graph for model2 for gold prices vs gold loans
plot(df$Ln_Gold_Price,df$Ln_Gold_Loans,
     main="model2:gold price versus gold loans",
     xlab = "gold price(log)",
     ylab="gold loan(log)",
     pch=19,
     col="green")
#draw pink line for trend indication
abline(lm(Ln_Gold_Price~Ln_Gold_Loans,data=df),col="pink",lwd=2)
