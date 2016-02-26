---
layout: post
title: "Spatial Intro 00: Answer a Spatio-temporal Research Question with Data: Where to Start?"
date:   2015-10-30
authors: [Megan A. Jones, Leah A. Wasser]
contributors: [ ]
dateCreated: 2015-10-23
lastModified: 2016-02-23
packagesLibraries: [ ]
category: [self-paced-tutorial] 
tags: [R, spatial-data-gis]
mainTag: spatial-data-management-series
workshopSeries: [spatial-data-management-series]
description: "This lesson provides an overview of finding spatial data to support your research
question. It covers some of the key data sources and providers and places that you can look
to find data for your study are / research question."
code1: 00-spatio-temporal-science-questions.R
image:
  feature: NEONCarpentryHeader_2.png
  credit: A collaboration between the National Ecological Observatory Network (NEON) and Data Carpentry
  creditlink: 
permalink: R/spatio-temporal-research-questions
comments: true
---

{% include _toc.html %}

## About
This lesson provides an overview of finding spatial data to support your research
question. It covers some of the key data sources and providers and places that you can look
to find data for your study are / research question.

**R Skill Level:** Introduction - you've got the basics of `R` down.

<div id="objectives" markdown="1">

# Goals / Objectives

After completing this activity, you will:

* Understand at a high level some of the steps associated with identifying types 
of data we might need to answer a spatio-temporal research question. 
* Understand the overall science concept and associated data of the NEON / DC 
workshop series.
* Understand that one can work with data from different site to compare areas.

## Things You’ll Need To Complete This Lesson
To complete this lesson you will need the most current version of R, and 
preferably, RStudio loaded on your computer.

### Install R Packages

* **NAME:** `install.packages("NAME")`

* [More on Packages in R - Adapted from Software Carpentry.]({{site.baseurl}}R/Packages-In-R/)

### Download Data


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

### Additional Resources

</div>

<figure>
	<a href="https://xxxx">
	<img src="https://xxxx"></a>
	<figcaption> A nice overview graphic of the research topic, question and data needed to begin to address the question. ACTUAL GRAPHIC IN CONSTRUCTION
	Source: National Ecological Observatory Network (NEON)  
	</figcaption>
</figure>

## Answer Scientific Questions Using Data 
We often begin a research project with one or more questions that we would like 
to answer. Once we have a question, we identify the:

* Type of data needed to address the question.
* The spatial coverage required - location that the data should cover & spatial `extent`. 
* The required temporal coverage - time period that the data should span to properly 
address the question.

Once we have identified these things, we can determine what methods are 
needed to collect data needed to answer our question.


## Work With External Data
When our question requires data that are small in temporal and/or spatial scale, 
we can often collect the data needed to answer the question ourselves. When we
ask questions that cover larger spatial (e.g. regions to continents) and temporal 
scales, we often need to use
data collected by other labs, organizations, and agencies. We will refer to 
these data as **external data** - data that we have not collected ourselves. 

## Metadata - Data That Describe the Data
When working with external data, we need to understand metadata - the documentation 
associated with a dataset that helps us understand collection and processing methods, 
format and other key information including:

1. **What methods were used to collect and process the data**
in order to trust that it will be sufficient to answer our question.
2. **The format / how the data are stored** - what methods were used to indicate
missing data values and bad data values in order to process the data effectively and 
get accurate analysis results. 
3. If the data are explicedly spatial (e.g. "GIS" type data), then we need to 
**understand key spatial *metadata* ** to 
to properly process and visualize the data.

## About this Workshop Series
In the data-tutorials in this 
[NEON / Data Carpentry workshop series]({{ site.baseurl }}/tutorial-series/neon-dc-phenology-series/), 
we will learn important skills and concepts that support working with 
external spatio-temporal data including:

* Understanding metadata.
* Dealing with null and missing values.
* Importing and plotting time series data
* Working with and manipulating data/time formats.
* Importing and plotting raster data in `Geotiff` format.
* Importing and plotting vector (`shapefile` and `.csv` format) data.
shapefiles and raster data.
* Working with raster time series data.

### Programming Language
These lessons all focus on the `R` programming language although the conceptual
topics relate to all programming languages! 

## Research Question - Explore (Regional) Drivers and Patterns of Plant Phenology

Our science topic for all of the lessons in this series is plant phenology. Our 
goal is to:

1. Better understand (to quantify) both the timing
of when plants turn green (green-up) and die back / turn brown (brown-down).
2. To quantify two key drivers of this timing - precipitation and temperature and
visualize how / if trends observed in precipitation and temperature relate to trends
observed in greening and browning of vegetation.
3. Optionally - we'd like to understand how / if "1" and "2" above vary at different 
sites.

Our study area includes two National Ecological Observatory Network (NEON) field 
sites in the United States:

