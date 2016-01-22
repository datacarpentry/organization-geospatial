---
layout: post
title: "Lesson 00: Answer a Spatio-temporal Research Question with Data: Where to Start?"
date:   2015-10-30
authors: []
contributors: [ ]
dateCreated: 2015-10-23
lastModified: 2016-01-22
packagesLibraries: [ ]
category: [self-paced-tutorial] 
tags: [R, GIS-Spatial-Data]
mainTag: spatial-data-management-series
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

##Questions Start the Research Process
The scientific method often begins with a question that you would like to 
answer. Once we have a question, we identify the methods needed to address that
question.
When our question is small, in temporal and/or spatial scale, we might be able
to go out and collect the data needed to answer the question ourselves. When we
ask questions that cover broad spatial and temporal scales, we often need to use
data collected by others. We will refer to these data as “external data”.  

In this and related lesson series (see the info in the grey box above), our
question at hand explores the drivers of and observed patterns of phenology.  
In most temperate zones of the world, one notices that the vegetation is more
green during some times of the year and more brown during other time.

REMOTE SENSING IMAGE SHOWING THIS PATTERN?

Our specific question is therefore, what causes the pattern of phenophase timing
(when vegetation begins growth (turns green) or senesces/ dies back (turns
brown))?  

To answer our question, we could follow the annual cycle of plant phenology at
one site and look for environmental correlates that show a similar pattern. 
That might give us a detailed picture of what happens in one location but does
it provide a good answer for what causes phenophase patterns throughout the 
temperate zones of the globe?  

Perhaps we should add a broader spatial component to our study.  If we conduct
our research at two sites then we can see if similar environmental variables
correlate with the phenophase timing at both sites.  For our research we will
use the Harvard Forest located in the northeastern US state of Massachusetts and
the San Joaquin Experimental Range located in the southern end of the US state
of California.  These two sites are about 4,900km (3,000 miles) apart!

MAP OF USA w/ the two sites -- do not yet link to NEON site.  We'll "gather" that
data later. 

Our revised research question is now, *What causes the pattern of phenophase*
*timing at two different sites in the US?* Our question now has two components:

* a **temporal** component -- We will need data collected across time because
the timing of phenophases (when vegetation begins growth (turns green) or
senesces/ dies back (turns brown)) occurs throughout the annual cycle.  
* a **spatial** component -- We would like to explore this pattern across one
site and then potentially compare these patterns to those observed at another
site. 

##Think Spatially

<div id="challenge" markdown="1">

##Challenge: Thinking Spatially

* What makes data spatial? 
* What are examples of spatial data?  Why is the dataset a spatial data set?
</div>



###Define Spatial Data
XXX

##Insight from Comparisons

###across sites to see patterns.

###across time points to see patterns

##From Scientific Question to Research Tasks
We've stated that we want to figure out what causes the pattern of phenophase
timing at two different sites in the US. However, to tackle this question we
need to break down the question in to several discrete questions that can later
get subsetting again into research tasks. These discrete questions help us
figure out what data need to be collected.  

<div id="challenge" markdown="1">
##Challenge: Breaking Down a Large Research Quesion
* What are some smaller questions/ tasks we need to ask to figure out our
overall question? 
* What data do we need to collect/ gather to answer these questions?
</div>

Here is one way to break this larger question down into smaller questions/ task.

1. How do we measure or quantify phenology/phenophase timing at our sites,
across an annual cycle (or several annual cycles)?
2. What ecological correlates may be related to plant growth or senescence? 
3. What is our study site like? Are there any interesting features of the site
that might affect the patterns we see? 
4. How can we create graphics (e.g., maps, figures, etc) to help explain any 
patterns that we find. 

##Quantify Phenophase -- NDVI 
As we said, we need to quantitatively measures phenology - the greening up and
browning down of vegetation -- over a whole site. 

####Measuring Plant Phenology from Ground to Space Video
<iframe width="560" height="315" src="https://www.youtube.com/embed/_4uHLXL1yZA" frameborder="0" allowfullscreen></iframe>

As this video points out there are different ways to measure phenophases. 
Remote sensing data are valuable when we are trying to view site-wide vegetation
patterns. Specifically, the Normalized Difference Vegetation Index (NDVI) is an
index that efficiently measures green-up and brown-down. NDVI is a quantitative
index of greenness ranging from 0-1 where 0 represents minimal or no greenness
and 1 represents maximum greenness. 

