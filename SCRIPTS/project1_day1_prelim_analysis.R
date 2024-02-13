library(schrute)
library(dplyr)
library(ggplot2)
library(forcats)


mydata <- schrute::theoffice
dplyr::glimpse(mydata)

# testing vader here
#install.packages("vader")
library(vader)
get_vader("This book is horrible, but I love it.")["compound"]
get_vader("This book is horrible")["compound"]
get_vader("I love this book")["compound"]
get_vader("What?")

# isolating one character - test
pam = mydata[mydata$character == "Pam",]
pam$text_w_direction

# figure out characters w most lines
x <- table(mydata$character)
top_characters = as.data.frame(x[x > 100])
top_characters 

# add their gender in
gender = c("m", "f", "m", "m", "m", "m", "m", "m", "m", "m", 
           "f", "m", "f", "f", "m", "f", "f", "f", "m", "f", 
           "m", "f", "m", "f", "m", "f", "m", "m", "m", "m", "m")
top_characters$gender = gender

# and plot
ggplot(data=top_characters, aes(x=reorder(Var1,-Freq), y = Freq, fill = gender)) +
  geom_bar(stat="identity")+
  theme(axis.text.x=element_text(angle=90))+xlab("Character")+
  scale_fill_manual(values=c("red", "blue"))+ggtitle("Lines per character, colored by gender (characters with >100 lines)")

# top four characters
michael = mydata[mydata$character == "Michael",]
dwight = mydata[mydata$character == "Dwight",]
jim = mydata[mydata$character == "Jim",]
pam = mydata[mydata$character == "Pam",]

d1 = michael%>%group_by(season)%>%count()
d1$character = replicate(8, "Michael")
d2 = dwight%>%group_by(season)%>%count()
d2$character = replicate(9, "Dwight")
d3 = pam%>%group_by(season)%>%count()
d3$character = replicate(9, "Pam")
d4 = jim%>%group_by(season)%>%count()
d4$character = replicate(9, "Jim")

dat_new = rbind(d1, d2, d3, d4)
dat_new$gender = ifelse(dat_new$character == "Pam", "f", "m")


ggplot(dat_new, aes(x = as.factor(season), y = n, fill = gender))+
  geom_bar(stat="identity")+facet_wrap(~character)+xlab("Season Number")+
  ggtitle("Number of lines per season (top 4 characters with the most lines)")+  scale_fill_manual(values=c("red", "blue"))
  
  
  