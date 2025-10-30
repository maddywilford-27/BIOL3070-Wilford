# Global infant mortality rate with and without vaccines - Data package

This data package contains the data that powers the chart ["Global infant mortality rate with and without vaccines"](https://ourworldindata.org/grapher/infant-mortality-vaccines?v=1&csvType=full&useColumnShortNames=false) on the Our World in Data website. It was downloaded on October 28, 2025.

### Active Filters

A filtered subset of the full data was downloaded. The following filters were applied:

## CSV Structure

The high level structure of the CSV file is that each row is an observation for an entity (usually a country or region) and a timepoint (usually a year).

The first two columns in the CSV file are "Entity" and "Code". "Entity" is the name of the entity (e.g. "United States"). "Code" is the OWID internal entity code that we use if the entity is a country or region. For normal countries, this is the same as the [iso alpha-3](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-3) code of the entity (e.g. "USA") - for non-standard countries like historical countries these are custom codes.

The third column is either "Year" or "Day". If the data is annual, this is "Year" and contains only the year as an integer. If the column is "Day", the column contains a date string in the form "YYYY-MM-DD".

The final column is the data column, which is the time series that powers the chart. If the CSV data is downloaded using the "full data" option, then the column corresponds to the time series below. If the CSV data is downloaded using the "only selected data visible in the chart" option then the data column is transformed depending on the chart type and thus the association with the time series might not be as straightforward.

## Metadata.json structure

The .metadata.json file contains metadata about the data package. The "charts" key contains information to recreate the chart, like the title, subtitle etc.. The "columns" key contains information about each of the columns in the csv, like the unit, timespan covered, citation for the data etc..

## About the data

Our World in Data is almost never the original producer of the data - almost all of the data we use has been compiled by others. If you want to re-use data, it is your responsibility to ensure that you adhere to the sources' license and to credit them correctly. Please note that a single time series may have more than one source - e.g. when we stich together data from different time periods by different producers or when we calculate per capita metrics using population data from a second source.

## Detailed information about the data


## Infant mortality rate
Infant mortality rate measures the share of newborns who die before reaching their first birthday. This is shown in a hypothetical scenario without vaccinations.
Last updated: November 28, 2024  
Date range: 1974–2024  
Unit: %  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
Shattock et al. (2024). Contribution of vaccination to improved survival and health: modelling 50 years of the Expanded Programme on Immunization. – processed by Our World in Data

#### Full citation
Shattock et al. (2024). Contribution of vaccination to improved survival and health: modelling 50 years of the Expanded Programme on Immunization. – processed by Our World in Data. “Infant mortality rate” [dataset]. Shattock et al. (2024). Contribution of vaccination to improved survival and health: modelling 50 years of the Expanded Programme on Immunization., “infant_mortality_vaccination_shattock” [original data].
Source: Shattock et al. (2024). Contribution of vaccination to improved survival and health: modelling 50 years of the Expanded Programme on Immunization. – processed by Our World In Data

### What you should know about this data

### Source

#### Shattock et al. (2024). Contribution of vaccination to improved survival and health: modelling 50 years of the Expanded Programme on Immunization. – infant_mortality_vaccination_shattock
Retrieved on: 2024-11-28  
Retrieved from: https://www.thelancet.com/journals/lancet/article/PIIS0140-6736(24)00850-X/fulltext  


    