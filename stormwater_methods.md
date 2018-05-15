# Stormwater application: methods (draft page)

The stormwater data were collected starting in April 2018. The methods were...


<table>
<colgroup>
	<col style="width: 20%">
	<col style="width: 20%">
	<col style="width: 20%">
	<col style="width: 20%">
	<col style="width: 20%">
</colgroup>

<tbody>
	<tr><th>Category</th><th>Relevant Socrata URL</th><th>Calculation for volume captured</th><th>Metrics (per water season)</th><th>Refresh Rate (i.e. monthly)</th></tr>
	<tr><td>Water Capture Total - All Methods</td><td>Water Capture by Method</td><td>Sum of water captured by method</td><td>Volume captured by method in acre ft; Water capture over time by month (starting with first month of launch) across all capture categories so color should be uniform; % capture designated for water supply</td><td>NA - automated</td></tr>
	<tr><td>Spreading Grounds</td><td>LA City Spreading Grounds Monthly Capture<br>Original source - LA County DPW Conserved water by year<br>Note that the City is concerned with the five facilities in the San Fernando Valley</td><td>None - taken directly from County reporting</td><td>Volume captured (total this season); number of current projects;<br>% capture designated for water supply: 100%</td><td>Monthly (previous month’s data comes out during following month)</td></tr>
	<tr><td>Rain Barrels and Cisterns</td><td>Rain Barrels and Cisterns Issued Through LADWP Rebate Program</td><td>Rainfall this season (see below) * latest rain barrel count * factor for capture per barrel</td><td>Volume captured (total this season); number of current projects;<br>% capture designated for water supply: 100%</td><td>Approximately real time/when it rains<br>Rain Barrels dataset updated monthly</td></tr>
	<tr><td>GSI</td><td>Green Streets Infrastructure Water Capture Capacity</td><td>Rainfall this season * drainage area (acres)</td><td>Volume captured (total this season); </td><td>Approximately real time/when it rains<br>GSI dataset updated as new projects are added (confirm with LASAN)</td></tr>
	<tr><td>GSI - Green Streets & Alleys</td><td>Green Streets Infrastructure Water Capture Capacity - column for Green Street / Alley</td><td>Same as above but filtered on column designating GSI type</td><td>Volume Green streets and alleys (total this season);</td><td>Approximately real time/when it rains<br>GSI dataset updated as new projects are added (confirm with LASAN)</td></tr>
	<tr><td>Incidental Capture</td><td>Incidental Capture Annual Yield</td><td>Annual yield (capacity) * rainfall so far this season divided by the average season rainfall </td><td>Volume captured (cumulative per rain season);</td><td>NA</td></tr>
	<tr><td colspan=5 align="center">**For high-level metrics**</td></tr>
	<tr><td>Rain (in) last rain event</td><td>County DAT files. Ex: LA Ducommun rain gauge</td><td>Average of USC and ducommun rain gauges </td><td>Inches of rainfall</td><td>Based on each rain event</td></tr>
	<tr><td>Total rain (in) this season </td><td>County DAT files</td><td>Average of USC and ducommun rain gauges </td><td>Inches of rainfall<br>For comparison benchmarking: Use 14.25” as average (www.ladwp.com/uwmp p. ES-7)</td><td></td></tr>
	<tr><td>Historical rain data</td><td></td><td>Sum rainfall, group by month</td><td></td><td></td></tr>
	<tr><td>% of water capture (project-specific progress) for water supply</td><td>LASAN/LADWP project lists with annual capacity<br>https://docs.google.com/spreadsheets/d/1yLuHomv9C0LjLreo3hhhQ0ez6I8TKRHuVSqDT4-na_w/edit?usp=sharing</td><td>Average of percentages per method given to us by DWP and LASAN</td><td>% Capture Designated for Water Supply</td><td>Static</td></tr>
	<tr><td>Progress toward 150k acre ft/yr goal</td><td>Number of implemented projects; LASAN/LADWP project lists with annual specific yields</td><td>Volume captured / 150k acre ft</td><td>% towards 150k acre ft</td><td>Updated after each rainfall</td></tr>
</tbody>
</table>