* **Site One:** <a href="http://www.neoninc.org/science-design/field-sites/harvard-forest" target="_blank">Harvard Forest </a> located in the northeastern United States - Massachusetts
* **Site Two:** the <a href="http://www.neoninc.org/science-design/field-sites/san-joaquin-experimental-range" target="_blank">San Joaquin Experimental Range </a> 
located in the southern end of the US state of California.  

Both sites are mapped below:



    ## OGR data source with driver: ESRI Shapefile 
    ## Source: "NEON-DS-Site-Layout-Files/US-Boundary-Layers", layer: "US-State-Boundaries-Census-2014"
    ## with 58 features
    ## It has 10 fields

    ## OGR data source with driver: ESRI Shapefile 
    ## Source: "NEON-DS-Site-Layout-Files/US-Boundary-Layers", layer: "US-Boundary-Dissolved-States"
    ## with 1 features
    ## It has 9 fields

![ ]({{ site.baseurl }}/images/rfigs/dc-spatio-temporal-intro/00-spatio-temporal-science-questions/Field-Site-Map-1.png) 


<i class="fa fa-star"></i> **Data Note:** These two sites are about 4,900km 
(3,000 miles) apart! Do we expect to see differences in the timing of greening 
and browning of plants (phenophase timing) between the two sites? If there are 
differences, what is causing them?
{: .notice}

### Workshop Science Goals

Our goal is to create plots of temperature, precipitation and the patterns of 
phenology - specifically the greening and 
browning of plants - for one year (2011), over two NEON field sites. To 
achieve this goal we need data that:

1. Cover the same time periods - temporal data *(year=2011)*.
2. Are for the same spatial locations *(our two field sites)*.
3. Are collected using similar methods so they are comparable at our two field 
sites that are located 3,000+ miles apart!


<figure>
	<a href="https://xxxx">
	<img src="https://xxxx"></a>
	<figcaption> Plot of NDVI that colin made with the vegetation below and the plot above
	Source: National Ecological Observatory Network (NEON)  
	</figcaption>
</figure>





<div id="challenge" markdown="1">
## Challenge: Breaking Down a Large Research Question

Discuss with your neighbor / colleague - what are some potential sources of data that might 
be useful to address our phenology question? How would you go about finding these
data?

</div>




## Break Down Our Project

One way to tackle our research project, is to break it down
into smaller pieces. We can identify that types of data that we might need. 
We'd like to do the following:

* **Map / plot phenophase timing at both sites:** We will need data that quantify 
degree of greenness at both sites. Where can we get that and how do we process it
to plot greenness at both sites?
* **Understand our field sites:** How big are the sites? How dense is the vegetation? 
Where are the field sites located? Are the sites accessible by roads or difficult to 
get to? We also might want to create a map of our study 
sites for a future publication. To understand our sites we will need data that 
"map" vegetation cover and show road locations and boundaries.
* **Plots of temperature and precipitation:** (the drivers of phenophase timing) at 
both sites for the same *TEMPORAL* duration as our greenness data.

## A Spatio-Temporal Approach 

### Find Phenology Data

Where do we start to find data that quantifies the timing of plant greening and browning?
We could go outside and monitor individual plants, and write down in field 
notebooks when they turn green and brown. However, in this case, we can't monitor 
enough plants 
over a large enough area by ourselves to quantify greening and browning of 
entire forests or grasslands at multiple sites. To answer our specific question 
at a regional scale, we need 
data that can measure these events over larger areas.

<iframe width="560" height="315" src="https://www.youtube.com/embed/_4uHLXL1yZA" frameborder="0" allowfullscreen></iframe>

****

One way we can measure phenology over larger areas is to use 
<a href="http://phenology.cr.usgs.gov/index.php" target="_blank">Remote Sensing imagery
</a> - data collected using 
high fidelity cameras mounted on satelites and airplanes. Satellites continuously orbit the earth
capturing images of the earth's surface- continuouslly. 

The Landsat sensor, captures images of the same area, every 16 days which makes 
it a very powerful spatio-temporal data source. Because the data are collected from
space they cover a larger area. Because the data are collected using
the same "camera", the data can be easily compared across sites and through time. 


#### Mapping the Invisible: Introduction to Spectral Remote Sensing
<iframe width="560" height="315" src="https://www.youtube.com/embed/3iaFzafWJQE" frameborder="0" allowfullscreen></iframe> 
Watch the video above to learn more about how high fidelity remote sensing cameras 
work.
****

<figure>
	<a href="{{ site.baseurl }}/images/dc-spatio-temporal-intro/NDVI-Landsat-RS.png">
	<img src="{{ site.baseurl }}/images/dc-spatio-temporal-intro/NDVI-Landsat-RS.png"></a>
	<figcaption> Remote Sensing data can be used to measure the greening and browning
	of plants over larger areas. Because these data are often collected repeatedly
	using satellites orbiting the earth, it provides a nice time series to use for many
	research questions.
	Source: Landsat data downloaded by the National Ecological Observatory Network (NEON)  
	</figcaption>
