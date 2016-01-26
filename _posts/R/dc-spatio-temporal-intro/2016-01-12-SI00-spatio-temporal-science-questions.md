---
layout: post
title: "Lesson 00: Answer a Spatio-temporal Research Question with Data: Where to Start?"
date:   2015-10-30
authors: [Megan A. Jones, Leah A. Wasser]
contributors: [ ]
dateCreated: 2015-10-23
lastModified: 2016-01-25
packagesLibraries: [ ]
category: [self-paced-tutorial] 
tags: [R, gis-spatial-sata]
mainTag: spatial-data-management-series
workshopSeries: [spatial-data-management-series]
description: "This lesson provides an overview of finding spatial data to support your research
question. It covers some of the key data sources and providers and places that you can look
to find data for your study are / research question."
code1: 00-spatio-temporal-science-questions.R
image:
  feature: NEONCarpentryHeader_2.png
  credit: A collaboration between the National Ecological Observatory Network (NEON) and Data Carpentry
  creditlink: http://www.neoninc.org
permalink: R/spatio-temporal-research-questions
comments: false
---

{% include _toc.html %}

##About
Add description.

**R Skill Level:** Intermediate - you've got the basics of `R` down.

<div id="objectives" markdown="1">

#Goals / Objectives

After completing this activity, you will:

* Know the definition of spatial data.
* Understand that one can work with data from different time points for the same
  area (e.g., you can ask question over time using spatial data).
* Understand that one can work with data from different site to compare areas.
* Know how scientific questions can help in selection of a field site. 

##Things You’ll Need To Complete This Lesson
To complete this lesson you will need the most current version of R, and 
preferably, RStudio loaded on your computer.

###Install R Packages

* **NAME:** `install.packages("NAME")`

* [More on Packages in R - Adapted from Software Carpentry.]({{site.baseurl}}R/Packages-In-R/)

###Download Data


****

{% include/_greyBox-wd-rscript.html %}

**Spatial-Temporal Data & Data Management Lesson Series:** This lesson is part of a lesson series introducing
[spatial data and data management in `R` ]({{ site.baseurl }}tutorial/URL).
It is also part of a larger 
[spatio-temporal Data Carpentry Workshop ]({{ site.baseurl }}workshops/spatio-temporal-workshop)
that includes working with  
[raster data in `R` ]({{ site.baseurl }}tutorial/spatial-raster-series),
[vector data in `R` ]({{ site.baseurl }}tutorial/spatial-vector-series)
and  
[tabular time series in `R` ]({{ site.baseurl }}tutorial/tabular-time-series).

****

###Additional Resources

</div>

<figure>
	<a href="https://xxxx">
	<img src="https://xxxx"></a>
	<figcaption> A nice overview graphic of the research topic, question and data needed to begin to address the question. ACTUAL GRAPHIC IN CONSTRUCTION
	Source: National Ecological Observatory Network (NEON)  
	</figcaption>
</figure>

##Answer Scientific Questions Using Data 
We often begin a research project with one or more questions that we would like 
to answer. Once we have a question, we identify the:

* Type of data
* The spatial coverage - location that the data should cover & spatial `extent` 
* The required temporal coverage - time period that the data should span to properly 
address the question.

Once we have identified the data required, we can determine what methods are 
needed to collect that information need to answer our question.

When our question requires data that are small in temporal and/or spatial scale, 
we can often collect the data needed to answer the question ourselves. When we
ask questions that cover larger spatial (e.g. regions to continents) and temporal 
scales, we often need to use
data collected by other labs, organizations, and agencies. We will refer to 
these data as “external data” - data that we have not collected ourselves. 

##Work With External Data
Working with external data can require skills that are different from data that
we collect ourselves:

1. We need to figure out what methods were used to collect and process the data
in order to trust that it will be sufficient to answer our question.
2. We need to understand how the data are stored, what methods were used to indicate
missing data values and bad data values in order to process the data effectively and 
get accurate analysis results. 
3. If the data are explicedly spatial (e.g. "GIS" type data), then we need to 
understand key spatial *metadata* to 
to properly process and visualize the data.

When working with external data, we need to understand metadata - the documentation 
associated with a dataset that helps us understand collection and processing methods, 
format and other key information. 

