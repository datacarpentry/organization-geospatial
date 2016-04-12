---
layout: post
title: "Spatial Intro 00: Answer a Spatio-temporal Research Question with Data - Where to Start?"
date:   2015-10-30
authors: [Megan A. Jones, Leah A. Wasser]
contributors: [ ]
dateCreated: 2015-10-23
lastModified: 2016-03-11
packagesLibraries: [ ]
category: [self-paced-tutorial] 
tags: [R, spatial-data-gis]
mainTag: spatial-data-management-series
workshopSeries: [spatial-data-management-series]
description: "This tutorial provides an overview of finding spatial data to 
support a research question. It covers some of the key data sources, 
providers and places that one can use to find data."
code1: /R/dc-spatio-temporal-intro/00-spatio-temporal-science-questions.R
image:
  feature: NEONCarpentryHeader_2.png
  credit: A collaboration between the National Ecological Observatory Network (NEON) and Data Carpentry
  creditlink: 
permalink: /R/spatio-temporal-research-questions
comments: true
---

{% include _toc.html %}

This tutorial provides an overview of finding spatial data to support your 
research question. It covers some of the key data sources, providers and 
places that you can look to find data for your study are / research question.

**Skill Level:** This tutorial provides conceptual background for the NEON / Data Carpentry 
spatio-temporal tutorial series. The concepts outlined int his tutorial, relate to many other
programming languages and data types! 

<div id="objectives" markdown="1">

# Goals / Objectives

After completing this activity, you will:

