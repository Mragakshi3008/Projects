# Mragakshi
# 22229981
# MS5108
# Question 1
# Creating a vector x1 by taking 50 samples from Normal distribution
x1 <- rnorm(50)
# creating a distribution vector x2
x2 <- rexp(50)
# constant
cons <- 0.7
# linear combination x1 and x2 which is y
y = x1*cons + x2*cons
plot(x = x1, y = x2)
class.df <- data.frame(x1,x2,y)
Frame1 <- class.df

model <- lm(x1~ x2+y)
summary(model)

lm(Frame1)


# Question 2
Height <-c(1.82, 1.56, 1.74, 1.55, 1.63, 1.91, 2.05, 1.84, 1.80, 1.71)
Weight <-c(80.4, 66.2, 68.9, 70.1, 75, 83.7, 105.6, 79.5, 68, 69.4)
Dataframe = data.frame(Height,Weight)
Bodymassindex = (Weight/Height)/Height
# calculate mean and standard deviation
mean(Height)
mean(Weight)
mean(Bodymassindex)

sd(Height)
sd(Weight)
sd(Bodymassindex)


library('dplyr')
Sample = filter(Dataframe, Height >= 1.7 & Weight <70)

Sample_height <- Sample$Height
Sample_weight <- Sample$Weight
Sample_BMI = (Sample_weight/Sample_height)/Sample_height

mean(Sample_height)
mean(Sample_weight)
mean(Sample_BMI)

sd(Sample_height)
sd(Sample_weight)
sd(Sample_BMI)




