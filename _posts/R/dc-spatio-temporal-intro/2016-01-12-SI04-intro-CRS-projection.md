---
layout: post
title: "Spatial Intro 04: Intro to Coordinate Reference Systems & Spatial
Projections"
date: 2015-10-26
authors: [Leah A. Wasser, Megan A. Jones]
contributors: [ ]
dateCreated: 2015-10-23
lastModified: 2016-03-09
packagesLibraries: [ ]
category: [self-paced-tutorial] 
tags: [R, spatial-data-gis]
mainTag: spatial-data-management-series
workshopSeries: [spatial-data-management-series]
description: "This lesson covers the key spatial attributes that are needed to work with 
spatial data including: Coordinate Reference Systems (CRS), Extent and spatial resolution."
code1: 04-intro-CRS-projection.R
image:
  feature: NEONCarpentryHeader_2.png
  credit: A collaboration between the National Ecological Observatory Network (NEON) and Data Carpentry
  creditlink: 
permalink: R/intro-to-coordinate-reference-systems
comments: true
---

{% include _toc.html %}

## About

This lesson covers the key spatial attributes that are needed to work with 
spatial data including: Coordinate Reference Systems (CRS), Extent and spatial resolution.

**R Skill Level:** Beginner - you've got the basics of `R` down.

<div id="objectives" markdown="1">

# Goals / Objectives

After completing this activity, you will:

* The basic concept of what a Coordinate Reference System (`CRS`) is and how it
impacts data processing, analysis and visualization.
* Understand the basic differences between a geographic and a projected `CRS`.
* Become familiar with the Universal Trans Mercator (UTM) and Geographic (WGS84) `CRS`s


## Things You’ll Need To Complete This Lesson

To complete this lesson you will need the most current version of `R`, and 
preferably, `RStudio` loaded on your computer.

### Install R Packages

* **NAME:** `install.packages("NAME")`

[More on Packages in R - Adapted from Software Carpentry.]({{site.baseurl}}R/Packages-In-R/)

### Download Data

If you want to follow along, please download 

<a href="http//www.naturalearthdata.com/download/110m/physical/ne_110m_land.zip" class="btn btn-success">
Download Natural Earth Global Continent Boundary Layer</a>

<a href="http//www.naturalearthdata.com/download/110m/physical/ne_110m_graticules_all.zip" class="btn btn-success">
Download Natural Earth Global Graticules Layer</a>

****

{% include/_greyBox-wd-rscript.html %}

**Spatial-Temporal Data & Data Management Lesson Series:** This lesson is part
of a lesson series introducing
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
* Read more on coordinate systems in the
<a href="http://docs.qgis.org/2.0/en/docs/gentle_gis_introduction/coordinate_reference_systems.html" target="_blank">
QGIS documentation.</a>
* NEON Data Skills Lesson <a href="{{ site.baseurl }}/GIS-Spatial-Data/Working-With-Rasters/" target="_blank">The Relationship Between Raster Resolution, Spatial extent & Number of Pixels - in R</a>

</div>


#### Getting Started with CRS
Check out this short video highlighting how map projections can make continents 
look proportionally larger or smaller than they actually are!

<iframe width="560" height="315" src="https://www.youtube.com/embed/KUF_Ckv8HbE" frameborder="0" allowfullscreen></iframe>

* For more on types of projections, visit 
<a href="http://help.arcgis.com/en/arcgisdesktop/10.0/help/index.html#/Datums/003r00000008000000/" target="_blank"> ESRI's ArcGIS reference on projection types.</a>.  
* Read more about <a href="https://source.opennews.org/en-US/learning/choosing-right-map-projection/" target="_blank"> choosing a projection/datum.</a>


## What is a Coordinate Reference System

To define the location of something we often use a coordinate system. This system
consists of an X and a Y value, located within a 2 (or more) -dimensional space.

<figure>
	<a href="http://open.senecac.on.ca/clea/label/projectImages/15_276_xy-grid.jpg">
	<img src="http://open.senecac.on.ca/clea/label/projectImages/15_276_xy-grid.jpg"></a>
	<figcaption> We use coordinate systems with X, Y (and sometimes Z axes) to
	define the location of objects in space. 
	Source: http://open.senecac.on.ca
	</figcaption>
