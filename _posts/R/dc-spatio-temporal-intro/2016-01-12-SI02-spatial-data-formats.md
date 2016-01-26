---
layout: post
title: "Lesson 02: Spatial Data Formats -- Vector & Raster Data Management"
date:   2015-10-28
authors: []
contributors: [ ]
dateCreated: 2015-10-23
lastModified: 2016-01-25
packagesLibraries: [ ]
category: [self-paced-tutorial] 
tags: [R, gis-spatial-sata]
mainTag: spatial-data-management-series
workshopSeries: [spatial-data-management-series]
description: "This lesson covers the basics of key data formats that may contain spatial 
information including shapefile, Geotiff and csv. description here. It also provides a 
brief list of other formats that you may encounter when working with spatial data."
code1: 02-spatial-data-formats.R
image:
  feature: NEONCarpentryHeader_2.png
  credit: A collaboration between the National Ecological Observatory Network (NEON) and Data Carpentry
  creditlink: http://www.neoninc.org
permalink: R/spatial-data-formats
comments: false
---

{% include _toc.html %}

##About
Add description.

**R Skill Level:** Intermediate - you've got the basics of `R` down.

<div id="objectives" markdown="1">

#Goals / Objectives

After completing this activity, you will:

* Understand that spatial data come in many forms and formats.
* Be able to differentiate between vector and raster spatial data formats.
* Understand that vector and raster spatial data types are implemented
differently. 
* Understand that different spatial data require different file types. 
* Understand that different file types require different tools to work with them.
* Understand that multiple data and file types can exist for a single location.


##Things You’ll Need To Complete This Lesson
To complete this lesson you will need the most current version of R, and 
preferably, RStudio loaded on your computer.

###Install R Packages

* **NAME:** `install.packages("NAME")`

* [More on Packages in R - Adapted from Software Carpentry.]({{site.baseurl}}R/Packages-In-R/)

###Download Data


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

###Additional Resources

* Wikipedia article on 
<a href="https://en.wikipedia.org/wiki/GIS_file_formats" target="_blank">
GIS file formats.</a>

</div>

##Types of spatial data
Spatial data is represented in many different ways and file formats. This is 
often because there are different scales or measuring devices or people just
like one or the other. It can seem a little overwhelming, but these data types
will generally conform to standards.

There are two broad categories of spatial data - raster and vector.

##Vector - Point, Line Polygon
- points, lines or polygons
- not spatially extensive
- used if you want to measure particular features in an area
- examples, a point is a tower, a line is a transect, river or road and a polygon is a water shed
- you can have more than one measured variable for each element

--- picture of vector data

Each of these has different file types. There are a lot of file types within each category, but particular file types are associated with a particular data type.

-- Link to file types page.

###The Structure of a Shapefile

#####DBF files / attributes

#####Multiple files associated with a shapefile

###Shapefile vs text file (points focused)

##Raster Data
Raster or "gridded" data are saved on a regular grid which is rendered on a map
as pixels. Each pixel contains a value that represents an area on the Earth's 
surface.

<figure>
    <a href="{{site.baseurl}}/images/raster_timeseries/raster_concept.png">
    <img src="{{site.baseurl}}/images/raster_timeseries/raster_concept.png">
    </a>
    <figcaption> Source: National Ecological Observatory Network (NEON)
    </figcaption>
</figure>

###Types of Data Stored in Raster Format
Raster data can be continuous or categorical. Continuous rasters can have a 
range of quantitative values. Some examples of continuous rasters include:

1. Precipitation maps.
2. Maps of tree height derived from LiDAR data.
3. Elevation values for a region. 

A map of elevation for Harvard Forest derived from the  
<a href="http://www.neoninc.org/science-design/collection-methods/airborne-remote-sensing" target="_blank"> 
NEON AOP LiDAR sensor</a> 
is below. Notice that elevation is a continuous numeric variable. The legend
represents the continuous range of values in the data from around 300 to 420
meters.

![ ]({{ site.baseurl }}/images/rfigs/02-spatial-data-formats/elevation-map-1.png) 

Some rasters contain categorical data. Thus each pixel represents a discrete
class such as a landcover type ("forest") rather than a continuous value such as
elevation or temperature. Some examples of classified maps include:

1. Landcover / landuse maps.
2. Tree height maps classified short, medium, tall trees.
3. Elevation maps classified low, medium and high elevation.

####Categorical Landcover Map for the United States 
<figure>
    <a href="http://neondataskills.org/images/spatialData/NLCD06_conus_lg.gif ">
    <img src="http://neondataskills.org/images/spatialData/NLCD06_conus_lg.gif">
    </a>
    <figcaption> Map of the United States showing landcover as categorical data.
    Each color is a different landcover category.  Source: 
    <a href="http://www.mrlc.gov/nlcd06_data.php" target="_blank">
    Multi-Resolution Land Characteristics Consortium, USGS</a> 
    </figcaption>
</figure>

###GeoTIFF
The raster data that we will be using are GeoTIFFs. But what is that? 

Basically a GeoTIFF has the data stored as the grid as well additional
information about the data stored in the same file.

The GeoTIFF format which has the extension `.tif`. A `.tif` file stores metadata
or attributes about the file as embedded `tif tags`. For instance, your camera
might store a tag that describes the make and model of the camera or the date 
the photo was taken when it saves a `.tif`. A GeoTIFF is a standard `.tif` image
format with additional spatial (georeferencing) information embedded in the file
as tags. These tags can include the following raster metadata:

1. A Coordinate Reference System (`CRS`)
2. Spatial Extent (`extent`)
3. Values for when no data is provided (`NoData Value`)
4. The `resolution` of the data

###Other Raster Formats
* .asc (txt format)
* HDF5 -> link to NEON Data Skills lessons
* ArcGIS grid

##Raster and Vector Data Together
If we are interested in a particular area, we can combine information or
layer data from both of these types. For instance we can combine the Harvard
Forest land cover map (raster) and the boundary of the study site (a vector
polygon) and the tower location (a vector point).
