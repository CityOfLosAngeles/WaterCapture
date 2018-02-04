
# Load necessary packages -------------------------------------------------

library(httr)
library(rvest)
library(dplyr)


# Read html page, scrape raw data -----------------------------------------

rain <- read_html("http://dpw.lacounty.gov/wrd/precip/alert_rain/season_raindata.cfm?id=377")

rain_table <- rain %>% html_nodes("td, th") %>% html_text() %>% as.data.frame()
rain_table <- rain_table[2:nrow(rain_table), 1] %>% as.data.frame()


# Format raw data into table ----------------------------------------------

rain_data <- split(rain_table, 1:4) %>% as.data.frame()
names(rain_data) <- c("Date_Time", "Raw_Count", "Amount_inches", "Accumulated_inches")
rownames(rain_data) <- 1:nrow(rain_data)
rain_data <- rain_data[2:nrow(rain_data), ]

View(rain_data)