In this workshop series <<LINK TO OVERALL WORKSHOP LANDING PAGE>>, we will learn
some of the important skills needed to work with external spatio-temporal data 
including:

* Understanding metadata
* Dealing with null and missing values
* Importing and plotting time series data including dealing with data/time formats
* Importing and plotting spatial data in various formats formats - specifically
shapefiles and raster data

##Research Question - Explore (Regional) Drivers and Patterns of Plant Phenology

Our science topic for all of the lessons in this series is plant phenology. Our goal:
to 

1. Better understand (to quantify) both the timing
of when plants turn green (green-up) and die back / turn brown (brown-down)
2. To quantify two key drivers of this timing - precipitation and temperature

at two National Ecological Observatory Network (NEON) field sites in the United 
States:

* Site One: <a href="http://www.neoninc.org/science-design/field-sites/harvard-forest" target="_blank">Harvard Forest </a> located in the northeastern United States - Massachusetts
* Site Two: the <a href="http://www.neoninc.org/science-design/field-sites/san-joaquin-experimental-range" target="_blank">San Joaquin Experimental Range </a> located in the southern end of the US state
of California.  

<i class="fa fa-star"></i> **Data Note:** These two sites are about 4,900km 
(3,000 miles) apart! Do we expect to see differences in the timing of greening 
and browning of plants (phenophase timing) between the two sites? If there are 
differences, what is causing them?
{: .notice}

#MAP OF USA w/ the two sites. 

Our goal is to create plots of temperature, precipitations and the greening and 
browning of plants at - for one year (2011), for two sites. To achieve this goal 
we need data that:

1. Cover the same time periods - temporal data *(year=2011)*
2. Are for the same spatial locations *(our two field sites)*
3. Are collected using similar methods so they are comparable at our two field 
sites that are located 3000+ miles apart!


<figure>
	<a href="https://xxxx">
	<img src="https://xxxx"></a>
	<figcaption> Plot of NDVI that colin made with the vegetation below and the plot above
	Source: National Ecological Observatory Network (NEON)  
	</figcaption>
</figure>

#GRAPHIC NEEDED - REMOTE SENSING IMAGE SHOWING THIS PATTERN?



<div id="challenge" markdown="1">
##Challenge: Breaking Down a Large Research Quesion

* What are some potential sources of data that might be useful to address our 
phenology question?

</div>

##Break Down Our Project

One way to tackle our research project, is to break down this larger question
into smaller pieces to help identify that types of data that we might need to work
with. We'd like to do the following:

* Understand our field sites: How big are the sites? How dense is the vegetation? 
Where are the field sites located? Are the sites accessible by roads or difficult to 
get to? We also might want to create a map of our study 
sites for a future publication. To understand our sites we will need data that 
"map" vegetation cover and show road locations and boundaries.
* Map / plot phenophase timing at both sites - We will need Data that quantify 
degree of greenness at both sites
* Plots of temperature and precipitation (the drivers of phenophase timing) at 
both sites for the same *TEMPORAL* duration as our greenness data.

##A Spatio-Temporal Approach 

###Finding Phenology Data

So where do we start to quantify the timing of plant greening and browning?
We could go outside and monitor individual plants, and write down in field 
notebooks when they turn green and brown. However we can't monitor enough plants 
by ourselves to quantify greening and browning of entire forests or grasslands 
at multiple sites. To answer our specific question at a regional scale, we need 
data that can measure these events over larger areas.

<iframe width="560" height="315" src="https://www.youtube.com/embed/_4uHLXL1yZA" frameborder="0" allowfullscreen></iframe>

****

One way we can measure phenology over larger areas is to use 
<a href="http://phenology.cr.usgs.gov/index.php" target="_blank">Remote Sensing imagery
</a> - data collected using 
high fidelity cameras mounted on satelites and airplanes. Satellites continuously orbit the earth
capturing images of the earth's surface- continuouslly. The Landsat sensor, can 
capture images of the same area, every 16 days which makes it a very powerful spatio-temporal
data source. Because the data are collected from
space or an airplane they cover a larger area. Because the data are collected using
the same "camera", the data can be easily compared across sites and through time. 


####Mapping the Invisible: Introduciton to Spectral Remote Sensing
<iframe width="560" height="315" src="https://www.youtube.com/embed/3iaFzafWJQE" frameborder="0" allowfullscreen></iframe> 
Watch the video above to learn more about how remote sensing cameras work.
****

