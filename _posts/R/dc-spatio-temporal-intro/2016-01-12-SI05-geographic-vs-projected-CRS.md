---
layout: post
title: "Spatial Intro 05: Geographic vs Projected CRS` - A Brief Overview"
date: 2015-10-25
authors: [Leah A. Wasser, Megan A. Jones]
contributors: [ ]
dateCreated: 2015-10-23
lastModified: 2016-03-01
packagesLibraries: [ ]
category: [self-paced-tutorial] 
tags: [R, spatial-data-gis]
mainTag: spatial-data-management-series
workshopSeries: [spatial-data-management-series]
description: "Description here."
code1: intro-CRS-projection.R
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

<a href="http://www.naturalearthdata.com/downloads/110m-physical-vectors/110m-land/" class="btn btn-success">
Download Natural Earth Global Boundary Layer</a>

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


## Geographic vs Projected CRS


The above maps provide examples of the two main types of coordinate systems:

1. **Geographic coordinate systems:** coordinate systems that span the entire
globe (e.g. latitude / longitude). 
2. **Projected coordinate Systems:** coordinate systems that are localized to 
minimize visual distortion in a particular region (e.g. Robinson, UTM, State Plane)

Next, we will discuss the differences between these `CRS`s in more detail. Feel
free to skip over this section and come back to it with fresh eyes if the 
concept of a `CRS` is becoming too complex. It's easisest to take on in 
bite sized pieces!




## Geographic Coordinate Systems

A geographic coordinate system uses a grid that wraps around the entire globe.
This means that each point on the globe is defined using the SAME coordinate system. Geographic coordinate systems are best for global analysis however it 
is important to remember that distance is distorted using a geographic lat / long
`CRS`.

The **geographic WGS84 lat/long** `CRS` has an origin - (0,0) -
located at the intersection of the 
Equator (0° latitude) and Prime Meridian (0° longitude) on the globe.


    ## OGR data source with driver: ESRI Shapefile 
    ## Source: "../../Global/Boundaries/ne_110m_graticules_all", layer: "ne_110m_graticules_30"
    ## with 17 features
    ## It has 6 fields

    ## OGR data source with driver: ESRI Shapefile 
    ## Source: "../../Global/Boundaries/ne_110m_graticules_all", layer: "ne_110m_wgs84_bounding_box"
    ## with 1 features
    ## It has 2 fields

![ ]({{ site.baseurl }}/images/rfigs/dc-spatio-temporal-intro/05-geographic-vs-projected-CRS/geographic-WGS84-1.png) 



<i class="fa fa-star"></i> **Data Note:** The distance between the 2 degrees of
longitude at the equator (0°) is ~ 69 miles. The distance between 2 degrees of 
longitude at 40°N (or S) is only 53 miles. However measures of distance when using
lat/long project are not uniform.
{: .notice}


## Projected Coordinate Reference Systems


Spatial projection refers to the mathematical calculations 
performed to flatten the 3D data onto a 2D plane (our computer screen
or a paper map). Projecting data from a round surface onto a flat surface, results
in visual modifications to the data when plotted on a map. Some areas are stretched
and some some are compressed. We can see this when we look at a MAP of the entire
globe.


The mathematical calculations used in spatial projections are designed to 
optimize the relative size and shape of a particular region on the globe.

<figure>
    <a href="http://www.progonos.com/furuti/MapProj/Normal/CartDef/MapDef/Img/devSurfaces.png">
    <img src="http://www.progonos.com/furuti/MapProj/Normal/CartDef/MapDef/Img/devSurfaces.png">
    </a>
    <figcaption>The 3-dimensional globe must be transformed to create a flat
    2-dimensional map. How that transformation or **projection** occurs changes 
    the appearance of the final map and the relative size of objects in 
    different parts of the map.  
    Source: CA Furuti, progonos.com/furuti</figcaption>
</figure>

A few common example projections, and how they optimize the visual appearance of a region
on a map, are listed below.

