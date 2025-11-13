Independent Project- Wilford
================
Maddy Wilford
2025-11-13

\#ABSTRACT

\#BACKGROUND

Over the span from 1900 to 2018, the United States witnessed a dramatic
decline in childhood mortality, as captured in the dataset compiled by
the National Center for Health Statistics (NCHS) that tracks childhood
death-rates by age at death. At the start of the 20th century, deaths
among children represented a significant share of overall mortality,
driven by infectious diseases, poor sanitation, limited medical
knowledge, and substandard neonatal care (CDC). By mid-century, public
health interventions, such as improved sanitation, widespread
immunization, better nutrition, and enhanced maternal and infant health
services, had begun to reduce these death-rates substantially. In the
latter decades, advances in neonatal intensive care, accident
prevention, and chronic disease management further accelerated the
decline. As a result, by 2018 childhood mortality measured in deaths per
100,000 children or age-adjusted rates had fallen to a fraction of its
1900 level, reflecting major gains in child survival and public health
infrastructure. Nonetheless, the dataset’s documentation notes that
age-adjusted death-rates after 1998 are calculated using the 2000 U.S.
standard population and that historical rates prior to 1999 rely on
older estimation methods.Data.gov. This long-term trend underscores both
the effectiveness of sustained public health efforts and the changing
nature of childhood mortality—from largely infectious- and
sanitation-related causes to a smaller number of deaths from congenital,
chronic, injury, or perinatal causes. We wanted to test how the rise of
vaccinations has contributed to the overall decline of child mortality
rates. We hypothesize that if children get vaccinated, that the rate of
child mortality will decline more than children who didn’t get
vaccinated.

``` r
library(tidyverse)
library(readr)

file_path <- "NCHS_-_Childhood_Mortality_Rates-1.csv"

# Step 1: Read file lines and detect header row
raw_lines <- read_lines(file_path)
header_idx <- which(grepl("^\\s*Year\\s*,", raw_lines))[1]

if (is.na(header_idx)) {
  stop("Header line starting with 'Year,' not found. Please check your CSV file.")
}

# Step 2: Read CSV from header line onward
mortality_data <- read_csv(
  file = file_path,
  skip = header_idx - 1,
  show_col_types = FALSE,
  locale = locale(grouping_mark = ",")
)

# Step 3: Keep only relevant columns and rename for clarity
mortality_data <- mortality_data %>%
  select(1:3) %>%
  set_names(c("Year", "AgeGroup", "DeathRate"))

# Step 4: Convert data types safely
mortality_data <- mortality_data %>%
  mutate(
    Year = as.numeric(Year),
    DeathRate = if (is.character(DeathRate)) parse_number(DeathRate) else DeathRate
  )

# Step 5: Quick preview
head(mortality_data)
```

    ## # A tibble: 6 × 3
    ##    Year AgeGroup  DeathRate
    ##   <dbl> <chr>         <dbl>
    ## 1  1900 1-4 Years     1984.
    ## 2  1901 1-4 Years     1695 
    ## 3  1902 1-4 Years     1656.
    ## 4  1903 1-4 Years     1542.
    ## 5  1904 1-4 Years     1592.
    ## 6  1905 1-4 Years     1499.

``` r
# Step 6: Plot line graph (one line per Age Group, or a single one if only one group exists)
ggplot(mortality_data, aes(x = Year, y = DeathRate, color = AgeGroup, group = AgeGroup)) +
  geom_line(size = 1.2) +
  geom_point(size = 0.9) +
  labs(
    title = "Child Mortality Rate in the U.S. (1900–2018)",
    subtitle = "National Center for Health Statistics (NCHS)",
    x = "Year",
    y = "Deaths per 100,000 children",
    color = "Age Group",
    caption = "Source: NCHS Childhood Mortality Rates Dataset"
  ) +
  theme_minimal(base_size = 13)
```

