---
layout: post
title: "Lesson 04: Key Spatial Metadata to Understand"
date:   2015-10-26
authors: []
contributors: [ ]
dateCreated: 2015-10-23
lastModified: 2016-02-09
packagesLibraries: [ ]
category: [self-paced-tutorial] 
tags: [R, gis-spatial-sata]
mainTag: spatial-data-management-series
workshopSeries: [spatial-data-management-series]
description: "This lesson covers the key spatial attributes that are needed to work with 
spatial data including: Coordinate Reference Systems (CRS), Extent and spatial resolution."
code1: key-spatial-metadata.R
image:
  feature: NEONCarpentryHeader_2.png
  credit: A collaboration between the National Ecological Observatory Network (NEON) and Data Carpentry
  creditlink: http://www.neoninc.org
permalink: R/key-spatial-metadata
comments: false
---

{% include _toc.html %}

##About
Add description.

**R Skill Level:** Intermediate - you've got the basics of `R` down.

<div id="objectives" markdown="1">

#Goals / Objectives

After completing this activity, you will:

* Understand that there are necessary spatial metadata associated with and/or
embedded in the data
* Understand that there is potentially ancillary data associated with individual
elements in vector data files (like NEON tower data (point), road (line), watershed (polygon)).


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
* Read more on coordinate systems in the
<a href="http://docs.qgis.org/2.0/en/docs/gentle_gis_introduction/coordinate_reference_systems.html" target="_blank">
QGIS documentation.</a>
* NEON Data Skills Lesson <a href="{{ site.baseurl }}/GIS-Spatial-Data/Working-With-Rasters/" target="_blank">The Relationship Between Raster Resolution, Spatial extent & Number of Pixels - in R</a>

</div>

##Spatial Metadata
There are three core spatial metadata elements that are crucial to understand
in order to effectively work with any sort of spatial data: 

* **Coordinate Reference System** (CRS), 
* **Extent**
* **Resolution** 

##What is a Coordinate Reference System

> A spatial reference system (SRS) or coordinate reference system (CRS) is a 
coordinate-based local, regional or global system used to locate geographical 
entities. -- Wikipedia

The earth is round. This is not an new concept by any means, however, we need to 
remember this when we talk about coordinate reference systems associated with 
spatial data. When we make maps on paper or on a computer screen, we are moving 
from a 3-Dimensional space (the globe) to a 2-Dimensional space (our computer
screens or a piece of paper). The components of the CRS tell us how the
"flattening" of the 3-D globe occured into 2-D maps.

The coordinate reference system is made up of several key components: 

* The coodinate system & units
* The datum 
* The projection 

###Coordinate System & Units
Every geograhic object in a spatial system (e.g. the globe, a map, etc) is
given a point location conisting of an x- and a y-value (large/long items might
be given a series of x,y locations). This is the most basic coordinate system. 

Each coordinate system also has units that those x- and y-values are based in. 

Common coordinate systems and their coordinates include: 

* **Geographical Coordinate System** or **Latitude and Longitude**: degrees
(which can be expressed as decimal degrees, degrees: minutes: seconds, and more)
* **Universal Transverse Mercator** (UTM) Coordinate System: meters
* **State Plane** Coordinate System (used for USA only): feet 

The geographic coordinate system is depended on two other concepts that are 
important to a deep understanding of Geographic Information Systems but the
details are beyond the scope of this lesson series: 

* **ellipsoid** (or spheroid): a mathematically representation of the shape of
the earth. Visit
<a href="https://en.wikipedia.org/wiki/Earth_ellipsoid" target="_blank">Wikipedia's article on the earth ellipsoid </a> 
for more information
* **geoid**: a model of the earth's gravitatinal field which approximates the
mean sea level across the entire earth.  It is from this that elevation is
measured.  Visit 
<a href="https://en.wikipedia.org/wiki/Geoid" target="_blank">Wikipedia's geoid
article </a> 
for more information.

###Datum
The datum describes the relationship between a specific ellipsoid and the 
center of the earth. The datum also describes which origin (0,0) and
axis orientation for a coordinate system using the datum. 

Frequently encountered global and regional datums: 

* *WGS84* -- World Geodetic System (created in) 1984.  The origin is the center of
the earth.
* *NAD27* & *NAD83* -- North American Datum 1927 and 1983,
respectively.  The origin for NAD 27 is Meades Ranch in Kansas.
* *ED50* -- European Datum 1950