</figure>

While the above coordinate system is 2-dimensional, we live on a 3-dimensional
earth that happens to be "round". To define the location of objects on the earth, which is round, we need
a coordinate system that adapts to the Earth's shape. When we make maps on paper 
or on a flat computer screen, we move from a 3-Dimensional space (the globe) to 
a 2-Dimensional space (our computer
screens or a piece of paper). The components of the CRS define how the
"flattening" of data that exists in a 3-D globe space. The CRS also defines the
the coordinate system itself. 

<figure>
	<a href="http://ayresriverblog.com/wp-content/uploads/2011/05/image.png">
	<img src="http://ayresriverblog.com/wp-content/uploads/2011/05/image.png"></a>
	<figcaption>A CRS defines the translation between a location on the round earth
	and that same location, on a flattened, 2 dimensional coordinate system.
	Source: http://ayresriverblog.com
	</figcaption>
</figure>

> A  coordinate reference system (CRS) is a 
coordinate-based local, regional or global system used to locate geographical 
entities. -- Wikipedia

## The Components of a CRS

The coordinate reference system is made up of several key components: 

* **Coodinate System:** the X, Y grid upon which our data is overlayed and how we define
where a point is located in space.
* **Horizontal and vertical units:** The units used to define the grid along the 
x, y (and z) axis.
* **Datum:** A modeled version of the shape of the earth which defines the 
origin used to place the coordinate system in space. We will explain this further, 
below.
* **Projection Information:** the mathematical equation used to flatten objects 
that are on a round surface (e.g. the earth) so we can view them on a flat surface
(e.g. our computer screens or a paper map).


## Why CRS is Important

It is important to understand the coordinate system that your data uses - 
particularly if you are working with different data stored in different coordinate
systems. If you have data from the same location that are stored in different 
coordinate reference systems, **they will not line up in any GIS or other program**
unless you have a program like ArcGIS or QGIS that supports **projection on the 
fly**. Even if you work in a tool that supports projection on the fly, you will
want to all of your data in the same projection for performing analysis and processing
tasks.

<i class="fa fa-star"></i> **Data Tip:** Spatialreference.org provides an
excellent <a href="http://spatialreference.org/ref/epsg/" target="_blank">online 
library of CRS information.</a>
{: .notice}

### Coordinate System & Units

We can define a spatial location, such as a plot location, using an x- and a
y-value - similar to our cartesian coordinate system displayed in the figure, 
above. 

For example, the map below, generated in `R` with `ggplot2` shows all of the 
continents in the world, in a `Geographic` Coordinate Reference System. The
units are Degrees and the coordinate system itself is **latitude** and
**longitude** with the `origin` being the location where the equator meets
the central meridian on the globe (0,0). 



    library(rgdal)
    library(ggplot2)
    library(rgeos)
    library(raster)
    setwd("~/Documents/data")
    
    # read shapefile
    worldBound <- readOGR(dsn="Global/Boundaries/ne_110m_land", 
                          layer="ne_110m_land")

    ## OGR data source with driver: ESRI Shapefile 
    ## Source: "Global/Boundaries/ne_110m_land", layer: "ne_110m_land"
    ## with 127 features
    ## It has 2 fields

    # convert to dataframe
    worldBound_df <- fortify(worldBound)  

    ## Regions defined for each Polygons

    # plot map
    worldMap <- ggplot(worldBound_df, aes(long,lat, group=group)) +
      geom_polygon() +
      xlab("Longitude (Degrees)") + ylab("Latitude (Degrees)") +
      coord_equal() +
      ggtitle("Global Map - Geographic Coordinate System - WGS84 Datum\n Units: Degrees - Latitude / Longitude")
    
    worldMap

![ ]({{ site.baseurl }}/images/rfigs/dc-spatio-temporal-intro/04-intro-CRS-projection/lat-long-example-1.png)

We can add three coordinate locations to our map. Note that the UNITS are
in decimal **degrees** (latitude, longitude):

