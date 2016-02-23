---
layout: post
title: "Spatial Intro 02: Spatial Data Formats -- Vector & Raster Data Management"
date:   2015-10-28
authors: [Leah A. Wasser, Megan A. Jones]
contributors: [ ]
dateCreated: 2015-10-23
lastModified: 2016-02-17
packagesLibraries: [ ]
category: [self-paced-tutorial] 
tags: [R, spatial-data-gis]
mainTag: spatial-data-management-series
workshopSeries: [spatial-data-management-series]
description: "This tutorial covers the basics of key data formats that may contain spatial 
information including shapefile, Geotiff and csv. description here. It also provides a 
brief list of other formats that you may encounter when working with spatial data."
code1: 02-spatial-data-formats.R
image:
  feature: NEONCarpentryHeader_2.png
  credit: A collaboration between the National Ecological Observatory Network (NEON) and Data Carpentry
  creditlink:
permalink: R/spatial-data-formats
comments: false
---

{% include _toc.html %}

##About
This tutorial covers the basics of key data formats that may contain spatial 
information including shapefile, Geotiff and csv. description here. It also provides a 
brief list of other formats that you may encounter when working with spatial data.

**R Skill Level:** Intermediate - you've got the basics of `R` down.

<div id="objectives" markdown="1">

# Goals / Objectives

After completing this activity, you will:

* Understand two key spatial data formats: raster and vector format. 
* Understand the basic structure of a GeoTiff format as a key raster spatial data format. 
* Understand the basic file structure of a shapefile - a key vector spatial data format.
* Understand the basic data management / file storage approaches for working with
shapefiles which contain multiple associated files.
* Understand where metadata are often stored in both raster and vector data formats.


## Things You’ll Need To Complete This Lesson
To complete this lesson you will need the most current version of `R`, and 
preferably, `RStudio` loaded on your computer.

### Install R Packages

* **NAME:** `install.packages("NAME")`

* [More on Packages in R - Adapted from Software Carpentry.]({{site.baseurl}}R/Packages-In-R/)

### Download Data


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

* Wikipedia article on 
<a href="https://en.wikipedia.org/wiki/GIS_file_formats" target="_blank">
GIS file formats.</a>

</div>

## Storing Spatial Data On Your Computer

Sometimes it makes sense to store your data in a specific data directory that you
use for one particular project. However, when you work with spatial data on your
computer, consider storing large data sets in a general data directory that you
can easily access from many projects. It's  common to use the same spatio-temporal
data for different projects and it uses excessive hard drive space to store the 
same data several times. If you are working in a collaborative 
environment, use a shared data directory. 

## Types of Spatial Data
Spatial data are represented in many different ways and are stored in different
file formats. These formats can be challenging to navigate. In this tutorial, 
we will focus on the two main categories - raster and vector.

### Vector Data - Points, Lines, Polygons

Vector format data, are often used to store things like road and plot locations, 
boundaries of states, countries and lakes. 

Vector data are composed of discrete geometric locations (x,y values) known as
**vertices** that define the "shape" of the spatial object. The organization 
of the vertices, determines the type of vector that we are working 
with: point, line or polygon.

<figure>
    <a href="{{ site.baseurl }}/images/dc-spatial-vector/pnt_line_poly.png">
    <img src="{{ site.baseurl }}/images/dc-spatial-vector/pnt_line_poly.png"></a>
    <figcaption> There are 3 types of vector objects: points, lines or 
    polygons. Each object type has a different structure. 
    Image Source: National Ecological Observatory Network (NEON) 
    </figcaption>
</figure>

