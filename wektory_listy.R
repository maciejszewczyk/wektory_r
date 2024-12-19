# first_vector <- c(1, 2, 3, "abc")
# second_vector <- c(1, 2, 3, FALSE, FALSE)
# third_vector <- c(1, 1.11, FALSE, TRUE)
# vector_a <- c(5L, 15L, 1, 2, 3)
# typeof(vector_a)
# length(first_vector)
# is.integer(vector_a)
# x <- c(5, 10, 15)
# names(x) <- c("piec", "dziesiec", "pietnascie")
# x
# data.frame(x = c(1, 2, 3) , y = c(1.5, 5.5, 7.5))
# z <- data.frame(x = c(1, 777, 3) , y = c(1.5, 5.5, 7.5))
# z[2,1]
# matrix(c(3:14), nrow = 2)
# x <- 5
# if (x > 4) {
#   print("wieksza niz 4")
# }
# 
# browseVignettes("ggplot2")


data("ToothGrowth")

View(ToothGrowth)

library(dplyr)

filtered_tg <- filter(ToothGrowth, dose == 0.5)
filtered_tg

arrange(filtered_tg, len)


filtered_toothgrowth_A <- ToothGrowth %>%
  filter(dose == 0.5) %>%
  arrange(len)

filtered_toothgrowth_A

filtered_toothgrowth_B <- ToothGrowth %>%
  filter(dose == 0.5) %>%
  group_by(supp) %>%
  summarize(mean_lean = mean(len, na.rm = T), .group = "drop")

filtered_toothgrowth_B

dmy("7-10-2020")
mdy("July 10th, 2020")

data()

library("palmerpenguins")
View(penguins)

penguins %>% group_by(island) %>% drop_na() %>% summarize(max_bill = max(bill_length_mm))

penguins %>% group_by(species, island) %>% drop_na() %>% summarize(max_bill = max(bill_length_mm), mean_bill = mean(bill_length_mm))


example_df <- bookings_df %>% summarise(number_canceled = sum(is_canceled), average_lead_time = mean(lead_time))

head(example_df)




id <- c(1:10)


name <- c("John Mendes", "Rob Stewart", "Rachel Abrahamson", "Christy Hickman", "Johnson Harper", "Candace Miller", "Carlson Landy", "Pansy Jordan", "Darius Berry", "Claudia Garcia")


job_title <- c("Professional", "Programmer", "Management", "Clerical", "Developer", "Programmer", "Management", "Clerical", "Developer", "Programmer")


employee <- data.frame(id, name, job_title)

separate(employee, name, into=c('first_name', 'last_name'), sep=' ')



first_name <- c("John", "Rob", "Rachel", "Christy", "Johnson", "Candace", "Carlson", "Pansy", "Darius", "Claudia")

last_name <- c("Mendes", "Stewart", "Abrahamson", "Hickman", "Harper", "Miller", "Landy", "Jordan", "Berry", "Garcia")

job_title <- c("Professional", "Programmer", "Management", "Clerical", "Developer", "Programmer", "Management", "Clerical", "Developer", "Programmer")

employee2 <- data.frame(id, first_name, last_name, job_title)

print(employee2)

unite(employee2, 'name', first_name, last_name, sep='+')

install.packages('Tmisc')
library(Tmisc)
data(quartet)
View(quartet)

quartet %>% group_by(set) %>% summarize(mean(x), sd(x), mean(y), sd(y), cor(x, y))

ggplot(quartet, aes(x,y)) + geom_point()+ geom_smooth(method=lm, se=FALSE) + facet_wrap(~set)


install.packages('datasauRus')

library('datasauRus')

ggplot(datasaurus_dozen,aes(x=x,y=y,colour=dataset))+geom_point()+theme_void()+theme(legend.position = "none")+facet_wrap(~dataset,ncol=3) 



install.packages("SimDesign")
library(SimDesign)

actual_temp <- c(68.3, 70, 72.4, 71, 67, 70)
predicted_temp <- c(67.9, 69, 71.5, 70, 67, 69)

bias(actual_temp, predicted_temp)


actutal_sales <- c(150, 203, 137, 247, 116, 287)
predicted_sales <- c(200, 300, 150, 250, 150, 300)
bias(actutal_sales, predicted_sales)

library(dplyr)

data("ToothGrowth")
View(ToothGrowth)


ToothGrowth %>% select(-c(supp))

View(penguins)
penguins %>%
  filter(species == "Adelie")


# ====================================

data(penguins)
View(penguins)

ggplot(data = penguins) + geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g))

ggplot(data = penguins) + geom_jitter(mapping = aes(x = flipper_length_mm, y = body_mass_g))


ggplot(data = penguins, mapping = aes(x = flipper_length_mm, y = body_mass_g)) +  geom_point()

ggplot(data = penguins) + geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color=species, shape=species, size=species))


ggplot(data = penguins) + geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, alpha=species))

ggplot(data = penguins) + geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g), color="purple")



# ====

ggplot(data = penguins) + geom_smooth(mapping = aes(x = flipper_length_mm, y = body_mass_g))


ggplot(data = penguins) + geom_smooth(mapping = aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g))


ggplot(data = penguins) + geom_smooth(mapping = aes(x = flipper_length_mm, y = body_mass_g, linetype=species))

# =====

ggplot(diamonds) +
  geom_bar(mapping=aes(x=cut))

ggplot(diamonds) +
  geom_bar(mapping=aes(x=cut, color=cut))


ggplot(diamonds) +
  geom_bar(mapping=aes(x=cut, fill=cut))

ggplot(diamonds) +
  geom_bar(mapping=aes(x=cut, fill=clarity))



# =====
#czyli mapping nie jest potrzebny?
ggplot(data=penguins, aes(x=flipper_length_mm, y=body_mass_g)) + geom_point()

ggplot(data=penguins, aes(x=flipper_length_mm, y=body_mass_g)) + geom_point(aes(color=species))

ggplot(data=penguins, aes(x=flipper_length_mm, y=body_mass_g)) + geom_point(aes(color=species))+
  facet_wrap(~species)

ggplot(data=penguins, aes(x=flipper_length_mm, y=body_mass_g)) + geom_point(aes(color=species))+
  facet_grid(~species)

ggplot(data=penguins, aes(x=flipper_length_mm, y=body_mass_g)) + geom_point(aes(color=species))+
  facet_grid(sex~species)


# ====
install.packages("rmarkdown")
