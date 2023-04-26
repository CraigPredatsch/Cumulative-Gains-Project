# Cumulative-Gains-Project
Project to show benefit to show the benefit of directing costly marketing efforts to increase profitability and ROI.

This project takes a set of data that shows wine sale history among a set of customers, and analyzes which customers will be more likely purchase a case of a new type of wine after being sent a sample bottle.

The R code (Cumulative Gains Example.R) reads the data set and creates a logistic regression to identify the statistical significance of each data point we have on our customers. The script uses this regression to determine the probability that each customer purchases a case of wine.

From here, the script sorts the customers into deciles based on their purchase probabilities, outputs a graph of these deciles, and outputs the total customers per decile, number of buyers in each decile, and the purchase rate of each decile (Response Rate Decile Data.PNG).

Next, this information is added into Excel to find the lift and gains to targeting each decile grouping.

Individual response rates, lifts, and gains are calculated for each decile, and then cumulative lifts and gains are calculated for each decile including all deciles below it (ex: cumulative gains for 40% is the cumulative gain for the top 40% likely to buy customers).

Charts for cumulative lift and gains are created in Excel and shown here (Cumulative Lift Plot.PNG, Cumulative Gains Plot.PNG). Without even going any further, a look at the cumulatie gains and lift charts can show the majority of the benefit of the ad campaign comes from a subset of the customer base. This already points to targeting the promotion to minimize costs and maximize profit.

If the cost of the marketing promotion, cost of service, and total revenue are known, then the breakeven percentage can be found by dividing promotion costs by the sales margin (revenue - costs). Going back to the R code, I assumed a promotion cost of $25 and a sales margin of $500. This means the breakeven percentage = 25/500 = 5%.

This break even percentage represents the minimum purchase probability of a customer that we would like to offer the promotion to so that we can maximize our profits.

The R script finds the number of customers we plan to advertise to who have purchase probabilities greater than the breakeven percentage, and then determines the number of buyers out of those advertised to.

Next it plugs in the given promotion value of $25 and sales margin value of $500 to find the profit. Profit = (avg of breakeven data set purchase probability * sales margin * customers advertised to) - (promotion cost * customers advertised to)

ROI is caluclated by dividing profit by (promotion costs * number of customers advertised to)

Finally, the script finds the profit and ROI of offering the promotion to the entire dataset.

The Profit_ROI image shows that by offering the promotion to the entire dataset of customers, we have profitability of $758,500 at an ROI of 75.85%, but if we target customers who have a purchase probability greater than the breakeven percentage the profitability is $1,010,132 with an ROI of 198.73%. (See Profit_ROI.PNG) 

This is a massive improvement and shows the value in using logistic regressions to find purchase probability of a customer base when running promotions that have a cost to them. If costs/margins are unknown, there is still value in finding the cumulative gains / cumulative lift of the deciles of a data set and visually having an idea of where you gain the majority of your value when promoting a sale to your customer base.