<figure>
	<a href="https://xxxx">
	<img src=""></a>
	<figcaption> RASTER TIME SERIES IMAGE
	Source: National Ecological Observatory Network (NEON)  
	</figcaption>
</figure>


<i class="fa fa-star"></i> **Data Note:** Another excellent source of phenology 
data at the site scale is <a href="http://phenocam.sr.unh.edu/webcam/" target="_blank">
phenocam data</a>. Phenocams are often mounted on towers
and capture repeat photography of vegetation each day. Learn more about the 
<a href="http://budburst.org/what-is-phenocam"phenocam Citizen Science collaboration
 - Season Spotter</a>.
{: .notice}


###NDVI Measures Plant Greenness

We can derive the Normalized Difference Vegetation Index (NDVI), a quantitative index that can
that measures how "green" or healthy vegetation is on the ground. NDVI is a quantitative
index of greenness ranging from 0-1 where 0 represents minimal or no greenness
and 1 represents maximum greenness. NDVI is often used for a quantitative proxy 
measure of vegetation health, cover and phenology (life cycle stage) over large areas.

<figure>
 <a href="http://earthobservatory.nasa.gov/Features/MeasuringVegetation/Images/ndvi_example.jpg"> 
 <img src="http://earthobservatory.nasa.gov/Features/MeasuringVegetation/Images/ndvi_example.jpg"></a>
    <figcaption>NDVI is calculated from the visible and near-infrared light
    reflected by vegetation. Healthy vegetation (left) absorbs most of the
    visible light that hits it, and reflects a large portion of
    near-infrared light. Unhealthy or sparse vegetation (right) reflects more
    visible light and less near-infrared light. Image & Caption Source: NASA 
    </figcaption>
</figure>

* <a href="http://earthobservatory.nasa.gov/Features/MeasuringVegetation/measuring_vegetation_2.php" target="_blank">
More on NDVI from NASA</a>

##Find Remote Sensing Data 

There are many sources that allow you to request and freely download remote sensing 
imagery and products like NDVI. In the United States, one popular data provider is the United States 
Geological Survey.

* <a href="http://phenology.cr.usgs.gov/get_data_main.php" target="_blank">Remote Sensing Phenology</a>
* <a href="http://glovis.usgs.gov/" target="_blank">USGS GLOVIS</a>
* <a href="http://landsatlook.usgs.gov/" target="_blank">Landsat Look Viewer</a>
* <a href="http://landsat.gsfc.nasa.gov/" target="_blank">NASA Landsat</a>

#ISSUE: ** need to find sources globally -- 

<<Challenge - explore the landsat look tool>>

### Raster Data Format - Work With Remote Sensing Imagery 

Remote sensing images are in **raster** format. They are composed of pixels - just like
the pixels in the images we take with our camera phones. To work with raster data 
in R, we need the following:

* The `raster` package <<link>>
* To understand coordinate reference systems / map projections (the earth is round
so the data need to be "flattened" when we visualize them on a screen or paper or
when we process them)

Because we are studying phenophase timing, we need raster data collected 
repeateldly through time to identify when groups of plants green-up and brown down.
We can use the `rasterVis` package in `R` to more efficiently plot raster time
series.

#We will cover working with raster data in R, in the raster time series lessons 
<<LINK to the workshop landing page>>




##Landsat Look Viewer

<div id="challenge" markdown="1">

##Challenge: Thinking Spatially

* Explore landsat data on the landsat look site??
* See how to download it?
</div>




###Find Temperature and Precipitation Data

We would like to plot two drivers of green-up and brown-down phenophase stages - 
temperature and precipitation to support our research project. These metrics are 
recorded at weather stations across the globe. Many research and long term 
monitoring stations have towers with sensors mounted on them that collect high 
frequency (many measurements a second or minute) measurements of variables 
including temperature, precipitation, light intensity, wind speed and more.

Some sources of climatic data include:

