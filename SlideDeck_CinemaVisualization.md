
Russian Cinema theaterst performance: Visualization & Analysis
========================================================
author: Evgeniy Paskin
date: 10 April 2017
autosize: true

Background for analysis
========================================================

**Russian cinema theaters market is quite competitive**

- There are more than 1 500 cinemas across the country
- There are more than 770 cinemas networks across the country 

With so many participants it's difficult to get the feeling of the industry


**To get better understanding of the industry we'll make some analysis**
- We'll do some EDA on collected data to understand the concentration
- We'll create the instrument to **visually** explore the competitive landscape of the industry


Reading data
========================================================

We'll work with cyrillic symbols => need to prepare local settings

```r
Sys.setlocale("LC_CTYPE", "ru_RU.UTF-8")
```

```
[1] "ru_RU.UTF-8"
```

Loading required libraries

```r
library(readr)
library(dplyr)
```

Reading data from file

```r
CCC<-readRDS("~/Dropbox/_MyProjects/Data Science/Software Product/CCC.RDS")
```

Data overview
========================================================
Let's start with brief data summary.
Column names describe info for each cinema theater

```r
colnames(CCC)
```

```
 [1] "Name"               "Circuit"            "Screens"           
 [4] "City"               "Lat"                "Lon"               
 [7] "IsOpen"             "Year"               "Revenue"           
[10] "Tickets"            "CircuitRevenue2016" "CircuitRank"       
[13] "IsTop10"            "TopCircuitName"    
```
Total number of theaters

```r
length(unique(CCC$Name))
```

```
[1] 1542
```
Total number of cirquits

```r
length(unique(CCC$Circuit))
```

```
[1] 776
```


Convenient analitical tools
========================================================

It's extremely difficult to analyze combined data. Therefore we'll **create an interactive map**, that will show all cirquits/theaters and visualise it's performance in a beatiful way.

**https://paskin.shinyapps.io/CinemaMap/**

Key tool's features:
- The user can select one of 3 years of statistics to visualise: 2014-2016
- The Cinema's circle area reflects one of 2 parameters for comparison: either revenue or # of tickets sold
- The Scaling factor slider allows to fine-tune visualisation by adjusting Circle's area calculation
- Circles color represent which network does the exact Cinema theater belongs to
- If you click the circle - you'll see the combined analytics for the exact Cinema


