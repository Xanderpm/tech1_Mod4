#this is code

#install.packages("usethis")
credentials::git_credential_ask()
usethis::git_sitrep()

# Creating github token
usethis::create_github_token()

# Entering token as credential 
gitcreds::gitcreds_set()

#Starting workshop 1

install.packages("tidyverse")
library(tidyverse)
#mpg #opening the dataset

#creating first ggplot

ggplot(data = mpg) + #make sure you do "data =" bc otherwise it makes an empty plot
  geom_point(mapping = aes(x = displ, y = hwy,color = class)) #adding "colour = class" makes colors based on class

##ggplot(data = mpg) + #make sure you do "data =" bc otherwise it makes an empty plot
##geom_point(mapping = aes(x = displ, y = hwy,size = class, color= class)) #adding "colour = class" makes colors based on class
#"size=class" changes the sizes based on class
# using "alpha = class" changes transparency

#separating one plot multiple smaller plots
facet_wrap()

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy,color = class)) +
  facet_wrap(~ class, nrow = 2) #using the "~" indicates which variable you want to subset

#facet_grid() lets you do more than one variable

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy,color = class)) +
  facet_grid(drv ~ cyl) #use (. ~ cyl) to get rid of the row dimension, (cyl ~ .) to get rid of column 

#plotting the same data in different ways

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y =hwy))

#adding a linetype

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y =hwy, linetype = drv, color = drv))
#now plot multiple geoms in a single plot

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y =hwy)) +
  geom_point(mapping = aes(x = displ, y= hwy, color = drv))

#MAKING IT SIMPLE!!!!!!!!

ggplot(data = mpg, mapping = aes (x=displ, y=hwy)) +
  geom_point(mapping = aes(color = class)) +
  geom_smooth() #does the exact same thing but way easier to edit

#filtering
ggplot(data = mpg, mapping = aes (x=displ, y=hwy)) +
  geom_point(mapping = aes(color = class)) +
  geom_smooth(data=filter(mpg, class == "subcompact"), se = FALSE) #using the filter lets you select a specific class that you want to display

#the exercise
#did not feel like keeping it, but both lines of code produce the same graph

#diamonds
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x=cut)) #can use stat_count() instead of geom_bar and it will do the same thing

demo <- tribble(
  ~cut,         ~freq,
  "Fair",       1610,
  "Good",       4906,
  "Very Good",  12082,
  "Premium",    13791,
  "Ideal",      21551
)
demo

ggplot(data = demo) +
  geom_bar(mapping = aes(x = cut, y = freq), stat = "identity") #can change how it is mapped 

ggplot(data = demo) +
  geom_bar(mapping = aes(x = cut, y = after_stat(prop), group = 1))

#telling it to include max, min, and median
ggplot(data = diamonds) + 
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.min = min,
    fun.max = max,
    fun = median
  )

#aesthetics
ggplot(data = diamonds)+
  geom_bar(mapping = aes(x=cut, color= cut))
ggplot(data=diamonds) +
  geom_bar(mapping = aes(x = cut, fill= cut))

ggplot(data = diamonds) +
  geom_bar(mapping= aes(x=cut, fill=clarity))

#messing with transparency
ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity)) + 
  geom_bar(alpha = 1/5, position = "identity")


# To color the bar outlines with no fill color

ggplot(data = diamonds, mapping = aes(x = cut, colour = clarity)) + 
  geom_bar(fill = NA, position = "identity")

# Position adjustments
position = "fill" #works like stacking, but makes each set of stacked bars the same height.

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "fill")


# position = "dodge" 
#Places overlapping objects directly beside one another.

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge")


# Jittering
position = "jitter" #adds a small amount of random noise to each point to avoid overplotting when points overlap. This is useful for scatterplots but not barplots.

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), position = "jitter")
  #geom_point(mapping = aes(x = displ, y = hwy))


#The outline of how to do ggplot stuff: 

#ggplot(data = diamonds) + 
#stat_summary(
#  mapping = aes(x = cut, y = depth),
#  fun.min = min,
#  fun.max = max,
#  fun = median
#)

