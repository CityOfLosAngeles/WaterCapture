# Stormwater application: methods (draft page)

The stormwater data were collected starting in April 2018. The methods were...

Category | Relevant Socrata URL | Calculation for volume captured | Metrics (per water season) | Refresh Rate (i.e. monthly)
--- | --- | --- | --- | ---
Water Capture Total - All Methods | Water Capture by Method | Sum of water captured by method | Volume captured by method in acre ft; Water capture over time by month (starting with first month of launch) across all capture categories so color should be uniform; % capture designated for water supply | NA - automated
Spreading Grounds | LA City Spreading Grounds Monthly Capture<br>Original source - LA County DPW Conserved water by year<br>Note that the City is concerned with the five facilities in the San Fernando Valley | None - taken directly from County reporting | Volume captured (total this season); number of current projects;<br>% capture designated for water supply: 100% | Monthly (previous month’s data comes out during following month)
Rain Barrels and Cisterns | Rain Barrels and Cisterns Issued Through LADWP Rebate Program | Rainfall this season (see below) * latest rain barrel count * factor for capture per barrel | Volume captured (total this season); number of current projects;<br>% capture designated for water supply: 100% | Approximately real time/when it rains<br>Rain Barrels dataset updated monthly
GSI | Green Streets Infrastructure Water Capture Capacity | Rainfall this season * drainage area (acres) | Volume captured (total this season);  | Approximately real time/when it rains<br>GSI dataset updated as new projects are added (confirm with LASAN)
GSI - Green Streets & Alleys | Green Streets Infrastructure Water Capture Capacity - column for Green Street / Alley | Same as above but filtered on column designating GSI type | Volume Green streets and alleys (total this season); | Approximately real time/when it rains<br>GSI dataset updated as new projects are added (confirm with LASAN)
Incidental Capture | Incidental Capture Annual Yield | Annual yield (capacity) * rainfall so far this season divided by the average season rainfall  | Volume captured (cumulative per rain season); | NA

## High level metrics

Category | Relevant Socrata URL | Calculation for volume captured | Metrics (per water season) | Refresh Rate (i.e. monthly)
--- | --- | --- | --- | ---
Rain (in) last rain event | County DAT files. Ex: LA Ducommun rain gauge | Average of USC and ducommun rain gauges  | Inches of rainfall | Based on each rain event
Total rain (in) this season  | County DAT files | Average of USC and ducommun rain gauges  | Inches of rainfall<br>For comparison benchmarking: Use 14.25” as average (www.ladwp.com/uwmp p. ES-7) | 
Historical rain data |  | Sum rainfall, group by month |  | 
% of water capture (project-specific progress) for water supply | LASAN/LADWP project lists with annual capacity<br>https://docs.google.com/spreadsheets/d/1yLuHomv9C0LjLreo3hhhQ0ez6I8TKRHuVSqDT4-na_w/edit?usp=sharing | Average of percentages per method given to us by DWP and LASAN | % Capture Designated for Water Supply | Static
Progress toward 150k acre ft/yr goal | Number of implemented projects; LASAN/LADWP project lists with annual specific yields | Volume captured / 150k acre ft | % towards 150k acre ft | Updated after each rainfall