</figure>

<i class="fa fa-star"></i> **Data Note:** <a href="http://phenocam.sr.unh.edu/webcam/" target="_blank">Phenocam data </a>are another source of phenology 
data at the site scale. Phenocams are often mounted on towers
and capture repeat photography of vegetation each day. Learn more about the 
<a href="http://budburst.org/what-is-phenocam"phenocam Citizen Science collaboration
 - Season Spotter</a>.
{: .notice}


### NDVI Measures Plant Greenness

We can use remote sensing imagery to
derive the Normalized Difference Vegetation Index (NDVI), a quantitative index
that measures how "green" or healthy vegetation is on the ground. NDVI greenness 
values ranging from 0-1 where 0 represents minimal or no greenness
and 1 represents maximum greenness. NDVI is an ideal data product to use to estimate
the timing of plant "green-up" and "brown-down" over large areas.

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


<i class="fa fa-star"></i> **Data Note:** NDVI can be calculated using any image
that contains a near-infrared band. Some phenocams capture near-infrared light.
{: .notice}

## Find Remote Sensing Data 

There are many sources that allow you to request and freely download remote sensing 
imagery and products like NDVI. In the United States, one popular data provider is the United States 
Geological Survey.

* <a href="http://phenology.cr.usgs.gov/get_data_main.php" target="_blank">Remote Sensing Phenology</a>
* <a href="http://glovis.usgs.gov/" target="_blank">USGS GLOVIS</a>
* <a href="http://landsatlook.usgs.gov/" target="_blank">Landsat Look Viewer</a>
* <a href="http://landsat.gsfc.nasa.gov/" target="_blank">NASA Landsat</a>

## Landsat Look Viewer

<div id="challenge" markdown="1">

## Challenge: Explore Landsat Look Website

Visit the <a href="http://landsatlook.usgs.gov/" target="_blank">Landsat Look Viewer
website</a>. Search for an location - for example `Harvard Forest, Massachusetts, 
United States`. 

</div>



### Raster Data Format - Work With Remote Sensing Imagery 

Remote sensing images are in **raster** format. They are composed of pixels - just like
the pixels in the images we take with our camera phones. To work with raster data 
in R, we can use the <a href="https://cran.r-project.org/web/packages/raster/index.html" target="_blank">`raster` package. </a>

Because we are studying phenophase timing, we need raster data collected 
repeatedly through time to identify when groups of plants green-up and brown down.
We can use the <a href="https://cran.r-project.org/web/packages/rasterVis/index.html" target="_blank"> `rasterVis` package in `R` </a> efficiently plot raster time
series.

NOTE: We will cover working with raster data in R, in the [raster time series 
lessons]({{ site.baseurl }}/tutorial-series/raster-data-series/)

<figure>
	<a href="https://xxxx">
	<img src="http://data-lessons.github.io/NEON-R-Spatial-Raster//images/dc-spatial-raster/raster_concept.png"></a>
	<figcaption> CHANGE URL TO DATA SKILLS
	Source: National Ecological Observatory Network (NEON)  
	</figcaption>
</figure>

### Find Temperature and Precipitation Data

As a part of our research project, we also would like to plot two drivers of 
green-up and brown-down phenophase stages - 
temperature and precipitation. Precipitation and temperature are 
recorded at weather stations across the globe. Many research and long term 
monitoring stations have towers with sensors mounted on them that collect high 
frequency (many measurements a second or minute) measurements of variables 
including temperature, precipitation, light intensity, wind speed and more.

Some sources of climatic data include:

* **NEON: National Ecological Observatory Network (NEON)**<a href="http://www.neoninc.org/science-design/collection-methods/flux-tower-measurements" target="_blank">
will have flux towers, that measure temperature, precipitation, wind speed, 
light intensity and more  at its field sites located across the United States</a> 
Data can be downloaded from the <a href="http://data.neoninc.org/browse-data?showTheme=atmos" target="_blank">
NEON data portal </a>. 
* **FluxNet:** <a href="http://fluxnet.ornl.gov" target="_blank">
a network of towers located around the world</a>. 
* **NOAA National Center for Environmental Information (formerly National Climatic Data Center):**
<a href="http://www.ncdc.noaa.gov/data-access/land-based-station-data> weather stations maintained by NOAA</a> 
and 
<a href="http://www.ncdc.noaa.gov/" target="_blank"> general network information </a>. 

* **<a href="https://portal.lternet.edu/nis/home.jsp" target="_blank">Long Term Ecological Research sites (LTER):</a>** Many LTER sites have 
micrometerology towers that collect climatic data.

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

### Climate Data At Our Field Sites