* NEON: National Ecological Observatory Network (NEON)<a href="http://www.neoninc.org/science-design/collection-methods/flux-tower-measurements" target="_blank">
will have flux towers, that measure temperature, precipitation, wind speed, 
light intensity and more  at its field sites located across the United States</a> 
Data can be downloaded from the <a href="http://data.neoninc.org/browse-data?showTheme=atmos" target="_blank">
NEON data portal </a>. 
* FluxNet: <a href="http://fluxnet.ornl.gov/site_status" target="_blank">
what data is available at different sites </a> 
and 
<a href="http://fluxnet.ornl.gov/" target="_blank">
general network information </a>. 
* NOAA National Center for Environmental Information (formerly National Climatic Data Center):
<a href="http://www.ncdc.noaa.gov/data-access/land-based-station-data> information on land-based weather stations </a> 
and 
<a href="http://www.ncdc.noaa.gov/" target="_blank"> general network information </a>. 

#* LTER: Many LTER sites have towers..

<figure>
  <a href="https://farm6.staticflickr.com/5146/5666008904_85a10f5848_b.jpg">
	<img src="https://farm6.staticflickr.com/5146/5666008904_85a10f5848_b.jpg">
	</a>
	<figcaption>A flux tower located at the NEON Field Site in Sterling, Colorado (U.S.A.).
	Flux towers have sensors mounted on different heights on the tower that collect
	a suite of metrics including temperature, wind speed and often precipitation.
	These sensors collect data at high frequencies - which sometimes means many 
	measurements per second.
	Source: National Ecological Observatory Network (NEON)</figcaption>
</figure> 

###Climatic Data At Our Field Sites

Visiting the <a href="http://harvardforest.fas.harvard.edu/data-archives" target="_blank">
Harvard Forest research station home page</a>, we learn that it has
a flux tower that has been collecting data since 2001. Better yet, the data are
freely available for download. 

<i class="fa fa-star"></i> **Data Note:** Also take note that there are some other data 
resources on this page including "GIS" data. 
{: .notice}

###Micro-meteorological Data from the Fisher Tower
The 
<a href="http://harvardforest.fas.harvard.edu/meteorological-hydrological-stations" target="_blank"> Harvard Forest Fisher Meteorological Station </a> 
has been operational since 2001. It is located in an open field and records air
temperature, relative humidity, precipitation, incoming and net radiation,
barometric pressure, wind speed and direction, and soil temperature. Data is
recorded at 15-minute and daily intervals.


 <figure class="half">
   		<a href="http://harvardforest.fas.harvard.edu/sites/harvardforest.fas.harvard.edu/files/metsta-fall.jpg">
	<img src="http://harvardforest.fas.harvard.edu/sites/harvardforest.fas.harvard.edu/files/metsta-fall.jpg">
	</a>
   		<a href="http://harvardforest.fas.harvard.edu/sites/harvardforest.fas.harvard.edu/files/metsta-winter.jpg">
	<img src="http://harvardforest.fas.harvard.edu/sites/harvardforest.fas.harvard.edu/files/metsta-winter.jpg">
	</a>
	<figcaption>The Fischer Meteorological Station in two seasons. Source: Harvard Forest</figcaption>
</figure>   


<div id="challenge" markdown="1">
##explore the metadata for harvard forest. What is available??
* what other data are available for harvard forest?
* look at meatadata - note there are years of data
* what format are the data in?

</div>




###Work With Time Series Data in R
These data are available for download in text of Comma Separated Value (`.csv`)
format. To work with these data in `R`, we will need to understand how to work 
with date and time formats. We will cover these skills in the *Tabular Time Series*
portion of the workshop. 

#link to time series lessons.

##Data to Characterize our Study Site

It is often useful to create maps that characterize our field site. These maps
are useful tools to get to know a site before we visit it / or in the case of sites
that are far away to spread out, that we can't necessarily
 visit. Maps are also useful for publications where we describe our field sites.
 
###Maps of Topography & Vegetation Cover - LiDAR

If it is available, Light Detection and Ranging Data (LiDAR) is useful for high
resolution, accurate maps
field site topography, vegetation cover and structure (density and height). Often
research stations will have digital elevation models (DEM) and Canopy Height Models
(CHM) that map elevation and vegetation height respectively. These data are most
often in raster format.

<iframe width="560" height="315" src="https://www.youtube.com/embed/videoseries?list=PLLWiknuNGd50GI8OZf3EBo6PMx04xcoFa" frameborder="0" allowfullscreen></iframe>

