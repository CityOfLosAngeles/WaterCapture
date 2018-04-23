# Stormwater Capture 

This repository contains the scripts to automate the calculation of stormwater capture in Los Angeles in near-real time. 

Stormwater capture is a critical part of LA's Sustainable City pLAn. See more about how we approach water capture in the [Stormwater Capture Master Plan](https://ladwp.com/ladwp/faces/wcnav_externalId/a-w-stormwatercapturemp;jsessionid=QFlXh2YNQNXJL1q8vzNGD1p2W29z2MJNtQkQ93GgGH0Nn97TyTjK!-884017759?_afrLoop=472962967276728&_afrWindowMode=0&_afrWindowId=null#%40%3F_afrWindowId%3Dnull%26_afrLoop%3D472962967276728%26_afrWindowMode%3D0%26_adf.ctrl-state%3D1dgqoxr5b_4)

This script scrapes water capture capacity datasets from the City's open data portal as well as rain guages from LA County. It checks every hour for new precipitation data. When it rains, it writes a new row to this dataset: [Water Capture by Method](https://data.lacity.org/A-Livable-and-Sustainable-City/Water-Capture-by-Method/xe35-4wsy/data)