![](Final-Project-Wilford_files/figure-gfm/child-mortality-linegraph-1.png)<!-- -->

\#STUDY QUESTION & HYPOTHESIS

\##Question

-We wanted to see if between vaccinated and non-vaccinated groups, who
shows a more significant decline in child mortality?

\##Hypothesis

If a child gets vaccinated when born, it’s less likely to contribute to
the infant mortality rates

\##Prediction

I predict that the children who don’t get vaccinated will show more of a
significant decline in child morality

\#METHODS

Found data set came up with question coded graph

maybe explain why both lines start at the same point

``` r
library(dplyr)
library(ggplot2)

# Load data
data <- read.csv("infant-mortality-vaccines.csv")

# Clean and prepare
data <- data %>%
  mutate(
    Year = as.numeric(Year),
    # Use the *exact* text from your CSV:
    Group = ifelse(Entity == "With vaccines", "Vaccinated", "Unvaccinated")
  ) %>%
  filter(!is.na(Infant.mortality.rate), !is.na(Group), !is.na(Year))

# Make sure Group is a factor with both levels
data$Group <- factor(data$Group, levels = c("Vaccinated", "Unvaccinated"))

# Create clean version for modeling
data_long <- data %>%
  select(Year, Mortality = Infant.mortality.rate, Group)
```

\##Figure 1

The figure below compares the rate of child mortality for vaccinated
infants vs vaccinated infants

``` r
library(ggplot2)

ggplot(data_long, aes(x = Year, y = Mortality, color = Group)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, linewidth = 1.2) +
  theme_minimal(base_size = 14) +
  labs(
    title = "Comparison of Infant Mortality Rate Trends Over Time",
    x = "Year",
    y = "Infant Mortality Rate",
    color = "Group"
  )
```

![](Final-Project-Wilford_files/figure-gfm/plot_lm-1.png)<!-- -->

\##GLM

The analysis below shows a generalized linear model that tells us if
getting vaccinated contributes to lowering child mortaltiy rates

``` r
library(dplyr)

data <- read.csv("infant-mortality-vaccines.csv")

data <- data %>%
  mutate(
    Year = as.numeric(Year),
    # Match exact text in your CSV
    Group = ifelse(Entity == "With vaccines", "Vaccinated", "Unvaccinated")
  ) %>%
  filter(!is.na(Infant.mortality.rate), !is.na(Group), !is.na(Year))


data$Group <- factor(data$Group, levels = c("Vaccinated", "Unvaccinated"))

# Prepare data for modeling
data_long <- data %>%
  select(Year, Mortality = Infant.mortality.rate, Group)

# Linear model: test if slopes differ by group
model_interaction <- lm(Mortality ~ Year * Group, data = data_long)
summary(model_interaction)
```

    ## 
    ## Call:
    ## lm(formula = Mortality ~ Year * Group, data = data_long)
    ## 
    ## Residuals:
    ##      Min       1Q   Median       3Q      Max 
    ## -0.45427 -0.15337 -0.03921  0.11861  0.61848 
    ## 
    ## Coefficients:
    ##                          Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)            306.418394   4.095129   74.83   <2e-16 ***
    ## Year                    -0.150339   0.002049  -73.39   <2e-16 ***
    ## GroupUnvaccinated      -70.140490   5.791387  -12.11   <2e-16 ***
    ## Year:GroupUnvaccinated   0.035844   0.002897   12.37   <2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 0.2153 on 98 degrees of freedom
    ## Multiple R-squared:  0.9901, Adjusted R-squared:  0.9898 
    ## F-statistic:  3256 on 3 and 98 DF,  p-value: < 2.2e-16

\#DISCUSION

\#CONCLUSION

\#REFERENCES 1. ChatGPT 2. Our world data set 3. Research article for
background 4.
<https://data.cdc.gov/National-Center-for-Health-Statistics/NCHS-Childhood-Mortality-Rates/v6ab-adf5/data_preview>