# make the below into a table 
* **State Plane** Region: United States. Optimized for: states
in the U.S. Sub regions:  north / south (withing hte state). Units:
Feet 
* **Universal Trans Mercator (UTM)** Region: Entire Globe, Optimized for: regions 
throughout the globe. Sub regions: north / south (above / below the equator)divides the entire globe

### About UTM

The **Universal Transverse Mercator** (UTM) system is a projected coordinate
reference system. The earth is flattened and subdivided into zones,
numbered 0-60 (equivalent to longitude) and regions (north and south)


<i class="fa fa-star"></i> **Data Note:** UTM zones are also defined using bands,
lettered C-X (equivalent to latitude) however, the band designation is often 
dropped as it isn't esssential to specifying the location. 
{: .notice}

While UTM zones span the entire globe, UTM uses a regional 
projection and associated coordinate system. The coordinate system grid for each
zone is projected individually using the **Mercator projection**. 

The origin (0,0) for each UTM zone and associated region is located at the 
intersection of the equator and a location, 500,000 meters east of the central 
meridian of each zone. The origin location is placed outside of the boundary of 
the UTM zone, to avoid negative Easting numbers.  

# LINK TO PSU INFO ON UTM!

<figure>
    <a href="https://upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Utm-zones.jpg/800px-Utm-zones.jpg">
    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Utm-zones.jpg/800px-Utm-zones.jpg">
    </a>
    <figcaption> The gridded UTM coordinate system across the globe.    
    Source: Public domain from Earth Observatory, NASA</figcaption>
</figure>

# edit this messy
The coordinates for the NEON Harvard Forest Field Site can be written as:
would be written as: UTM Zone 18N, 730782m, 4712631m
where the N denotes that it is in the Northern, not Southern hemisphere. Occassionally,
you may see: Zone 18T, 730782m Easting, 4712631m Northing.

<i class="fa fa-star"></i>**Data Tip:**  The UTM system doesn't apply to polar 
regions (>80°N or S). Universal Polar Stereographic (UPS) coordinate system is 
used in these area. This is where zones A, B and Y, Z are used if you were 
wondering why they weren't in the UTM lettering system.  
{: .notice }


### Datum

The datum describes the vertical and horizontal reference point of the coordinate 
system. The vertical datum describes the relationship between a specific ellipsoid 
(the top of the earth's surface) and the center of the earth. The datum also describes
the origin (0,0) of a coordinate system. 

Frequently encountered datums: 

* *WGS84* -- World Geodetic System (created in) 1984.  The origin is the center of
the earth.
* *NAD27* & *NAD83* -- North American Datum 1927 and 1983,
respectively.  The origin for NAD 27 is Meades Ranch in Kansas.
* *ED50* -- European Datum 1950

For more information, read
*  <a href="http://help.arcgis.com/en/arcgisdesktop/10.0/help/index.html#/Datums/003r00000008000000/" target="_blank">ESRI's ArcGIS discussion of Datums.</a> 
*  <a href="https://www.nceas.ucsb.edu/~frazier/RSpatialGuides/OverviewCoordinateReferenceSystems.pdf" target="_blank">page 2 in M. Fraiser's CRS Overview.</a> 


> NOTE: All coordinate reference systems have a vertical and horizontal datum
which defines a "0, 0" reference point. There are two models used to define 
the datum: **ellipsoid** (or spheroid): a mathematically representation of the shape of
the earth. Visit
<a href="https://en.wikipedia.org/wiki/Earth_ellipsoid" target="_blank">Wikipedia's article on the earth ellipsoid </a>  for more information and **geoid**: a 
model of the earth's gravitatinal field which approximates the mean sea level 
across the entire earth.  It is from this that elevation is measured. Visit 
<a href="https://en.wikipedia.org/wiki/Geoid" target="_blank">Wikipedia's geoid
article </a>for more information. We will not cover these concepts in this tutorial.



### Coordinate Reference System Formats

There are numerous formats that are used to document a `CRS`. Three common
formats. We will discuss Proj4, WKT and EPSG.....


*** 
##Additional Resources
ESRI help on CRS
QGIS help on CRS
NCEAS cheatsheets