###LiDAR Resources 
#link: more on lidar data products - CHM, DEM, etc...
* Other sources of lidar data - Open Topography
* national Map (Formerly USGS CLICK )

note: often data are available - check with state GIS offices for site specific data..

####NEON Airborne Observation Platform (AOP)
The
<a href="http://www.neoninc.org/science-design/collection-methods/airborne-remote-sensing" target="_blank"> NEON airborne observation platform </a>
(AOP) collects annual remote sensing data over NEON field sites using sensors
mounted
on an airplane. The AOP consists of a hyperspectral imaging spectrometer, a full
waveform and discrete return LiDAR, and a high-resolution Red Blue Green (RGB)
camera. Data from the AOP build a robust time series of landscape-scale changes
in numerous physical, biological and biochemical metrics, such as vegetation
cover and density, canopy chemistry, and topography, including elevation, slope
and aspect.

IMAGE OF THE PLANE?  NONE ON THE WEBSITE ARE VERY GOOD AT CAPTURING THE WHOLE
IDEA?

###Site Infrastructure - Roads, Streams

It is also often useful to identify infrastructure on a site including roads, 
streams, buildings and other landmarks. This helps us better understand access
issues. These maps are also useful for publication to both show readers where the study
area is located and to highlight important characteristics. 
These data are often in shapefile format ( `.shp`) which is a vector format
that is read by most *GIS* programs. 

####Work With Vector Data
To work with vector data in `R`, we can use the `RGDAL` package combined with `raster`
and `sp`. We will cover this in the *Vector Data in R Tutorial Series*.
#ADD LINK TO VECTOR DATA LANDING PAGE


<div id="challenge" markdown="1">
##Sources of Vector Data (infrastructure)
**more

</div>




##Summary: Data Used In This Workshop Series
In this workshop series series we will use the following data to explore the drivers of
patterns of vegetation phenology (greening and browning ) across multiple sites.

* Landsat-derived NDVI Data 
* Light Detection and Ranging Data (LiDAR)
* Vector Data

 

##Resources for Locating Spatial and Ecological Data

* <a href="http://www.dataone.org/find-data" target="_blank"> DataOne</a>: Brief description
* <a href="http://www.data.gov/" target="_blank"> US Federal data (data.gov)</a>: This is the clearing-house for all types of US Federal data. 
* <a href="http://www.geoplatform.gov/" target="_blank"> US Federal spatial data</a>: Brief description
* <a href="http://www.data.ny.gov/" target="_blank"> New York state government data</a>: Many states have their own data portal.  Simply search for the state name and  "data portal" to find most of the repositories. 
* <a href="http://www.ecologicaldata.org" target="_blank"> DataOne</a> : Brief description

#Other Sources of Remote Sensing Data

***

Our revised research question is now, *What causes the pattern of phenophase*
*timing at two different sites in the US?* Our question now has two components:

* a **temporal** component -- We will need data collected across time because
the timing of phenophases (when vegetation begins growth (turns green) or
senesces/ dies back (turns brown)) occurs throughout the annual cycle.  
* a **spatial** component -- We would like to explore this pattern across one
site and then potentially compare these patterns to those observed at another
site. 




##Insight from Comparisons

###across sites to see patterns.

###across time points to see patterns



Remote sensing images are in **raster** - they are composed of pixels - just like
the pixels in the images we take with our camera phones. Each pixel represents 
an area of land . Raster or “gridded” data are saved on a regular grid which is rendered on a map as pixels. Each pixel contains a value that represents an area on the Earth’s surface.

<figure>
	<a href="https://xxxx">
	<img src="http://data-lessons.github.io/NEON-R-Spatial-Raster//images/dc-spatial-raster/raster_concept.png"></a>
	<figcaption> CHANGE URL TO DATA SKILLS
	Source: National Ecological Observatory Network (NEON)  
	</figcaption>
</figure>

Given each pixel represents an area on the earth's surface, raster data are 
explicetedly spatial. To work with raster data in R, we need the following:

* The raster package <<link>>
* To understand coordinate reference systems / map projections (the earth is round
so the data need to be "flattened" when we visualize them on a screen or paper or
when we process them)

Because we are studying phenophase timing, we need raster data collected 
repeateldly through time to identify when groups of plants green-up and brown down.
We can use the `rasterVis` package in `R` to more efficiently plot raster time
series.