* Understand the general process of identifying types of data we might need to 
answer a spatio-temporal research question. 
* Understand the overall science concept and associated data of the NEON / DC 
[Work with Spatio-temporal Data in R series](http://neondataskills.org/tutorial-series/neon-dc-phenology-series/).
* Understand that one can work with data from different sites to compare areas.

****

{% include/_greyBox-wd-rscript.html %}

</div>

<figure>
	<a href="https://xxxx">
	<img src="https://xxxx"></a>
	<figcaption> OVERVIEW GRAPHIC UNDER CONSTRUCTION. 
	The process of answering a research question begins with deciding 
	what data are needed and finding/collecting the metadata needed to understand 
	and work with the data. Once this is decided we can then decide on what tools/
	program we want to work with to manipulate, visualize, and analyze our data to
	answer our questions. Source: National Ecological Observatory Network (NEON)  
	</figcaption>
</figure>

## Answer Scientific Questions Using Data 

We often begin a research project with one or more questions that we would like 
to answer. Once we have a question, we identify the:

* Type of data needed to address the question.
* The spatial coverage required - location that the data should cover & spatial
extent. 
* The required temporal coverage - time period that the data should span to 
properly address the question.

Once we have identified these things, we can determine what methods are 
needed to collect data needed to answer our question.

## Work With External Data

When our question requires data that are small in temporal and/or spatial scale, 
we can often collect the data needed to answer the question ourselves. When we
ask questions that cover larger spatial (e.g. regions to continents) and 
temporal scales, we often need to use data collected by other labs, 
organizations, and agencies. We refer to these data as **external data** - data 
that we have not collected ourselves. 

## Metadata - Data That Describe the Data

When working with external data, we need to understand metadata - the 
documentation associated with a dataset that helps us understand collection and 
processing methods, format and other key information including:

1. **What methods were used to collect and process the data**
in order to trust that it will be sufficient to answer our question.
2. **In what format & how the data are stored** - what methods were used to 
indicate missing data values and bad data values in order to process the data
effectively and get accurate analysis results. 
3. If the data are explicedly spatial (e.g. GIS-type data), then we need to 
**understand key spatial *metadata*** to properly process and visualize the 
data.

## Research Question - Explore (Regional) Drivers and Patterns of Plant Phenology

Our science topic for all of the tutorials in this series is plant phenology. 
Our goal is to:

1. Better understand (to quantify) both the timing
of when plants turn green (green-up) and die back / turn brown (brown-down).
2. To quantify two key drivers of this timing - precipitation and temperature 
and visualize how / if trends observed in precipitation and temperature relate 
to trends observed in greening and browning of vegetation.
3. Additionally, we'd like to understand how / if "1" and "2" above vary at 
different sites.

Our study area includes two National Ecological Observatory Network (NEON) field 
sites in the United States:

* **Site One:** 
<a href="http://www.neonscience.org/science-design/field-sites/harvard-forest" target="_blank">Harvard Forest </a> 
located in Massachusetts in the northeastern United States.
* **Site Two:** 
the <a href="http://www.neonscience.org/science-design/field-sites/san-joaquin-experimental-range" target="_blank">San Joaquin Experimental Range </a> 
located in the central region of the US state of California. 

Both sites are mapped below:

![ ]({{ site.baseurl }}/images/rfigs/dc-spatio-temporal-intro/00-spatio-temporal-science-questions/Field-Site-Map-1.png)

These two sites are about 4,900km (3,000 miles) apart! Do we expect to see 
differences in the timing of greening and browning of plants (phenophase timing)
between the two sites? If there are differences, what is causing them? Do the 
two sites have the same drivers (causes) of phenologic change. 

### Science Goals - Spatio-temporal Data in R Series

In the 
[Work with Spatio-temporal Data in R series](http://neondataskills.org/tutorial-series/neon-dc-phenology-series/),
our goal is to create plots of temperature, precipitation and the patterns of 
phenology - specifically the greening and 
browning of plants - for one year (2011), over two NEON field sites. To 
achieve this goal we need data that:

1. Cover the same time periods - temporal data *(year=2011)*.
2. Are for the same spatial locations *(our two field sites)*.
3. Are collected using similar methods so they are comparable at our two field 
sites that are located 3,000+ miles apart!

<figure>
	<a href="{{ site.baseurl }}/images/dc-spatio-temporal-intro/NDVI_Plot.png">
	<img src="{{ site.baseurl }}/images/dc-spatio-temporal-intro/NDVI_Plot.png"></a>
	<figcaption> 
	An example plot of NDVI (Normalized Difference Vegetative Index). We see when the
	vegetation is greener (a larger value) throughout a year or a growing season. 
	Source: National Ecological Observatory Network (NEON)  
	</figcaption>
</figure>

<div id="challenge" markdown="1">
## Challenge: Components of a Large Research Question

Consider the following questions: 

1. What are some potential sources of data that might be useful to
address our phenology question? 
2. How would you go about finding these data?

If you have a colleague nearby, discuss it with them!
</div>



## Project Components

One way to tackle our research project, is to break it down into smaller pieces.
We can  first identify that types of data that we need. We'd like to do the 
following:

* **Map / plot phenophase timing at both sites:** We will need data that 
quantify degree of greenness at both sites. Where can we get that and how do we 
process it to plot greenness at both sites?
* **Understand our field sites:** To understand our sites we will need data that 
"map" vegetation cover and show road locations and boundaries. We also might want to create a map of our study 
sites for a future publication.
	+ How large (spatial extent) are the sites?
	+ How dense is the vegetation? 
	+ Where are the field sites located? 
	+ Are the sites accessible by roads or difficult to get to?  
* **Plots of temperature and precipitation:** Both are drivers of phenophase 
timing. We want to plot each at both sites for the same *temporal duration* as
our greenness data.

## A Spatio-Temporal Approach 

### Find Phenology Data

Where do we start to find data that quantifies the timing of plant greening and
browning?

We could go outside and monitor individual plants and write down in field 
notebooks when they turn green and brown. However, in this case, we can't
monitor enough plants over a large enough area by ourselves to quantify
greening and browning of entire forests or grasslands at multiple sites. To
answer our specific question at a regional scale, we need data that can measure
these events over larger areas.

#### Phenology at Different Scales

<iframe width="560" height="315" src="https://www.youtube.com/embed/_4uHLXL1yZA" frameborder="0" allowfullscreen></iframe>


One way we can measure phenology over larger areas is to use 
<a href="http://phenology.cr.usgs.gov/index.php" target="_blank">Remote Sensing imagery</a>
- data collected using high fidelity cameras mounted on satelites and airplanes. 
Satellites continuously orbit the earth capturing images of the earth's surface. 

The <a href="http://landsat.usgs.gov/" target="_blank">Landsat sensor</a>,
captures images of the *same area every 16 days* which makes it a very powerful
spatio-temporal data source. Because the data are collected from
space, they cover a larger area. The data are standardized, collected using
the same "camera", so the data can be easily compared across sites and through
time. 

#### Introduction to Spectral Remote Sensing

This video explains how remote sensing cameras (spectral sensors) work.

<iframe width="560" height="315" src="https://www.youtube.com/embed/3iaFzafWJQE" frameborder="0" allowfullscreen></iframe> 


<i class="fa fa-star"></i> **Data Note:** <a href="http://phenocam.sr.unh.edu/webcam/" target="_blank">Phenocam data </a>
are another source of phenology data at the site scale. Phenocams are often
mounted on towers and capture repeat photography of vegetation each day. Learn
more about the 
<a href="http://budburst.org/what-is-phenocam">phenocam Citizen Science collaboration- Season Spotter</a>.
{: .notice}

### NDVI Measures Plant Greenness

We can use remote sensing imagery to derive the Normalized Difference Vegetation
Index (NDVI) - a quantitative index that measures how "green" or healthy
vegetation is on the ground. NDVI greenness values ranging from 0-1 where 0 
represents minimal or no greenness and 1 represents maximum greenness. NDVI is 
an ideal data product used to estimate the timing of plant "green-up" and 
"brown-down" over large areas.

<figure>
 <a href="http://earthobservatory.nasa.gov/Features/MeasuringVegetation/Images/ndvi_example.jpg"> 
 <img src="http://earthobservatory.nasa.gov/Features/MeasuringVegetation/Images/ndvi_example.jpg"></a>
    <figcaption> NDVI is calculated from the visible and near-infrared light
    reflected by vegetation. Healthy vegetation (left) absorbs most of the
    visible light that hits it, and reflects a large portion of
    near-infrared light. Unhealthy or sparse vegetation (right) reflects more
    visible light and less near-infrared light. Source: NASA 
    </figcaption>
</figure>

We can visualize NDVI remote sensing data and see the change in color 
(representing the change in the index) as the growing season progresses across 
the year. In this figure, each plot presents a snapshot of the NDVI values 
across an area of 120m x 150m. 

<figure>
	<a href="{{ site.baseurl }}/images/dc-spatio-temporal-intro/NDVI-Landsat-RS.png">
	<img src="{{ site.baseurl }}/images/dc-spatio-temporal-intro/NDVI-Landsat-RS.png"></a>
	<figcaption> Remote sensing data can be used to measure the greening and
	browning of plants over larger areas. Because these data are often collected
	repeatedly using satellites orbiting the earth, it provides a nice time series
	to use for many research questions. 
	Source: National Ecological Observatory Network (NEON) figure based on Landsat
	Data.
	</figcaption>
</figure>

* <a href="http://earthobservatory.nasa.gov/Features/MeasuringVegetation/measuring_vegetation_2.php" target="_blank"> More on NDVI from NASA</a>

<i class="fa fa-star"></i> **Data Note:** NDVI can be calculated using any image
that contains a near-infrared band. Some phenocams capture near-infrared light.
{: .notice}

## Find Remote Sensing Data 

There are many sources that allow us to request and freely download remote
sensing imagery and products like NDVI. In the United States, one popular data
provider is the United States Geological Survey.

* <a href="http://phenology.cr.usgs.gov/get_data_main.php" target="_blank">Remote Sensing Phenology</a>
* <a href="http://glovis.usgs.gov/" target="_blank">USGS GLOVIS</a>
* <a href="http://landsatlook.usgs.gov/" target="_blank">Landsat Look Viewer</a>

Other, non-USGS sources of remote sensing data can be found in the 
[Data Sources list at the end of this tutorial]({{ site.baseurl}}/R/spatio-temporal-research-questions#resources-for-locating-spatial-and-ecological-data).

<div id="challenge" markdown="1">
## Challenge: Explore *Landsat Look* Website

Visit the 
<a href="http://landsatlook.usgs.gov/" target="_blank">Landsat Look Viewer website</a>.
Search for any location of interest. One option could be a NEON Field site: 
Harvard Forest, Massachusetts, United States. 

Then answer the following questions:

1. Are data Landsat sensors are available for the area? If so, what Landsat sensors do the data
come from? 
2. Is there cloud cover in any of the images?
3. What time period are the data available for?

Discuss with a colleague if you are working on this in a workshop!
</div>



### Work With Remote Sensing Imagery - Raster Data Format 

Remote sensing images are in **raster** format. They are composed of pixels -
just like the pixels in the images we take with our camera phones. Because we are studying 
phenophase timing, we need raster data collected 
repeatedly through time to identify when groups of plants green-up and brown down.
We can use the <a href="https://cran.r-project.org/web/packages/rasterVis/index.html" target="_blank"> `rasterVis` package in `R` </a> efficiently plot raster time
series.


We will 
learn more about the raster format in 
[Spatial Data Formats -- Intro to Shapefiles (Vector Data) and GeoTiffs (Raster Data)](http://neondataskills.org/R/spatial-data-formats)

We will learn how to work with raster data in the NEON Data Skills
[*Introduction to Working With Raster Data in R* tutorial series](http://neondataskills.org/tutorial-series/raster-data-series/).
And, about raster time series data, in the 
[*Work With Raster Time Series Data in R* tutorial series](http://neondataskills.org/tutorial-series/raster-time-series/).


## Find Temperature and Precipitation Data

As a part of our research project, we also would like to plot three drivers of 
green-up and brown-down phenophase stages - 
temperature (both air & soil temperature), photosynthetically active radiation, 
and precipitation. 

Precipitation, temperature and other *micrometeorological* measurements are recorded at 
weather stations across 
the globe. Many research and long term monitoring stations have towers with 
sensors mounted on them that collect high frequency (many measurements a second 
or minute) measurements of variables including temperature, precipitation, light 
intensity, wind speed and more.

Some sources of climate data:

* <a href="http://www.neonscience.org/science-design/collection-methods/flux-tower-measurements" target="_blank"> **National Ecological Observatory Network (NEON):** </a>
data from a network of have flux towers, that measure temperature, 
precipitation, wind speed, light intensity and more at its field sites located 
across the United States. Data can be downloaded from the 
<a href="http://data.neonscience.org/browse-data?showTheme=atmos" target="_blank">NEON data portal </a>. 
* <a href="http://fluxnet.ornl.gov" target="_blank">**FluxNet:** </a>
a network of towers located around the world. 
* <a href="http://www.ncdc.noaa.gov/data-access/land-based-station-data" target="_blank">**NOAA National Center for Environmental Information (formerly National Climatic Data Center):**</a>
from a
<a href="http://www.ncdc.noaa.gov/" target="_blank"> network of weather stations </a>
maintained by NOAA. 
* <a href="https://portal.lternet.edu/nis/home.jsp" target="_blank">**Long Term Ecological Research sites (LTER):**</a>
Many LTER sites have micrometerology towers that collect climatic data.

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

If we want climate data for our field sites, there are several places that 
we can start. In our case, 
<a href="http://harvardforest.fas.harvard.edu/research/LTER/" target="_blank">Harvard Forest is a LTER site </a>,
so we can hope for a micrometerology tower that contains temperature and 
precipitation sensors. 
Visiting the 
<a href="http://harvardforest.fas.harvard.edu/research/stations" target="_blank"> Harvard Forest research stations home page</a>, 
we learn that it has a meteorological station / flux tower that has been
collecting data since 2001. Better yet, the data are freely available for
download from the <a href="http://harvardforest.fas.harvard.edu/harvard-forest-data-archive" target="_blank"> Harvard Forest data archives</a>. 

<i class="fa fa-star"></i> **Data Note:** Also take note that there are some other data 
resources on this page including "GIS" data. Many research stations (not all) 
have these types of data available.
{: .notice}

#### Micro-meteorological Data from the Fisher Tower
The 
<a href="http://harvardforest.fas.harvard.edu/meteorological-hydrological-stations" target="_blank"> Harvard Forest Fisher Meteorological Station </a> 
has been operational since 2001. It is located in an open field and records air
temperature, relative humidity, precipitation, incoming and net radiation,
barometric pressure, wind speed and direction, and soil temperature. Data is
available at 15-minute and daily intervals.

 <figure class="half">
	<a href="http://harvardforest.fas.harvard.edu/sites/harvardforest.fas.harvard.edu/files/metsta-fall.jpg">
	<img src="http://harvardforest.fas.harvard.edu/sites/harvardforest.fas.harvard.edu/files/metsta-fall.jpg">
	</a>
	<a href="http://harvardforest.fas.harvard.edu/sites/harvardforest.fas.harvard.edu/files/metsta-winter.jpg">
	<img src="http://harvardforest.fas.harvard.edu/sites/harvardforest.fas.harvard.edu/files/metsta-winter.jpg">
	</a>
	<figcaption>The Fischer Meteorological Station in two seasons. Source: 
	<a href="http://harvardforest.fas.harvard.edu/" target="_blank"> Harvard Forest</a>
	</figcaption>
</figure>   

### Work With Time Series Data in R

The climate data are available for download in a Comma
Separated Value (`.csv`) format. To work with these data in `R`, we will need 
to understand how to work with date and time formats. 

[The *Introduction to Working With Time Series Data in Text Formats in R* tutorials](http://neondataskills.org/tutorial-series/tabular-time-series/) 
cover how to import time series data in `.csv` format into `R` and how to work with, subset and plot date & date/time formats.

<div id="challenge" markdown="1">
## Challenge: Explore External Data from Harvard Forest 
Revisiting the <a href="http://harvardforest.fas.harvard.edu/data-archives" target="_blank"> Harvard Forest research station data archives</a>:

1. What other data are available for Harvard Forest?
2. Is there inforamtion that you'd consider metadata?
3. Which file formats do you recognize? Which are new to you?

</div>



## Data to Characterize our Study Site

It is often useful to create maps that characterize our field sites. Maps are integral to 
planning site visits and plot locations prior to visiting. Maps
are useful tools to get to know a site's:

* Layout including roads, and other infrastructure.
* Topography (elevation)
* Vegetation height and cover

They are also essential for understanding sites that we may study using external
data but never visit because they are far away or access is 
restricted. Maps are also useful for publications to describe our field sites.

### Map Site Infrastructure: Buildings, Roads, Streams

The most basic map that we might draw of our site is one showing the
infrastructure on a site, including roads, trails, streams, buildings and other 
landmarks. These points (e.g., field house), linear (e.g., trails & streams), 
and boundary type data are often found in **shapefile format** ( `.shp`).
This is a **vector format** that is read by most **GIS programs**. 

#### Work With Vector Data

We will learn more about the vector format in 
[*Spatial Data Formats -- Intro to Shapefiles (Vector Data) and GeoTiffs (Raster Data)* tutorial.]({{ site.baseurl }}/R/spatial-data-formats) 

Further, we explore working with vector data in more depth in the 
[*Introduction to Working With Vector Data in R* tutorial series](http://neondataskills.org/tutorial-series/vector-data-series/).


### Map Topography & Vegetation Cover - LiDAR

**Light Detection and Ranging Data (LiDAR)** data provide high resolution,
accurate topography (elevation) and three-dimensional vegetation cover and
structure (density and height) information. LiDAR can also be used to find the 
location of roads and streams (a way to initially create the shapefiles 
mentioned above). 

<iframe width="560" height="315" src="https://www.youtube.com/embed/videoseries?list=PLLWiknuNGd50GI8OZf3EBo6PMx04xcoFa" frameborder="0" allowfullscreen></iframe>

* Learn more about LiDAR in the NEON Data Skills 
[ *The Basics of LiDAR - Light Detection and Ranging - Remote Sensing* tutorial](http://neondataskills.org/self-paced-tutorial/1_About-LiDAR-Data-Light-Detection-and-Ranging_Activity1/)
* Learn more about LiDAR canopy height and digital elevation models in the NEON Data Skills 
[*What is a CHM, DSM and DTM? About Gridded, Raster LiDAR Data* tutorial](http://neondataskills.org/self-paced-tutorial/2_LiDAR-Data-Concepts_Activity2/)

### Sources of LiDAR Data 

As LiDAR is most often captured from an airplane, the coverage of publically 
available LiDAR-derived data products is much less than that of satellite-based
remote sensing. Research stations may have Digital Elevation Models (DEM) and
Canopy Height Models (CHM), that map elevation and vegetation height 
respectively, or other LiDAR-derived data available for researchers. 


* <a href="http://www.neonscience.org/data-resources/get-data/airborne-data" target="_blank"> **NEON airborne observation platform** data portal</a>: more 
information in the next section. 
* <a href="http://www.opentopography.org/" target="_blank">**Open Topography**: </a>
a great source of free LiDAR data in the US.
* <a href="http://earthexplorer.usgs.gov/" target="_blank"> **USGS LiDAR data**</a> 

<i class="fa fa-star"></i> **Data Note:** In the United States, state-wide data 
are often also available locally. State GIS offices are often a good source of
information and sometimes have online repositories to access the data.
{: .notice}

#### NEON Airborne Observation Platform (AOP)
The
<a href="http://www.neonscience.org/science-design/collection-methods/airborne-remote-sensing" target="_blank"> NEON airborne observation platform </a>
(AOP) collects annual remote sensing data over NEON field sites using sensors
mounted on an airplane. The AOP consists of a hyperspectral imaging 
spectrometer, a full waveform and discrete return LiDAR, and a high-resolution 
Red Blue Green (RGB) camera. Data from the AOP build a robust time series of
landscape-scale changes in numerous physical, biological and biochemical 
metrics, such as vegetation cover and density, canopy chemistry, and topography,
including elevation, slope and aspect.

## Data Used In The Work with Spatio-temporal Data in R Series
In the 
[Work with Spatio-temporal Data in R series](http://neondataskills.org/tutorial-series/neon-dc-phenology-series/),
we will use the following data to explore the drivers of patterns of vegetation phenology (greening and browning ) across multiple sites.

* Landsat-derived NDVI data 
* Light Detection and Ranging Data (LiDAR) data
* Site layout vector data
* Micro-meteorolgical data in tabular (.csv) format

This 
[Intro to Working With Spatio-Temporal Data and Data Management series](http://neondataskills.org/tutorial-series/spatial-data-management-series/)
will provide you with the conceptual information to succeed in the following 
data skill intensive series. 

## Resources for Locating Spatial and Ecological Data

#### General / Broad Topics
* <a href="http://www.dataone.org/find-data" target="_blank"> **DataOne**</a>:
a wide variety of data shared by different users.
* <a href="http://www.data.gov/" target="_blank"> **US federal data portal** (data.gov)</a>:
This is the clearing-house for all types of US federal data. 
* <a href="http://www.geoplatform.gov/" target="_blank"> **US federal spatial data portal**</a>:
provide geospatial data, services, and applications for use by the public and by government agencies and partners.
* <a href="http://www.data.ny.gov/" target="_blank"> **New York state government data**</a>:
Many states have their own data portal. Simply search for the state name and "data portal" to find most of the repositories. 
* <a href="http://www.ecologicaldata.org" target="_blank"> **Ecological Data Wiki** </a>:
This wiki is designed to find & compile ecological datasets.

#### Additional Phenology Data Sources
* <a href="http://www.neonscience.org" target="_blank"> **National Ecological 
Observatory Network (NEON)** </a>:
provide data from a continental-scale observation system with the purpose of 
examining ecological change over time. The data portal provides a wide diversity 
of standardized ecological data, including phenology, for all sites in the 
observatory network.
* <a href="https://www.usanpn.org/" target="_blank"> **USA National Phenology Network** </a>:
a collaborative effort to collect phenology data
* <a href="http://phenocam.sr.unh.edu/webcam/" target="_blank"> **Phenocam**</a>:
provide automated, near-surface remote sensing of canopy phenology across the
northeastern United States and adjacent areas of Canada. 

#### Additional Remote Sensing Data Sources
* <a href="http://phenology.cr.usgs.gov/get_data_main.php" target="_blank">**USGS/EROS Center**</a>:
remote sensing phenology data
* <a href="http://landsat.gsfc.nasa.gov/" target="_blank">**NASA Landsat**</a>:
Landsat imagery data for the globe

<i class="fa fa-star"></i> **Data Note:** Do you know of other good sources of 
ecological data, especially for other countries/regions? Please share them in 
the comments at the bottom of this page.
{: .notice}
***