* **Points:** Each individual point is define by a single x, y coordinate.
There can be many points in a vector point file. Examples of point data include:
sampling locations, the location of individual trees or the location of plots.
* **Lines:** Lines are composed of many (at least 2) vertices, or points, that
are connected. For instance, a road or a stream may be represented by a line. This
line is composed of a series of segments, each "bend" in the road or stream 
represents a vertex that has defined `x, y` location.
* **Polygons:** A polygon consists of 3 or more vertices that are connected and 
"closed". Thus the outlines of plot boundaries, lakes, oceans, and states or 
countries are often represented by polygons. Occasionally, a polygon can have a
hole in the middle of it (like a doughnut), this is something to be aware of but
not an issue we will deal with in this lesson.

<i class="fa fa-star"></i> **Data Note:** A shapefile will only contain one type
of vector data: points, lines OR polygons. 
{: .notice}

## Spatial Data Attributes
Each object in a shapefile, is called a `feature`. Each `feature` has one or 
more `attributes` associated with it. 

Shapefile attributes are similar to fields or columns in a spreadsheet. Each row
in the spreadsheet has a set of columns associated with it that describe the row
element. In the case of a shapefile, each row represents a spatial object - for
example, a road, represented as a line in a line shapefile, will have one "row" 
of attributes associated with it. These attributes can include different types 
of information that describe shapefile `features`. Thus, a road,
may have a name, length, number of lanes, speed limit, type of road and other
attributes stored with it. 

<figure>
    <a href="{{ site.baseurl }}/images/dc-spatial-vector/Attribute_Table.png">
    <img src="{{ site.baseurl }}/images/dc-spatial-vector/Attribute_Table.png"></a>
    <figcaption>Each spatial feature in an R spatial object has the same set of 
    associated attributes that describe or characterize the feature.
    Attribute data are stored in a separate *.dbf file. Attribute data can be
    compared to a spreadsheet. Each row in a spreadsheet represents one feature
    in the spatial object.
    Image Source: National Ecological Observatory Network (NEON) 
    </figcaption>
</figure>


<figure>
    <a href="{{ site.baseurl }}/images/dc-spatio-temporal-intro/vector-data-map.png">
    <img src="{{ site.baseurl }}/images/dc-spatio-temporal-intro/vector-data-map.png"></a>
    <figcaption>The map above contains point and line format vector data. We will
    create a map like this in the vector data tutorial series.
    Image Source: National Ecological Observatory Network (NEON) 
    </figcaption>
</figure>

### Additional Resources

<a href="https://en.wikipedia.org/wiki/GIS_file_formats" target="_blank">More 
on spatial data formats - Wikipedia</a>

### Shapefile Structure

When working with shapefiles, it is important to remember that a shapefile actually
consists of a mandatory 3 (or more) files:

* **`.shp`:** the file that contains the geometry for all features.
* **`.shx`:** the file that indexs the geometry.
* **`.dbf`:** the file that stores the attributes in a tabular format.

Those files all need to have the same
**NAME** and to be stored in the same directory (folder) to open properly in a GIS
or a tool like `R` or `Python`.

Sometimes, a shapefile will have other associated files including:

* **`.prj`:** projection format containing the coordinate system and projection 
information, a plain text file describing the projection using well-known text 
(WKT) format
* **`.sbn` and `.sbx`:** a spatial index of the features
* **`.shp.xml`:** geospatial metadata in XML format, (e.g. ISO 19115 or XML format)

## Data Management - Sharing Vector Data

When you work with a shapefile, you must keep all of the key associated
file types together. And when you share a shapefile with a colleague, it is important
to zip up all of these files into one package, before you send it to them!

We cover working with shapefiles in `R` in the [Introduction to Working With Vector Data in R]({{site.baseurl}}/tutorial-series/vector-data-series/) series.

### Vector Data in .CSV Format

The shapefile format is one (very common) way to store vector data. However, 
you may encounter is in other formats. For example, sometimes, point data are stored
as a Comma Separated Value (.CSV) format. 

We cover working with vector points in .csv format in [Vector 04: Convert from .csv to a Shapefile in R]( {{ site.baseurl}}/Vector 04: Convert from .csv to a Shapefile in R).

