# props to Aida from UCLA stats for writing this web scraping script!
# Load necessary packages -------------------------------------------------
if (!require("pacman")) install.packages("pacman")
pacman::p_load(httr, rvest, dplyr, stringr, RSocrata, lubridate)
Sys.setenv(TZ="America/Los_Angeles")

# Read html pages, scrape raw data -----------------------------------------
# LA DUCOMMUN RAIN GAUGE - recorded twice daily

ducommun_scrape <- read_html("http://dpw.lacounty.gov/wrd/precip/alert_rain/season_raindata.cfm?id=377")

ducommun_table <- ducommun_scrape %>% html_nodes("td, th") %>% html_text() %>% as.data.frame()
ducommun_table <- ducommun_table[2:nrow(ducommun_table), 1] %>% as.data.frame()

# Format raw data into table ----------------------------------------------
ducommun <- split(ducommun_table, 1:4) %>% as.data.frame()
names(ducommun) <- c("Date_Time", "Raw_Count", "Amount_inches", "Accumulated_inches")
rownames(ducommun) <- 1:nrow(ducommun)
ducommun <- ducommun[2:nrow(ducommun), ]

formatted <- data.frame(Raw_Count = rep(0, nrow(ducommun)), Amount_inches = rep(0, nrow(ducommun)), Accumulated_inches = rep(0, nrow(ducommun)))

for(i in 2:ncol(ducommun)){
  formatted[[i-1]] <- ducommun[[i]] %>% str_replace_all(., "\\s","") %>% as.numeric()
}

ducommun <- cbind(Date_Time = ducommun[,1], formatted)

# USC RAIN GAUGE - recorded hourly

USC_scrape <- read_html("http://dpw.lacounty.gov/wrd/precip/alert_rain/season_raindata.cfm?id=375")

USC_table <- USC_scrape %>% html_nodes("td, th") %>% html_text() %>% as.data.frame()
USC_table <- USC_table[2:nrow(USC_table), 1] %>% as.data.frame()

# Format raw data into table ----------------------------------------------
USC <- split(USC_table, 1:4) %>% as.data.frame()
names(USC) <- c("Date_Time", "Raw_Count", "Amount_inches", "Accumulated_inches")
rownames(USC) <- 1:nrow(USC)
USC <- USC[2:nrow(USC), ]

formatted <- data.frame(Raw_Count = rep(0, nrow(USC)), Amount_inches = rep(0, nrow(USC)), Accumulated_inches = rep(0, nrow(USC)))

for(i in 2:ncol(USC)){
  formatted[[i-1]] <- USC[[i]] %>% str_replace_all(., "\\s","") %>% as.numeric()
}

USC <- cbind(Date_Time = USC[,1], formatted)

# SCHOOLHOUSE RAIN GAUGE - recorded twice daily

schoolhouse_scrape <- read_html("http://dpw.lacounty.gov/wrd/precip/alert_rain/season_raindata.cfm?id=450")

schoolhouse_table <- schoolhouse_scrape %>% html_nodes("td, th") %>% html_text() %>% as.data.frame()
schoolhouse_table <- schoolhouse_table[2:nrow(schoolhouse_table), 1] %>% as.data.frame()

# Format raw data into table ----------------------------------------------
schoolhouse <- split(schoolhouse_table, 1:4) %>% as.data.frame()
names(schoolhouse) <- c("Date_Time", "Raw_Count", "Amount_inches", "Accumulated_inches")
rownames(schoolhouse) <- 1:nrow(schoolhouse)
schoolhouse <- schoolhouse[2:nrow(schoolhouse), ]

formatted <- data.frame(Raw_Count = rep(0, nrow(schoolhouse)), Amount_inches = rep(0, nrow(schoolhouse)), Accumulated_inches = rep(0, nrow(schoolhouse)))

for(i in 2:ncol(schoolhouse)){
  formatted[[i-1]] <- schoolhouse[[i]] %>% str_replace_all(., "\\s","") %>% as.numeric()
}

schoolhouse <- cbind(Date_Time = schoolhouse[,1], formatted)

# HOLLYWOOD RESEVOIR RAIN GAUGE - recorded hourly

hollywood_scrape <- read_html("http://dpw.lacounty.gov/wrd/precip/alert_rain/season_raindata.cfm?id=312")