* Boulder, Colorado:  40.0274, -105.2519
* Oslo, Norway: 59.9500, 10.7500
* Mallorca, Spain: 39.6167, 2.9833

Let's create a second map with the locations overlayed on top of the continental
boundary layer.


    # define locations of Boulder, CO and Oslo, Norway
    loc <- data.frame(lon=c(-105.2519, 10.7500, 2.9833),
                    lat=c(40.0274, 59.9500, 39.6167))
    
    # convert to dataframe
    loc.df <- fortify(loc)  
    
    # add a point to the map
    mapLocations <- worldMap + geom_point(data=loc.df, 
                          aes(x=lon, y=lat, group=NULL, colour = "purple"),
                          size=5)
    
    mapLocations + theme(legend.position="none")

![ ]({{ site.baseurl }}/images/rfigs/dc-spatio-temporal-intro/04-intro-CRS-projection/add-lat-long-locations-1.png)

## Geographic CRS - The Good & The Less Good

Geographic coordinate systems in decimal degrees are helpful when we need to 
locate places on the Earth. However, latitude and longitude
locations are not located using uniform measurement units. Thus, geographic 
CRSs are not ideal for measuring distance. This is why other projected `CRS` 
have been developed. 


<figure>
	<a href="{{ site.baseurl }}/images/dc-spatio-temporal-intro/LatLongfromGlobeCenter-ESRI.gif">
	<img src="{{ site.baseurl }}/images/dc-spatio-temporal-intro/LatLongfromGlobeCenter-ESRI.gif"></a>
	<figcaption>A geographic coordinate system locates latitude and longitude
	location using angles. Thus the spacing of each line of latitude moving north
	and south is not uniform.
	Source: ESRI
	</figcaption>
</figure>

## Projected CRS - Robinson

We can view the same data above, in another CRS - `Robinson`. `Robinson` is a 
**projected** `CRS`. Notice that the country boundaries on the map - have a 
different shape compared to the map that we created above in the `CRS`:  
**Geographic lat/long WGS84**.


    # reproject from longlat to robinson
    worldBound_robin <- spTransform(worldBound,
                                    CRS("+proj=robin"))
    
    worldBound_df_robin <- fortify(worldBound_robin)

    ## Regions defined for each Polygons

    # force R to plot x and y values without abbrev
    options(scipen=100)
    
    robMap <- ggplot(worldBound_df_robin, aes(long,lat, group=group)) +
      geom_polygon() +
      labs(title="World map (robinson)") +
      xlab("X Coordinates (meters)") + ylab("Y Coordinates (meters)") +
      coord_equal()
    
    robMap

![ ]({{ site.baseurl }}/images/rfigs/dc-spatio-temporal-intro/04-intro-CRS-projection/global-map-robinson-1.png)

Now what happens if you try to add the same Lat / Long coordinate locations that
we used above, to our map, with the `CRS` of `Robinsons`?


    # add a point to the map
    newMap <- robMap + geom_point(data=loc.df, 
                          aes(x=lon, y=lat, group=NULL, colour = "purple"),
                          size=5)
    
    newMap + theme(legend.position="none")

![ ]({{ site.baseurl }}/images/rfigs/dc-spatio-temporal-intro/04-intro-CRS-projection/add-locations-robinson-1.png)

