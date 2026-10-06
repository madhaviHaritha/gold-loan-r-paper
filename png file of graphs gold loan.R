# 1. Open the PNG image  (defines filename, size, and crisp resolution)
png("graphs_for_ gold_loans_paper.png",width = 1000,height=500,res=120)
#to run graphs side by side for model 1 and 2
par(mfrow=c(1,2))

#draw scatter plot of model 1 for repo vs gold loans
plot(df$Repo_t,df$Ln_Gold_Loans,
     main = "model1:reporate versus gold loans",
     xlab = "repo rate(%)",
     ylab = "gold loans",
     pch=19,
     col="navy")
#draw red trend line
abline(lm(Ln_Gold_Loans~Repo_t,data=df_clean),col="red",lwd=2)

#draw graph for model2 for gold prices vs gold loans
plot(df$Ln_Gold_Price,df$Ln_Gold_Loans,
     main="model2:gold price versus gold loans",
     xlab = "gold price(log)",
     ylab="gold loan(log)",
     pch=19,
     col="green")
#draw pink line for trend indication
abline(lm(Ln_Gold_Loans~Ln_Gold_Price,data=df_clean2),col="pink",lwd=2)

par(mfrow=c(1,1))
dev.off()