hollywood_table <- hollywood_scrape %>% html_nodes("td, th") %>% html_text() %>% as.data.frame()
hollywood_table <- hollywood_table[2:nrow(hollywood_table), 1] %>% as.data.frame()

# Format raw data into table ----------------------------------------------
hollywood <- split(hollywood_table, 1:4) %>% as.data.frame()
names(hollywood) <- c("Date_Time", "Raw_Count", "Amount_inches", "Accumulated_inches")
rownames(hollywood) <- 1:nrow(hollywood)
hollywood <- hollywood[2:nrow(hollywood), ]

formatted <- data.frame(Raw_Count = rep(0, nrow(hollywood)), Amount_inches = rep(0, nrow(hollywood)), Accumulated_inches = rep(0, nrow(hollywood)))

for(i in 2:ncol(hollywood)){
  formatted[[i-1]] <- hollywood[[i]] %>% str_replace_all(., "\\s","") %>% as.numeric()
}

hollywood <- cbind(Date_Time = hollywood[,1], formatted)

# Tujunga S.G. RAIN GAUGE - 

tsg_scrape <- read_html("http://dpw.lacounty.gov/wrd/precip/alert_rain/season_raindata.cfm?id=462")

tsg_table <- tsg_scrape %>% html_nodes("td, th") %>% html_text() %>% as.data.frame()
tsg_table <- tsg_table[2:nrow(tsg_table), 1] %>% as.data.frame()

# Format raw data into table ----------------------------------------------
tsg <- split(tsg_table, 1:4) %>% as.data.frame()
names(tsg) <- c("Date_Time", "Raw_Count", "Amount_inches", "Accumulated_inches")
rownames(tsg) <- 1:nrow(tsg)
tsg <- tsg[2:nrow(tsg), ]

formatted <- data.frame(Raw_Count = rep(0, nrow(tsg)), Amount_inches = rep(0, nrow(tsg)), Accumulated_inches = rep(0, nrow(tsg)))

for(i in 2:ncol(tsg)){
  formatted[[i-1]] <- tsg[[i]] %>% str_replace_all(., "\\s","") %>% as.numeric()
}

tsg <- cbind(Date_Time = tsg[,1], formatted)

# Create new precipitation datasets - averages of certain rain guages per region to be more accurate
# For LA metro, use 2-gauge average (USC, LA Ducommun).
# used for rain barrels, green infrastructure (GI), and incidental capture
LA_precip <- mean(c(USC[1,4], ducommun[1,4]))

# for San Fernando Valley, use average of Schoolhouse DB (gauge 450), Hollywood resevoir (gauge 312), and TSG (gauge 462)
# can expand multi-guage average in the future - check w Anthony/stormwater dashboard doc for methodology that goes to precision level of seconds 
SFV_precip = mean(c(schoolhouse[1,4], hollywood[1,4], tsg[1,4]))

## SPREADING GROUNDS
#Read spreading ground capture dataset
spreading <- read.socrata("https://data.lacity.org/A-Livable-and-Sustainable-City/Spreading-Grounds-Centralized-Monthly-Capture/cy8h-q3bu")
#prep data
spreading <- na.omit(spreading)

# calculate the current season. new season starts on October 1 each year.
currentYear = year(today())
currentMonth = month(today())
if (currentMonth < 10) {
	currentSeason = paste0(currentYear - 1, '-', currentYear)
} else {
	currentSeason = paste0(currentYear, '-', currentYear + 1)
}

#calculate spreading ground capture this season
this_season <- spreading %>% select(-Month) %>% group_by(Rain.Season) %>% summarize_all(sum) %>%
  filter(Rain.Season == currentSeason) %>% select(-Rain.Season)
#sum all spreading grounds to get cumulative 
spreading_capture <- rowSums(this_season)

## RAIN BARRELS AND CISTERNS
# Read rain barrels & cisterns capacity dataset
barrels <- read.socrata("https://data.lacity.org/A-Livable-and-Sustainable-City/Rain-Barrels-And-Cisterns-Issued-Through-LAWDP-Reb/a5vt-xsyi")
#prep data
barrels <- na.omit(barrels)