NDVI is often used for a quantitative proxy measure of vegetation health, cover
and phenology (life cycle stage) over large areas.

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

###Where to Access NDVI Data
NDVI data is calculated from raster spatial data that is collected using 
satellite based sensors.  

##Quantify Correlates of Phenology: Temperature, Daylength, Precipitation, and Light
We know from the daily weather report that temperature and precipitation are
recorded at many, many location across the globe.  We could just choose the 
closest NOAA weather station and use the temperature and precipitation data from
that.  However, the closest weather station might not be close nor experience
the same weather patterns as the research site.  

Luckily many research stations have a local weather station, or even better, a
flux tower on site. Flux towers contain sensors that collect high frequency
(many measurements a second or minute) measurements of variables including
temperature, precipitation, different measures of the light available and more.

IMAGE OF FLUX TOWER

###Photosynthetically Active Radiation
I'M NOT ADDING THIS IN NOW AS IT SEEMS TO BE REMOVED FROM ALL LESSONS?  WHY? ADD BACK IN? 

###Flux Tower & Weather Station Networks
Several organizations or networks have numerous flux towers with data available 
to the public or to researchers: 

* National Ecological Observatory Network (NEON): 
<a href="http://www.neoninc.org/science-design/collection-methods/flux-tower-measurements" target="_blank">
what data is collected </a> 
and 
<a href="http://data.neoninc.org/browse-data?showTheme=atmos" target="_blank">
portal for downloading atmospheric data </a>. 
* FluxNet: <a href="http://fluxnet.ornl.gov/site_status" target="_blank">
what data is available at different sites </a> 
and 
<a href="http://fluxnet.ornl.gov/" target="_blank">
general network information </a>. 
* NOAA National Centers for Enviornmental Information (formerly National Climatic Data Center):
<a href="http://www.ncdc.noaa.gov/data-access/land-based-station-data> information on land-based weather stations </a> 
and 
<a href="http://www.ncdc.noaa.gov/" target="_blank"> general network information </a>. 

##Data to Describe the Study Site
We often have to conduct a significant amount of planning (for grants, permits,
etc) prior to visiting our field site.  It is thus useful to create basemaps
during initial data exploration that help us explore characteristics of our 
site.   Useful characteristics include topography, infrastructure/ landmarks
(locations and names of the buidlings, roads, streams, etc), vegetation cover
and more. As we learn more about the location, more data can be added to the
maps.  Maps are also useful for publication to both show readers where the study
area is located and to highlight important characteristics. 

###Locating Study Site Description Details


##Data Types used in this Lesson Series
In this lesson series we will use the following data to explore the drivers of
patterns of vegetation phenology (greening and browning ) across multiple sites.

###Landsat-derived NDVI Data 
About the Landsat sensor

###Spectral Imagery

####Mapping the Invisible: Introduciton to Spectral Remote Sensing
<iframe width="560" height="315" src="https://www.youtube.com/embed/3iaFzafWJQE" frameborder="0" allowfullscreen></iframe> 

###Light Reflectance and Imaging Data (LiDAR)

####LiDAR-Introduction to Light Detection and Ranging Video
<iframe width="560" height="315" src="https://www.youtube.com/embed/videoseries?list=PLLWiknuNGd50GI8OZf3EBo6PMx04xcoFa" frameborder="0" allowfullscreen></iframe>

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

###Micro-meteorological Data from the Fisher Tower
The 
<a href="http://harvardforest.fas.harvard.edu/meteorological-hydrological-stations" target="_blank"> Harvard Forest Fisher Meteorological Station </a> 
has been operational since 2001.  It is located in an open field and records air
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

##Resources for Locating Spatial and Ecological Data

* <a href="http://www.dataone.org/find-data" target="_blank"> DataOne</a>: Brief description
* <a href="http://www.data.gov/" target="_blank"> US Federal data (data.gov)</a>: This is the clearing-house for all types of US Federal data. 
* <a href="http://www.geoplatform.gov/" target="_blank"> US Federal spatial data</a>: Brief description
* <a href="http://www.data.ny.gov/" target="_blank"> New York state government data</a>: Many states have their own data portal.  Simply search for the state name and  "data portal" to find most of the repositories. 
* <a href="http://www.ecologicaldata.org" target="_blank"> DataOne</a> : Brief description