## Raster Data

Raster or "gridded" data are saved on a uniform grid and rendered on a map
as pixels. Each pixel contains a value that represents an area on the Earth's 
surface.

<figure>
    <a href="{{site.baseurl}}/images/dc-spatial-raster/raster_concept.png">
    <img src="{{site.baseurl}}/images/dc-spatial-raster/raster_concept.png">
    </a>
    <figcaption> Source: National Ecological Observatory Network (NEON)
    </figcaption>
</figure>


### GeoTIFF

There are many different raster data file formats. In this tutorial series, we 
will focus on the `GeoTIFF`. The `GeoTiff` format is similar to the `.tif` format,
however the `GeoTiff` format stores additional spatial `metadata`. 

### Metadata in .tif Files

The `tif` and `GeoTiff` format stores `metadata` as embedded `tif tags`. These tags 
can include the following raster metadata:

1. A Coordinate Reference System (`CRS`)
2. Spatial Extent (`extent`)
3. Values for when no data is provided (`NoData Value`)
4. The `resolution` of the data

IMPORTANT: just because a `.tif` file can store metadata tags, doesn't mean they
are always there! If the data creator doesn't actively add `.tif` tags, then 
they may not be there for us to use.  

### Metadata - Saving .tif Files in R

In `R`, and many other `GIS` tools, it's important to ensure that `.tif` tags
are properly saved when you export a `.tif`. For example, when using the `writeRaster`
function in `R`, if you do not specify the `NA` (noData) value when you export
a tiff, it will defaul to a different value which could be read in, incorrectly
in other programs!


    #if you want a NA value of -9999, then you have to specify this when you
    #export a raster file in R
    exampleRaster <- writeRaster(rasterObject, 
                                 FileName.tif, 
                                 datatype = "INT1U", 
                                 NAflag = -9999)

We cover writing `NA` values using the `writeRaster` function in R in [Raster 03: Raster Calculations in R - Subtract One Raster from Another and Extract Pixel Values For Defined Locations]({{ site.baseurl }}/R/Raster-Calculations-In-R).

<i class="fa fa-star"></i> **Data Note:** `Tif tags` - metadata tags stored within
a `tif` or `GeoTiff` file are also what your camera uses to store information about
how and when a picture was taken! And how your computer reads this metadata and 
identifies for example  the make and model of the camera or the date 
the photo was taken.  
{: .notice}


### Other Raster File Formats
* **.asc:** A comma separated text file with a spatial heading
* **Hierarchical Data Format (HDF5):** More on HDF5 formated rasters can be found on the [NEON Data Skills website](http://neondataskills.org/HDF5/Imaging-Spectroscopy-HDF5-In-R/) 
* **.grd:** An ESRI specific raster format.

### Bonus Information

#### Raster Data Types

Raster data can be continuous or categorical. Continuous rasters have a 
range of quantitative values. Some examples of continuous rasters include:

1. Precipitation maps.
2. Maps of tree height derived from LiDAR data.
3. Elevation values for a region. 

A elevation map for the NEON Harvard Forest field site, derived from the  
<a href="http://www.neoninc.org/science-design/collection-methods/airborne-remote-sensing" target="_blank"> 
NEON AOP LiDAR sensor</a> 
is below. Notice that elevation is a continuous numeric variable. The legend
represents the continuous range of values in the data spanning 300 to 420
meters.

![ ]({{ site.baseurl }}/images/rfigs/dc-spatio-temporal-intro/02-spatial-data-formats/elevation-map-1.png) 

Some rasters contain categorical data. Thus each pixel represents a discrete
class such as a landcover type ("forest") rather than a continuous value such as
elevation or temperature. Some examples of classified maps include:

1. Landcover / landuse maps.
2. Tree height maps classified short, medium, tall trees.
3. Elevation maps classified low, medium and high elevation.

#### Categorical Landcover Map for the United States 
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

