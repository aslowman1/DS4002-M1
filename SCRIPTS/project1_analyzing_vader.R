library(dplyr)
library(ggplot2)
#install.packages("ggdark")
library(ggdark)


dat = read.csv("office_vader.csv")

# there are nas, for now lets just remove
p = dat[is.na(dat$vader), ]
dat1 = dat[!is.na(dat$vader), ]


# average vader by character
v1 = dat1 %>% group_by(character)%>% summarise_at(vars(vader), list(name = mean))
gender = c("m", "f", "m", "m", "m", "m", "m", "m", "m", "m", 
           "f", "m", "f", "f", "m", "f", "f", "f", "m", "f", 
           "m", "f", "m", "f", "m", "f", "m", "m", "m", "m", "m")

v1$gender = gender


# plot
ggplot(v1, aes(x = reorder(character,-name), y = name, fill = gender))+geom_bar(stat = "identity")+
  scale_fill_manual(values=c("#FF5733", "#588AFA"), name = "Gender", labels = c("Female", "Male"))+xlab("Character")+ylab("Average vader score")+ dark_theme_gray()+
  theme(axis.text.x=element_text(angle=90))+ggtitle("Average Vader Score in 'The Office'")+
  facet_wrap(~gender, scales = 'free_x')


# look into top 4 characters 

v1$color = ifelse(v1$character %in% c("Michael", "Jim", "Dwight"), "blue", 
                  ifelse(v1$character == "Pam", "red", 
                         ifelse(v1$gender == "m", "lightblue", "pink"
                           
                         )))

ggplot(v1, aes(x = reorder(character,-name), y = name, fill = color))+geom_bar(stat = "identity")+
  scale_fill_manual(values = c("#588AFA", "#3B3B3B", "#3B3B3B", "#FF5733"))+xlab("Character")+ylab("average vader score")+ dark_theme_gray()+
  theme(axis.text.x=element_text(angle=90))+ theme(legend.position = "none")+ggtitle("Average Vader Score, Top 4 Characters Highlighted")+
facet_wrap(~gender, scales = 'free_x')




# over the course of the seasons

dat2 = dat1[dat1$character %in% c("Michael", "Dwight", "Pam", "Jim"),]

v3 = dat2 %>% group_by(character, season)%>% summarise_at(vars(vader), list(name = mean))

v3$gender = ifelse(v3$character == "Pam", "f", "m")

ggplot(v3, aes(x = as.factor(season), y = name, fill = gender))+geom_bar(stat = "identity") + 
  facet_wrap(~character)+xlab("Character") + ylab("Average Vader Score")+
  scale_fill_manual(values=c("#FF5733", "#588AFA"), name = "Gender", labels = c("Female", "Male"))+
  ggtitle("Average Vader Score by Season for Top 4 Characters")
