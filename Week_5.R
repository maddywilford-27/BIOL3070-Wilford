read.csv()
read.csv(file="yourfile.csv")
#put quotes around file name
#save as object->
#data<- read.csv(file="your file")
head(data)
#head gives you the data in the top bit 
View(data)
#gives you a spreadsheet of the data
#W is capitalized
str()
#gives you more information about the fields in the objects 
dim()
#gives you how many columns and rows there are
  
#Example:   
  
read.csv(file="bloodmeal_for_BIOL3070.csv")
data<-read.csv(file="bloodmeal_for_BIOL3070.csv")
head(data)
View(data)
str(data)
dim(data)



Thursday Class
read.csv(file="bloodmeal_plusWNV_for_BIOL3070.csv")