If we want climatic data for our field sites, there are several places that 
we can start. In our case, Harvard forest is a LTER site, so we can hope for a
micrometerology tower that contains temperature and precipitation sensors. 
Visiting the <a href="http://harvardforest.fas.harvard.edu/data-archives" target="_blank">
Harvard Forest research station home page</a>, we learn that it has
a flux tower that has been collecting data since 2001. Better yet, the data are
freely available for download. 

<i class="fa fa-star"></i> **Data Note:** Also take note that there are some other data 
resources on this page including "GIS" data. Many research stations (not all) 
have these types of data available.
{: .notice}

### Micro-meteorological Data from the Fisher Tower
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
## Explore the metadata for harvard forest. What is available??
* what other data are available for harvard forest?
* look at meatadata - note there are years of data
* what format are the data in?

</div>




### Work With Time Series Data in R
These data are available for download in text of Comma Separated Value (`.csv`)
format. To work with these data in `R`, we will need to understand how to work 
with date and time formats. We will cover these skills in the *Tabular Time Series*
portion of the workshop. 

[The tabular time series tutorials]({{ site.baseurl }}/tutorial-series/tabular-time-series/) cover how to import time series data in
`.csv` format into `R` and how to work with, subset and plot `date/time` formats.

## Data to Characterize our Study Site

It is often useful to create maps that characterize our field sites. These maps
are useful tools to get to know a sites:

* Topography (elevation)
* Vegetation height and cover
* Layout including roads, and other infrastructure.

These maps are integral to plan site visits and plot locations before we visit it.
They are also important for sites that are too far away or  spread out, 
 to visit. Maps are also useful for publications to describe our 
field sites.
 
### Maps of Topography & Vegetation Cover - LiDAR

If it is available, Light Detection and Ranging Data (LiDAR) data provide 
high resolution, accurate topography (elevation), vegetation cover and 
structure (density and height) information. They can also be used to find the 
location of roads and streams. Often
research stations will have digital elevation models (DEM) and Canopy Height Models
(CHM) that map elevation and vegetation height respectively. 

<iframe width="560" height="315" src="https://www.youtube.com/embed/videoseries?list=PLLWiknuNGd50GI8OZf3EBo6PMx04xcoFa" frameborder="0" allowfullscreen></iframe>

### LiDAR Resources 

* [Learn more about LiDAR]({{ site.baseurl }}/remote-sensing/1_About-LiDAR-Data-Light-Detection-and-Ranging_Activity1/)
( [Learn more about LiDAR canopy height and digital elevation models]({{ site.baseurl }}emote-sensing/2_LiDAR-Data-Concepts_Activity2/))
* <a href="http://www.opentopography.org/" target="_blank">Open Topography - a great
source of free LiDAR data in the US.</a>
* <a href="http://earthexplorer.usgs.gov/" target="_blank">Get LiDAR data from
the USGS</a> )


<i class="fa fa-star"></i> **Data Note:** In the United States, state-wide data 
are often also available locally. State GIS offices are often a good source of
information and sometimes have online repositories to access the data.
{: .notice}

#### NEON Airborne Observation Platform (AOP)
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



### Site Infrastructure - Roads, Streams

It is also often useful to map infrastructure on a site including roads, 
streams, buildings and other landmarks. Road, building and stream data are often 
found in shapefile format ( `.shp`) which is a vector format
that is read by most *GIS* programs. We will discuss this file format further in 
a followup lesson.

#### Work With Vector Data
To work with vector data in `R`, we can use the `RGDAL` package combined with `raster`
and `sp`. We will cover this in the (Introduction to Working With Vector Data in R)[{{site.baseurl}}/tutorial-series/vector-data-series/].


<div id="challenge" markdown="1">


</div>




## Summary: Data Used In This Workshop Series
In this workshop series series we will use the following data to explore the drivers of
patterns of vegetation phenology (greening and browning ) across multiple sites.

* Landsat-derived NDVI Data 
* Light Detection and Ranging Data (LiDAR)
* Vector Data

 

## Resources for Locating Spatial and Ecological Data

* <a href="http://www.dataone.org/find-data" target="_blank"> DataOne</a>: Brief description
* <a href="http://www.data.gov/" target="_blank"> US Federal data (data.gov)</a>: This is the clearing-house for all types of US Federal data. 
* <a href="http://www.geoplatform.gov/" target="_blank"> US Federal spatial data</a>: Brief description
* <a href="http://www.data.ny.gov/" target="_blank"> New York state government data</a>: Many states have their own data portal.  Simply search for the state name and  "data portal" to find most of the repositories. 
* <a href="http://www.ecologicaldata.org" target="_blank"> DataOne</a> : Brief description

## Phenology Data Sources 

* NEON
* National Phenology Network
* Phenocam
* others??

## Sources of Remote Sensing Data

***