Notice above that when we try to add lat/long coordinates in degrees, to a map 
in a different `CRS`, that the points are not in the correct location. We need 
to first convert the points to the  new projection - a process often referred 
to as **reprojection** but performed by the `spTransform()` function in `R`.


    # define locations of Boulder, CO and Oslo, Norway
    loc 

    ##         lon     lat
    ## 1 -105.2519 40.0274
    ## 2   10.7500 59.9500
    ## 3    2.9833 39.6167

    # convert to spatial Points data frame
    loc.spdf <- SpatialPointsDataFrame(coords = loc,data=loc,
                                proj4string=crs(worldBound))  
    
    loc.spdf

    ## class       : SpatialPointsDataFrame 
    ## features    : 3 
    ## extent      : -105.2519, 10.75, 39.6167, 59.95  (xmin, xmax, ymin, ymax)
    ## coord. ref. : +proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0 
    ## variables   : 2
    ## names       :       lon,     lat 
    ## min values  : -105.2519, 39.6167 
    ## max values  :     10.75,   59.95

    # reproject data to Robinson
    loc.spdf.rob <- spTransform(loc.spdf, CRSobj = CRS("+proj=robin"))
    
    loc.rob.df <- as.data.frame(cbind(loc.spdf.rob$lon,loc.spdf.rob$lat))
    # rename each column
    names(loc.rob.df ) <- c("X","Y")
    
    # convert spatial object to a data.frame for ggplot
    loc.rob <- fortify(loc.rob.df)
    
    # notice the coordinate system in the Robinson projection (CRS) is DIFFERENT
    # from the coordinate values for the same locations in a geographic CRS.
    loc.rob

    ##            X       Y
    ## 1 -9162993.5 4279263
    ## 2   811462.5 6331141
    ## 3   260256.6 4235608

    # add a point to the map
    newMap <- robMap + geom_point(data=loc.rob, 
                          aes(x=X, y=Y, group=NULL, colour = "purple"),
                          size=5)
    
    newMap + theme(legend.position="none")

![ ]({{ site.baseurl }}/images/rfigs/dc-spatio-temporal-intro/04-intro-CRS-projection/reproject-robinson-1.png)

## Compare Maps

Both of the plots above look visually different and also use a different 
coordinate system. Let's look at both, side by side, with the actual **graticules**
or latitude and longitude lines rendered on the map. 

NOTE: The code for this map can
be found in the .R document that is available for download at the bottom of this 
page!


    ## Error in eval(expr, envir, enclos): object 'latlongMap' not found

![ ]({{ site.baseurl }}/images/rfigs/dc-spatio-temporal-intro/04-intro-CRS-projection/plot-w-graticules-1.png)


## Why Multiple CRS?

You may be wondering, why bother with different `CRS`s if it makes our
analysis more complicated? Well, each `CRS` is optimized to best represent:

* Shape and/or
* Scale / distance and/or
* Area 

of features in the data. And no one CRS is great at optimizing shape, distance AND
area. Some `CRS`s are optimized for shape, some distance, some area. Some 
`CRS`s are also optimized for particular regions - 
for instance the United States, or Europe. Discussing `CRS` as it optimizes shape,
distance and area is beyond the scope of this tutorial, but it's important to
understand that the `CRS` that you chose for your data, will impact working with
the data!

<div id="challenge" markdown="1">
## Challenge

1. Compare the maps of the globe above. What do you notice about the shape of the 
various countries. Are there any signs of distortion in certain areas on either
map? Which one is better?

2. Look at the image below - which depicts maps of the United States in 4 different
`CRS`s. What visual differences do you notice in each map? Look up each projection
online, what elements (shape,area or distance) does each projection used in
the graphic below optimize?

</div>



***

<figure>
    <a href="https://source.opennews.org/media/cache/b9/4f/b94f663c79024f0048ae7b4f88060cb5.jpg">
    <img src="https://source.opennews.org/media/cache/b9/4f/b94f663c79024f0048ae7b4f88060cb5.jpg">
    </a>
    
    <figcaption>Maps of the United States in different CRS including Mercator
    (upper left), Albers equal area (lower left), UTM (Upper RIGHT) and 
    WGS84 Geographic (Lower RIGHT). 
    Notice the differences in shape and orientation associated with each
    CRS. These differences are a direct result of the
    calculations used to "flatten" the data onto a two dimensional map. 
    Source: opennews.org</figcaption>
</figure>


## Geographic vs Projected CRS


The above maps provide examples of the two main types of coordinate systems:

1. **Geographic coordinate systems:** coordinate systems that span the entire
globe (e.g. latitude / longitude). 
2. **Projected coordinate Systems:** coordinate systems that are localized to 
minimize visual distortion in a particular region (e.g. Robinson, UTM, State Plane)

In the next tutorial, we will discuss the differences between these `CRS`s in 
more detail. Feel
free to skip over this section and come back to it with fresh eyes if the 
concept of a `CRS` is becoming too complex. It's easisest to take on in 
bite sized pieces!

