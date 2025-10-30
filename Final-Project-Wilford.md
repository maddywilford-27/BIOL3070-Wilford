Independent Project- Wilford
================
Maddy Wilford
2025-10-30

\#ABSTRACT

\#BACKGROUND

\#STUDY QUESTION & HYPOTHESIS

\##Question

\##Hypothesis

\##Prediction

\#METHODS

hi \## Scatterplot with line of best fit

``` r
mortality<- read.csv(file="infant-mortality-vaccines.csv")

# Library
library(ggplot2)


# Basic scatter plot.
p1 <- ggplot(mortality, aes(x=Year, y=mortality_rate)) + 
  geom_point( color="#69b3a2") 

# with linear trend
p2 <- ggplot(mortality, aes(x=Year, y=mortality_rate)) +
  geom_point() +
  geom_smooth(method=lm , color="red", se=FALSE) 

# linear trend + confidence interval
p3 <- ggplot(mortality, aes(x=Year, y=mortality_rate)) +
  geom_point() +
  geom_smooth(method=lm , color="red", fill="#69b3a2", se=TRUE) 
```

\#DISCUSION

\#CONCLUSION

\#REFERENCES
