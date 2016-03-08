---
layout: post
title: "Spatial Intro 02: Spatial Data Formats -- Intro to Shapefiles (Vector Data)
and GeoTiffs (Raster Data)"
date:   2015-10-28
authors: [Leah A. Wasser, Megan A. Jones]
contributors: [ ]
dateCreated: 2015-10-23
lastModified: 2016-03-08
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
permalink: /R/spatial-data-formats
comments: true
---

{% include _toc.html %}

## About
This tutorial covers the basics of key data formats that may contain spatial 
information including shapefile, Geotiff and csv. description here. It also 
provides a brief list of other formats that you may encounter when working with 
spatial data.

**R Skill Level:** Beginner

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

## Get Started With Your Project -  File Organization

When we work with large, spatio-temporal data, it is a good idea to store large 
data sets in a general data directory that you can easily access from many 
projects. If you are working in a collaborative 
environment, use a shared data directory. 

## One Dataset - Many Files

While text files often are self contained (one CSV) is composed of one unique file,
many spatial formats contain several files. For instance, a shapefile (discussed 
below) contains 3 or more files, all of which must retain the same NAME and be
stored in the same file directory, in order for you to be able to work with them.
We will discuss these issues as they related to two key spatial data formats - 
.shp (shapefile) which stores **vector** data and .tif (geotiff) which stores
**raster** data in more detail, below. 


### Vector Data - Points, Lines, Polygons

Vector data, are often used to store things like road and plot locations, 
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


    # load libraries required to work with spatial data
    library(raster) # commands to view metadata from vector objects
    library(rgdal) # library of common GIS functions
    
    # Open shapefile
    roads_HARV <- readOGR("NEON-DS-Site-Layout-Files/HARV","HARV_roads")

    ## OGR data source with driver: ESRI Shapefile 
    ## Source: "NEON-DS-Site-Layout-Files/HARV", layer: "HARV_roads"
    ## with 13 features
    ## It has 15 fields

    # view slots available for the object
    slotNames(roads_HARV)

    ## [1] "data"        "lines"       "bbox"        "proj4string"

    # view all methods available for that object
    # methods(class = class(roads_HARV))




## Stucture of a Lines Feature 

If we are working with a shapefile containing **line** data, then each line
consists of 2 or more vertices that are connected. We can view each set of coordinates
for that object using `R`.


    # view the coordinates for each vertex, for the last feature in the spatial object
    roads_HARV@lines[13]

    ## [[1]]
    ## An object of class "Lines"
    ## Slot "Lines":
    ## [[1]]
    ## An object of class "Line"
    ## Slot "coords":
    ##           [,1]    [,2]
    ##  [1,] 732479.6 4713107
    ##  [2,] 732485.9 4713115
    ##  [3,] 732498.2 4713148
    ##  [4,] 732496.7 4713211
    ##  [5,] 732487.1 4713259
    ##  [6,] 732486.9 4713279
    ##  [7,] 732488.9 4713322
    ##  [8,] 732491.1 4713349
    ##  [9,] 732504.8 4713377
    ## [10,] 732528.3 4713443
    ## [11,] 732533.0 4713476
    ## [12,] 732528.8 4713506
    ## [13,] 732522.0 4713534
    ## [14,] 732509.9 4713569
    ## [15,] 732496.6 4713604
    ## [16,] 732479.4 4713639
    ## [17,] 732463.5 4713670
    ## [18,] 732454.0 4713697
    ## [19,] 732439.3 4713734
    ## [20,] 732428.8 4713763
    ## [21,] 732416.5 4713816
    ## [22,] 732414.5 4713829
    ## [23,] 732413.4 4713845
    ## [24,] 732415.0 4713879
    ## [25,] 732416.5 4713905
    ## [26,] 732421.4 4713932
    ## [27,] 732427.6 4713961
    ## [28,] 732437.7 4713996
    ## [29,] 732449.0 4714027
    ## [30,] 732465.3 4714068
    ## [31,] 732474.8 4714085
    ## [32,] 732485.4 4714097
    ## [33,] 732500.5 4714110
    ## [34,] 732517.8 4714122
    ## [35,] 732544.8 4714135
    ## [36,] 732565.0 4714153
    ## [37,] 732624.9 4714162
    ## [38,] 732682.9 4714177
    ## [39,] 732764.1 4714184
    ## [40,] 732843.3 4714200
    ## [41,] 732915.8 4714219
    ## [42,] 732991.7 4714236
    ## [43,] 733067.5 4714255
    ## [44,] 733106.4 4714260
    ## [45,] 733170.0 4714259
    ## [46,] 733239.0 4714246
    ## [47,] 733295.5 4714217
    ## 
    ## 
    ## 
    ## Slot "ID":
    ## [1] "12"

    # view the coordinates for the last feature in the spatial object
    roads_HARV@lines[14]

    ## [[1]]
    ## NULL


