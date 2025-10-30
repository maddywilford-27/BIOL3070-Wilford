#Day 1 Example Plot 
veremia <- read.csv("viremia_data_full.csv")
view(veremia)
View (veremia)
colnames(veremia)<- c("bird","n","Species","Family","Order","1","3","4","6")
#choose some colors 
cols<- c("black","grey",rainbow(26)[4:26])
#plot by species
plot(c(1,3,4,6),as.numeric(veremia[1,6:9]),type = "l",lwd=2, xlab="Day Postinf4ection", ylab="Log PFU/ml Serum")
for (i in 2:nrow(veremia)){lines(c(1,3,4,6),as.numeric(veremia[i,6:9]),lwd=2,col=cols)}