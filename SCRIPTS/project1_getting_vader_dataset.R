library(schrute)
library(dplyr)
library(vader)

mydata <- schrute::theoffice

# selecting only top characters
x <- table(mydata$character)
top_characters = as.data.frame(x[x > 100])
top_characters
gender = c("m", "f", "m", "m", "m", "m", "m", "m", "m", "m", 
           "f", "m", "f", "f", "m", "f", "f", "f", "m", "f", 
           "m", "f", "m", "f", "m", "f", "m", "m", "m", "m", "m")
top_characters$gender = gender
newdat = mydata[mydata$character %in% top_characters$Var1, ]



# running vader
newdat$vader = NA
l = 1:length(rownames(newdat))
for(i in l){
  newdat$vader[i] = get_vader(newdat$text_w_direction[i])["compound"]
}
  
colnames(top_characters) = c("character", "Freq", "gender")
top_char1 = top_characters[-2]

gg = merge(newdat, top_char1, by = "character")
gg= gg[order(gg$index),]


# selecting columns we want
final_dat = gg[c(1,3,4,8,9,13, 14)]
write.csv(final_dat, "C:\\Users\\Grace\\Desktop\\Data Science Project\\office_vader.csv", row.names = FALSE)

