CumulativeGains <- read.csv("CumulativeGains.csv")

library(ggplot2)
library(dplyr)

#Make qualitative data binary so it can be analyzed in logistic regression
CumulativeGains$restaurant <- ifelse(CumulativeGains$customer_type=="restaurant",1,0)

#Create logistic regression to understand customer probability of purchase
CumulativeGainslogit <- glm(buyer ~ last_purch + dollars + restaurant + customer_sqft + cab_franc + cab_sauvignon + malbec + merlot + red_blend + syrah, family = binomial(link = 'logit'), data = CumulativeGains)
summary(CumulativeGainslogit)

#Add a column that predicts purchase probability of customers based on logistic regression
CumulativeGains$purch_prob <- predict.glm(CumulativeGainslogit, CumulativeGains, type = "response")


#Organize customers into deciles
CumulativeGains$decile <- 11 - ntile(CumulativeGains$purch_prob,10)

#Plot deciles
ggplot(CumulativeGains) + stat_summary(aes(x = decile, y = buyer), fun = "mean", geom = "bar") + xlab("Decile") + ylab("Response Rate")

#Output deciles, number of buyers per decile, and purchase rate
CumulativeGains %>% 
  group_by(decile) %>%
  summarise(
    count = length(customer_id),
    buyers = sum(buyer),
    response_rate = mean(buyer)
  )


#Set up a data set of customers who are >= break even purchase probability. Use 5% as break even probability for example
Breakeven <- CumulativeGains[CumulativeGains$purch_prob>=0.05, ]

#Determine the number of customers we will market to, and how many we expect to buy
customers = nrow(Breakeven)
customers

expected_buyers = mean(Breakeven$purch_prob)*customers
expected_buyers

#Find average purchase probability of customers >= break even purchase probability
mean(Breakeven$purch_prob)

#Example of promotion costs = $25 and sales margin = $500 (25/500 = 5% break even)
promotion = 25
sales_margin = 500

profit = (mean(Breakeven$purch_prob)*sales_margin*customers) - (promotion*customers)
profit

#Find ROI on promotion
ROI = profit / (promotion * customers)
ROI


#ROI of marketing to entire data set
all_customers = nrow(CumulativeGains)
all_customers

all_expected_buyers = mean(CumulativeGains$purch_prob)*customers
all_expected_buyers

all_profit = (mean(CumulativeGains$purch_prob)*sales_margin*all_customers) - (promotion*all_customers)
all_profit

all_ROI = all_profit / (promotion * all_customers)
all_ROI
