# Pizza dough - three main ingrediants - flour, salt, baking powder
pizzaDesign <- expand.grid(flour = gl(2, 1, labels = c("-", "+")),
                           salt = gl(2, 1, labels = c("-", "+")),
                           bakPow = gl(2, 1, labels = c("-", "+")),
                           score = NA)
pizzaDesign 

pizzaDesign$ord <- sample(1:8, 8)
pizzaDesign[order(pizzaDesign$ord),]

library(SixSigma)

ss.data.doe1 <- data.frame(repl = rep(1:2, each = 8),
                           rbind(pizzaDesign[, -6], pizzaDesign[, -6]))
ss.data.doe1$score <- c(5.33, 6.99, 4.23, 6.61,
                        2.26, 5.75, 3.26, 6.24,
                        5.7, 7.71, 5.13, 6.76,
                        2.79, 4.57, 2.48, 6.18)
ss.data.doe1

aggregate(score ~ flour + salt + bakPow, 
          FUN = mean, data = ss.data.doe1)

doe.model1 = lm(score ~ flour + salt + bakPow +
                  flour * salt + flour * bakPow +
                  salt * bakPow + flour * salt * bakPow, 
                data = ss.data.doe1)

summary(doe.model1)

doe.model2 <- lm(score ~ flour + bakPow,
                 data = ss.data.doe1)
summary(doe.model2)

coef(doe.model2)

# score = 4.8306 + 2.4538*flour - 1.8662*bakPow

predict(doe.model2)

confint(doe.model2)

plot(c(-1, 1), ylim=range(ss.data.doe1$score),
     coef(doe.model1)[1] + c(-1, 1) * coef(doe.model1)[2],
     type="b", pch = 16)
abline(h = coef(doe.model1)[1])

library(ggplot2)

prinEf = data.frame(Factor=rep(c("A_Flour", 
                                 "C_Baking Powder"), each = 2),
                    Level = rep(c(-1, 1), 2),
                    Score = c(aggregate(score~flour, FUN=mean, data=ss.data.doe1)[,2],
                              aggregate(score~bakPow, FUN=mean, data=ss.data.doe1)[,2]))
p <- ggplot(prinEf, 
            aes(x = Level, y = Score)) +
  geom_point() +
  geom_line() +
  scale_x_continuous(breaks = c(-1, 1)) +
  facet_grid(.~Factor) + 
  geom_abline(intercept = mean(ss.data.doe1$score),
              slope = 0, linetype = "dashed")
print(p)


intEf = aggregate(score~flour+bakPow, 
                  FUN=mean, data=ss.data.doe1)
p <- ggplot(intEf, aes(x=flour, y=score, color=bakPow)) +
  geom_point() +
  geom_line(aes(group=bakPow)) +
  geom_abline(intercept=mean(ss.data.doe1$score),
              slope = 0,
              linetype = "dashed",
              color = "black")
print(p)  

par(mfrow=c(2,2))
plot(doe.model2)
box("outer")  

library(nortest)  
shapiro.test(residuals(doe.model2))  
lillie.test(residuals(doe.model2))  

# large p values -> we do not reject the normality of the residuals



pizzaDesign2 <- expand.grid(flour = gl(2, 1, labels = c("-", "+")),
                           salt = gl(2, 1, labels = c("-", "+")),
                           bakPow = gl(2, 1, labels = c("-", "+")),
                           temp = gl(2, 1, labels = c("-", "+")), 
                           time = gl(2, 1, labels = c("-", "+")), 
                           score = NA)
pizzaDesign2