For more information, read
*  <a href="http://help.arcgis.com/en/arcgisdesktop/10.0/help/index.html#/Datums/003r00000008000000/" target="_blank">ESRI's ArcGIS discussion of Datums.</a> 
*  <a href="https://www.nceas.ucsb.edu/~frazier/RSpatialGuides/OverviewCoordinateReferenceSystems.pdf" target="_blank">page 2 in M. Fraiser's CRS Overview.</a> 

##Projection for CRS
The projection refers to the mathematical calculations performed to flatten the
3D data collected someplace on the globe onto a 2D plane of our computer screen
or map. To get this to happen on a neat rectangular map, some areas of the globe
must be stretched and other area must be compressed.  

<figure>
    <a href="http://www.progonos.com/furuti/MapProj/Normal/CartDef/MapDef/Img/devSurfaces.png">
    <img src="http://www.progonos.com/furuti/MapProj/Normal/CartDef/MapDef/Img/devSurfaces.png">
    </a>
    <figcaption>The 3-dimensional globe must be transformed to create a flat
    2-dimensional map. How that transformation or **projection** occurs changes 
    the appearance of the final map and the realtive size of objects in 
    different parts of the map.  
    Source: CA Furuti, progonos.com/furuti</figcaption>
</figure>

####How Map Projections Can Fool the Eye
Check out this short video highlighting how map projections can make continents 
seems proportionally larger or smaller than they actually are!

<iframe width="560" height="315" src="https://www.youtube.com/embed/KUF_Ckv8HbE" frameborder="0" allowfullscreen></iframe>

* For more on types of projections, visit 
<a href="http://help.arcgis.com/en/arcgisdesktop/10.0/help/index.html#/Datums/003r00000008000000/" target="_blank"> ESRI's ArcGIS reference on projection types.</a>.  
* Read more about <a href="https://source.opennews.org/en-US/learning/choosing-right-map-projection/" target="_blank"> choosing a projection/datum.</a>

##What Makes Spatial Data Line Up On A Map?
There are lots of great resources that describe coordinate reference systems 
and projections in greater detail. However, for the purposes of this activity,
what is important to understand is that data from the same location but saved in
different projections **will not line up in any GIS or other program**. Thus 
it's important when working with spatial data in a program like `R` or `Python` 
to identify the coordinate reference system applied to the data, and to grab 
that information and retain it when you process / analyze the data.

*<a href="http://spatialreference.org/ref/epsg/" target="_blank">A great online 
library of CRS information.</a>


####Same Country, Different Datums & Projections
<figure>
    <a href="https://source.opennews.org/media/cache/b9/4f/b94f663c79024f0048ae7b4f88060cb5.jpg">
    <img src="https://source.opennews.org/media/cache/b9/4f/b94f663c79024f0048ae7b4f88060cb5.jpg">
    </a>
    
    <figcaption>Maps of the United States in different datums/projections. 
    Notice the differences in shape and orientation associated with each
    different datum/projection. These differences are a direct result of the
    calculations used to "flatten" the data onto a two dimensional map. 
    Source: opennews.org</figcaption>
</figure>


##Geographic vs Projected Coordinate Systems
Coordinate systems can be projected or geographic coordinate systems. Geographic
coordinate systems have thier grid defined on the spherical globe itself.  
Projected geographic systems have thier grid defined on a 2-dimensional 
projection of the globe. 

####Advantages & Disadvantages
Each system has advantages and disadvantages which is why both continue to be
used. Geographic CRS has the advantage of not distoring the location of an
object on the globe due to there being no transformations. 

Projected CRS have constant lengths, angles, and areas across the two
dimensions. For smaller scale (even regional) applications, it is very much
more efficient to work with contant lengths and consistent sizes no matter if
one is working in the northern or southern area of thier research area. However,
as one gets further away from the origin the distortion between the projected 
CRS and globe increase.   

##Two Common CRSs
**Latitude and Longitude** (often referred to as the Geographic Coordinate System) 
are based on a grid that wraps around the globe. The units are in degrees.  The origin point (0,0) is at the intersection of the Equator (0° latitude) and Prime Meridian (0° longitude).

<figure>
    <a href="http://worldwind.arc.nasa.gov/graphics/screenshots/21.jpg">
    <img src="http://worldwind.arc.nasa.gov/graphics/screenshots/21.jpg">
    </a>
    <figcaption> Latitude and Longitude are a Geographic CRS.  Latitude are
    marked north and south from the Equator and longitude are marked east and
    west of the Prime Meridian.  
    Source: NASA</figcaption>
</figure>

Since the grid wraps around the globe. The distance between the 2 degrees of
longitude at the equator (0°) is ~ 69 miles, at 40°N (or S) the distance is
only 53 miles. 