<div id="challenge" markdown="1">
Question - Why didn't `roads_HARV@lines[14]` return any vertex coordinates?
</div>

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


    # view all attributes for a spatial object
    # note, the code below just looks at the first 3 features
    head(roads_HARV@data, 3)

    ##   OBJECTID_1 OBJECTID       TYPE             NOTES MISCNOTES RULEID
    ## 0         14       48 woods road Locust Opening Rd      <NA>      5
    ## 1         40       91   footpath              <NA>      <NA>      6
    ## 2         41      106   footpath              <NA>      <NA>      6
    ##            MAPLABEL SHAPE_LENG             LABEL BIKEHORSE RESVEHICLE
    ## 0 Locust Opening Rd  1297.3571 Locust Opening Rd         Y         R1
    ## 1              <NA>   146.2998              <NA>         Y         R1
    ## 2              <NA>   676.7180              <NA>         Y         R2
    ##   RECMAP Shape_Le_1                            ResVehic_1
    ## 0      Y  1297.1062    R1 - All Research Vehicles Allowed
    ## 1      Y   146.2998    R1 - All Research Vehicles Allowed
    ## 2      Y   676.7181 R2 - 4WD/High Clearance Vehicles Only
    ##                    BicyclesHo
    ## 0 Bicycles and Horses Allowed
    ## 1 Bicycles and Horses Allowed
    ## 2 Bicycles and Horses Allowed


<figure>
    <a href="{{ site.baseurl }}/images/dc-spatio-temporal-intro/plot-color.png">
    <img src="{{ site.baseurl }}/images/dc-spatio-temporal-intro/plot-color.png"></a>
    <figcaption>The map above contains point and line format vector data. We will
    create a map like this in the vector data tutorial series.
    Image Source: National Ecological Observatory Network (NEON) 
    </figcaption>
</figure>

<div id="challenge" markdown="1">

## Challenge: Shapefiles

For the map **Study Plots by Soil Type**, what is the minimum number of 
shapefiles that are required to create this map? How do you know? 

</div>



### Additional Resources

<a href="https://en.wikipedia.org/wiki/GIS_file_formats" target="_blank">More 
on spatial data formats - Wikipedia</a>

### Shapefile Structure

When working with shapefiles, it is important to remember that a shapefile actually
consists of a mandatory 3 (or more) files:

* **`.shp`:** the file that contains the geometry for all features.
* **`.shx`:** the file that indexes the geometry.
* **`.dbf`:** the file that stores feature attributes in a tabular format.

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

We cover working with vector points in .csv format in [Vector 04: Convert from .csv to a Shapefile in R](http://neondataskills.org/Vector 04: Convert from .csv to a Shapefile in R).

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


    # view attributes for a geotif file
    GDALinfo("NEON-DS-Airborne-Remote-Sensing/HARV/CHM/HARV_chmCrop.tif")

    ## rows        1367 
    ## columns     1697 
    ## bands       1 
    ## lower left origin.x        731453 
    ## lower left origin.y        4712471 
    ## res.x       1 
    ## res.y       1 
    ## ysign       -1 
    ## oblique.x   0 
    ## oblique.y   0 
    ## driver      GTiff 
    ## projection  +proj=utm +zone=18 +datum=WGS84 +units=m +no_defs 
    ## file        NEON-DS-Airborne-Remote-Sensing/HARV/CHM/HARV_chmCrop.tif 
    ## apparent band summary:
    ##    GDType hasNoDataValue NoDataValue blockSize1 blockSize2
    ## 1 Float64           TRUE       -9999          1       1697
    ## apparent band statistics:
    ##   Bmin  Bmax   Bmean      Bsd
    ## 1    0 38.17 18.0978 5.321834
    ## Metadata:
    ## AREA_OR_POINT=Area

    # import geotiff
    chm_HARV <- raster("NEON-DS-Airborne-Remote-Sensing/HARV/CHM/HARV_chmCrop.tif")
    
    chm_HARV

    ## class       : RasterLayer 
    ## dimensions  : 1367, 1697, 2319799  (nrow, ncol, ncell)
    ## resolution  : 1, 1  (x, y)
    ## extent      : 731453, 733150, 4712471, 4713838  (xmin, xmax, ymin, ymax)
    ## coord. ref. : +proj=utm +zone=18 +datum=WGS84 +units=m +no_defs +ellps=WGS84 +towgs84=0,0,0 
    ## data source : /Users/lwasser/Documents/data/1_DataPortal_Workshop/1_WorkshopData/NEON-DS-Airborne-Remote-Sensing/HARV/CHM/HARV_chmCrop.tif 
    ## names       : HARV_chmCrop 
    ## values      : 0, 38.17  (min, max)


### Metadata in .tif Files

The `tif` and `GeoTiff` format stores `metadata` as embedded `tif tags`. These tags 
can include the following raster metadata:

1. A Coordinate Reference System (`CRS`)
2. Spatial Extent (`extent`)
3. Values for when no data is provided (`NoData Value`)
4. The `resolution` of the data

We will explore metadata in tif files in the next, lessons - 
[Spatial Intro 03: Data About Data -- Intro to Metadata File Formats and Structure]({{ site.baseurl }}R/metadata-file-formats-structures)

IMPORTANT: just because a `.tif` file can store metadata tags, doesn't mean they
are always there! If the data creator doesn't actively add `.tif` tags, then 
they may not be there for us to use.  

### Metadata - Saving .tif Files in R

In `R`, and many other `GIS` tools, it's important to ensure that `.tif` tags
are properly saved when you export a `.tif`. For example, when using the `writeRaster`
function in `R`, if you do not specify the `NA` (noData) value when you export
a tiff, it will defaul to a different value which could be read in, incorrectly
in other programs!


    # if you want a NA value of -9999, then you have to specify this when you
    # export a raster file in R
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
* **Hierarchical Data Format (HDF5):** More on HDF5 formated rasters can be found on the [NEON Data Skills website](http://neondataskills.org/HDF5/) 
* **.grd:** An ESRI specific raster format.