# Perform calculations to get total capture this season
# Precipitation in LA metro * Unit Capture (AFY) for rain barrels and small, medium, large cisterns 
rb_unit_capture = 0.0019
sc_unit_capture = 0.0076
mc_unit_capture = 0.0094
lc_unit_capture = 0.0108

# Total residential rain barrel capture
rb_capture_total <-  LA_precip * rb_unit_capture * sum(barrels$Rain.Barrels)

# Total small cistern capture, today's small cistern capture
sc_capture_total = LA_precip * sc_unit_capture * sum(barrels$Residential..Small..Cisterns)
mc_capture_total = LA_precip * mc_unit_capture * sum(barrels$Medium.Cisterns)
lc_capture_total = LA_precip * lc_unit_capture * sum(barrels$Large.Cisterns)

# Total capture via this method
# Divide by yearly precipitation in LA
barrels_and_cisterns_capture = (sum(rb_capture_total, sc_capture_total, mc_capture_total, lc_capture_total)/15.02)

#calculate number of projects
barrels_and_cisterns_projects <- sum(barrels$Rain.Barrels, barrels$Residential..Small..Cisterns, barrels$Medium.Cisterns, barrels$Large.Cisterns)

## INCIDENTAL CAPTURE
# Average year capture for San Fernando Valley is 29,900 Acre Ft according to the Stormwater Capture Master Plan
incidental_avg_SFV <- 29900
# Average year capture for LA Metro area is 5,100 Acre Ft 
incidental_avg_LA <- 5100

# Calculate incidental capture this season
# Percentage of average capture this season represents - Annual rainfall per season assume 15.02 inches 
incidental_LA_total <- (LA_precip/15.02) * incidental_avg_LA

# Percentage of average capture this season represents - Annual rainfall per season assume 18.73 inches 
incidental_SFV_total <- (SFV_precip/18.73) * incidental_avg_SFV

# Total capture via this method
incidental_capture = sum(incidental_LA_total, incidental_SFV_total)

## GREEN INFRASTRUCTURE
# Read GI projects dataset
GI <- read.socrata("https://data.lacity.org/A-Livable-and-Sustainable-City/Green-Infrastructure-Water-Capture-Capacity/pdbw-x3k8")
# Limit to LA city
GI <- filter(GI, LA.City.Water.Supply == "Yes")

# Total capture via this method
GI_capture = sum(GI$Drainage.Area...Acres., na.rm=T) * LA_precip

# Green Streets and Alleys capture
GSA <- filter(GI, Green.Street...Alley == "Yes")
GSA_capture = sum(GSA$Drainage.Area...Acres., na.rm=T) * LA_precip

## FINAL DATASET
# Read table of total capture 
total_capture <- read.socrata("https://data.lacity.org/A-Livable-and-Sustainable-City/Water-Capture-by-Method/xe35-4wsy")

# Create data frame to replace dataset - can switch to append later if we want
# Record today's date time stamp and the capture per method
new_row <- data.frame(now(), spreading_capture, barrels_and_cisterns_capture, incidental_capture,	GI_capture, GSA_capture)
new_row$combined <- sum(spreading_capture, barrels_and_cisterns_capture, incidental_capture, GI_capture)
new_row$rain_in <- LA_precip
glimpse(total_capture)
names(new_row) <- c("timestamp", "spreading_capture", "barrels_and_cisterns_capture", "incidental_capture",	"gi_capture", "green_streets_and_alleys_capture", "total_capture", "rain_in")

names(total_capture) <- c("timestamp", "spreading_capture", "barrels_and_cisterns_capture", "incidental_capture",	"gi_capture", "green_streets_and_alleys_capture", "total_capture", "rain_in")

# check whether it has rained since the data were last posted
last_rain <- total_capture$rain_in[length(total_capture$rain_in)]
current_rain <- new_row$rain_in

# if the current rainfall total is not equal to the previous rainfall total
# then update the data
if (round(current_rain,2) != round(last_rain,2)) {
  new_dataset <- rbind(total_capture, new_row)

  # Write table to Socrata using RSocrata package
  # Set password
  user_password <- readLines("password.txt")

  write.socrata(dataframe = new_dataset,
                dataset_json_endpoint = "https://data.lacity.org/resource/xe35-4wsy.json",
                update_mode = "REPLACE",
                email = "adam.scherling@lacity.org",
                password = user_password)

}