The **Universal Transverse Mercator** (UTM) system is a projected coordinate
reference system. The earth is flattened and subdivided into zones,
numbered 0-60 (equivalent to longitude), and bands,
lettered C-X (equivalent to latitude). Zone are always used with UTM data,
however, the band designation is often dropped as it isn't esssential to 
specifying the location.  

While the grid is global in scale, the system uses a regional projection system .  
Each zone grid is individually projected using a Mercator projection. The coordinate
units are in meters and the origin points is the intersection of the equator and an
arbitrary meridian 500,000m E of the central meridian of each zone.  This arbitrary
point outside of the zone itself is used so that there are no negative Easting numbers.  

<figure>
    <a href="https://upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Utm-zones.jpg/800px-Utm-zones.jpg">
    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Utm-zones.jpg/800px-Utm-zones.jpg">
    </a>
    <figcaption> The gridded UTM coordinate system across the globe.    
    Source: Public domain from Earth Observatory, NASA</figcaption>
</figure>

The coordinates for the Harvard Forest would be written as: 
Zone 18T, 730782m Easting, 4712631m Northing or ocassionally as 18N, 730782m, 4712631m
where the N denotes that it is in the Northern, not Southern hemisphere).  However,
this can be confused with band N and grid 18N.   

Data Tip:  Wondering about the polar regions (>80°N or S)?  In these regions
the UTM system doesn't apply and instead the Universal Polar Stereographic
(UPS) coordinate system is used.  This is where zones A, B and Y, Z are used
if you were wondering why they weren't in the UTM lettering system.  

###Coordinate Reference System Formats
A particular CRS can be referenced in a number of different ways.  Three common
ones currently are the **proj.4**, **EPSG**, and Well-known Text (**WKT**)
formats.  

####PROJ or PROJ.4 strings 
PROJ.4 strings are, an initially confusing but, compact way to identify a spatial
or coordinate reference system. PROJ.4 strings are the primary output from most
of the spatial data `R` packagages that we will use (e.g. `raster`, `rgdal`).

Using the PROJ.4 syntax, we specify the complete set of parameters (e.g. elipse, datum,
units, etc) that define a particular CRS.

*Read more about <a href="https://www.nceas.ucsb.edu/scicomp/recipes/projections" target="_blank">all three formats from the National Center for Ecological Analysis and Synthesis.</a>

* A handy four page overview of CRS <a href="https://www.nceas.ucsb.edu/~frazier/RSpatialGuides/OverviewCoordinateReferenceSystems.pdf" target="_blank">including file formats on page 1.</a>

####EPSG codes
The EPSG codes are a structured dataset of CRSs that are used around the world. They were
originally compiled by the, now defunct, European Petroleum Survey Group, hence the
EPSG acronym. Each code is a four digit number.  

The codes and more information can be found on these websites: 
* <a href="http://www.epsg-registry.org/" target="_blank">The EPSG registry. </a>
* <a href="http://spatialreference.org/" target="_blank">Spatialreference.org</a>
* <a href="http://spatialreference.org/ref/epsg/" target="_blank">list of ESPG codes.</a>


    library('rgdal')
    epsg = make_EPSG()
    #View(epsg)
    head(epsg)

    ##   code                                               note
    ## 1 3819                                           # HD1909
    ## 2 3821                                            # TWD67
    ## 3 3824                                            # TWD97
    ## 4 3889                                             # IGRS
    ## 5 3906                                         # MGI 1901
    ## 6 4001 # Unknown datum based upon the Airy 1830 ellipsoid
    ##                                                                                            prj4
    ## 1 +proj=longlat +ellps=bessel +towgs84=595.48,121.69,515.35,4.115,-2.9383,0.853,-3.408 +no_defs
    ## 2                                                         +proj=longlat +ellps=aust_SA +no_defs
    ## 3                                    +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs
    ## 4                                    +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs
    ## 5                            +proj=longlat +ellps=bessel +towgs84=682,-203,480,0,0,0,0 +no_defs
    ## 6                                                            +proj=longlat +ellps=airy +no_defs

####WKT or Well-known Text
Well-known Text (WKT) allows for compact machine- and human-readable representation of
geometric objects as well as to consisely describing the critical elements of
coordinate reference system (CRS) definitions. 

The codes and more information can be found on these websites: 
* <a href="http://docs.opengeospatial.org/is/12-063r5/12-063r5.html#43" target="_blank">Open Geospatial Consortium WKT document. </a>

##Spatial Extent
The spatial extent of a spatial object is just how much area does it cover. A 
map of Paris has a smaller spatial extent than a map of all of France.  

###Units
The units of the extent are defined by the coordinate system that the spatial 
data is in.  

###Extent in Vector Data
GRAPHIC FROM COLIN

###Extent in Raster Data
The spatial extent of a raster, represents the x,y coordinates of the corners 
of the raster in geographic space. This information, in addition to the cell 
size or spatial resolution, tells the program how to place or render each pixel 
in 2 dimensional space.  Tools like `R`, using supporting packages such as
`rgdal`, and associated raster tools have functions that allow you to view and
define the extent of a new raster. 


    # View the extent of the raster
    DEM@extent

    ## Error in eval(expr, envir, enclos): object 'DEM' not found

<figure>
    <a href="{{ site.baseurl }}/images/hyperspectral/pixelDetail.png">
    <img src="{{ site.baseurl }}/images/hyperspectral/pixelDetail.png"></a>
    <figcaption>The spatial resolution of a raster refers the size of each cell 
    in meters. This size in turn relates to the area on the ground that the pixel 
    represents.</figcaption>
</figure>


<figure>
    <img src="{{ site.baseurl }}/images/spatialData/raster2.png">
    <figcaption>If you double the extent value of a raster - the pixels will be
    stretched over the larger area making it look more "blury".
    </figcaption>
</figure>

###Calculating Raster Extent
To calculate the extent of a raster, we first need the bottom left x,y
coordinate of the raster. In 
the case of the UTM coordinate system which is in meters, to calculate
the raster's extent, we can add the number of columns and rows to the x,y corner 
coordinate location of the raster, multiplied by the resolution (the pixel size) 
of the raster.

Let's explore that next.


    #create a raster from the matrix
    myRaster1 <- raster(nrow=4, ncol=4)
        
    #assign some random data to the raster
    myRaster1[]<- 1:ncell(myRaster1)
        
    #view attributes of the raster
    myRaster1

    ## class       : RasterLayer 
    ## dimensions  : 4, 4, 16  (nrow, ncol, ncell)
    ## resolution  : 90, 45  (x, y)
    ## extent      : -180, 180, -90, 90  (xmin, xmax, ymin, ymax)
    ## coord. ref. : +proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0 
    ## data source : in memory
    ## names       : layer 
    ## values      : 1, 16  (min, max)

    #is the CRS defined?
    myRaster1@crs

    ## CRS arguments:
    ##  +proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0

    #what are the data extents?
    myRaster1@extent

    ## class       : Extent 
    ## xmin        : -180 
    ## xmax        : 180 
    ## ymin        : -90 
    ## ymax        : 90

    plot(myRaster1, main="Raster with 16 pixels")

![ ]({{ site.baseurl }}/images/rfigs/dc-spatio-temporal-intro/04-key-spatial-metadata/calculate-raster-extent-1.png) 

##Spatial Resolution
A raster consists of a series of pixels, each with the same dimensions 
and shape. In the case of rasters derived from airborne sensors, each pixel 
represents an area of space on the Earth's surface. The size of the area on the 
surface that each pixel covers is known as the spatial resolution of the image. 
For instance, an image that has a 1 m spatial resolution means that each pixel in 
the image represents a 1 m x 1 m area.

<figure>
    <a href="{{ site.baseurl }}/images/hyperspectral/pixelDetail.png">
    <img src="{{ site.baseurl }}/images/hyperspectral/pixelDetail.png"></a>
    <figcaption>The spatial resolution of a raster refers the size of each cell 
    in meters. This size in turn relates to the area on the ground that the pixel 
    represents.</figcaption>
</figure>

<figure>
    <img src="{{ site.baseurl }}/images/spatialData/raster1.png">
    <figcaption>A raster at the same extent with more pixels will have a higher
    resolution (it looks more "crisp"). A raster that is stretched over the same
    extent with fewer pixels will look more blury and will be of lower resolution.
    </figcaption>
</figure>

Let's open up a raster in `R` to see how the attributes are stored.


    #load raster library
    library(raster)
    library(rgdal)
        
    # Load raster in an R object called 'DEM'
    DEM <- raster("DigitalTerrainModel/SJER2013_DTM.tif")  

    ## Error in .rasterObjectFromFile(x, band = band, objecttype = "RasterLayer", : Cannot create a RasterLayer object from this file. (file does not exist)

    # View raster attributes 
    DEM

    ## Error in eval(expr, envir, enclos): object 'DEM' not found

Notice that this raster (in GeoTIFF format) already has defined:

* extent
* resolution (1 in both x and y directions), and
* CRS (units in meters).


For more one the relationship between extent & resolution, visit http://neondataskills.org/GIS-Spatial-Data/Working-With-Rasters/
***
*** 
##Additional Resources
ESRI help on CRS
QGIS help on CRS
NCEAS cheatsheets

