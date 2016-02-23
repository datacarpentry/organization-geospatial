---
layout: post
title: "Spatial Intro 03: Data About Data -- Intro to Metadata File Formats and Structure"
date:   2015-10-27
authors: [Leah A. Wasser, Megan A. Jones]
contributors: [ ]
dateCreated: 2015-10-23
lastModified: 2016-02-17
packagesLibraries: [raster, rgdal, eml, devtools]
category: [self-paced-tutorial] 
tags: [R, spatial-data-gis, metadata]
mainTag: spatial-data-management-series
workshopSeries: [spatial-data-management-series]
description: "This tutorial covers what metadata are, and why we need to work with
metadata. It discusses metadata in the context of spatio-temporal data. It 
covers the 3 most common metadata formats: text file format, 
web page format and Ecological Metadata Language (EML)."
code1: 03-metadata-formats-and-files.R
image:
  feature: NEONCarpentryHeader_2.png
  credit: A collaboration between the National Ecological Observatory Network (NEON) and Data Carpentry
  creditlink: 
permalink: R/metadata-file-formats-structures
comments: true
---

{% include _toc.html %}

## About
This tutorial covers what metadata are, and why we need to work with
metadata. It discusses metadata in the context of spatio-temporal data. It 
covers the 3 most common metadata formats: text file format, 
web page format and Ecological Metadata Language (EML).

**R Skill Level:** Introduction - You are just learning about metadata.

<div id="objectives" markdown="1">

# Goals / Objectives

After completing this activity, you will:

* Understand that metadata come in many formats and must be maintained with the
data. 
* Understand that there is necessary metadata associated with and/or embedded in
the data.
* Understand that collecting data requires/includes collecting the metadata.
* Be able to create metadata files for different data types. 

## Things You’ll Need To Complete This Lesson
To complete this lesson you will need the most current version of R, and 
preferably, RStudio loaded on your computer.

### Install R Packages

* **raster:** `install.packages("raster")`
* **rgdal:** `install.packages("rgdal")`

**OPTIONAL**
* **devtools** `install.packages("devtools")` 
* **eml** `install_github("ropensci/EML", build=FALSE, dependencies=c("DEPENDS", "IMPORTS"))`


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

* <a href="http://cran.r-project.org/web/packages/raster/raster.pdf" target="_blank">

</div>


![ ]({{ site.baseurl }}/images/rfigs/dc-spatio-temporal-intro/03-metadata-formats-and-files/elevation-map-1.png) 


<div id="challenge" markdown="1">
## Challenge: What Do I Know About My Data?

The figure above was create from a that you are given called: `HARV_dsmCrop.tif`.  
What other information would you like to know about the data used to create the 
above map before you would feel comfortable using this data to address a 
research question? 

</div>



## Why Do We Need Metadata?

Looking at the map above, we are missing information needed to begin working with
the data effectively including:

**Spatial Information**
* **Spatial Extent:** What area does this dataset cover? 
* **Coordinate reference system: ** what spatial projection / coordinate reference
system are used to store the data? Will it line up with other data? 
* **Resolution:** The data appears to be in **raster** format. This means it is
composed of pixels. What area on the ground does each pixel cover - ie What is 
its spatial resolution?

**Data Collection / Processing Methods**
* **How was this data generated?** Is this an output from a model, is it an image
from a remote sensing instrument such as a satellite (e.g. landsat) or collected
from an airplane? How were the data colected?
* **Units:** We can see a scale bar of values to the right of the data however, 
what units / metric does this represent? Temperature? Elevation? Precipitation?
* **How were the data processed?**

**Contact Information**
* Who created this data? Who do we contact if we have questions?

When we are given a dataset, or when we download it online, we do not know anything
about it without proper documentation. This documentation is called **metadata** - 
data about the data.

## What is Metadata?
Metadata is structured information that describes a dataset. It includes a suite of
information about the data including:

* contact information
* spatial extent / other spatila attributes
* processing methods
* and more.

Without sufficient documentation, it is difficult for us to work with 
external data - data that we did not collect ourselves!

### Why Are Metadata Needed?
We need metadata to not only work with external data, but also when it's embedded
in a file or in provided in a machine readable format, we can access it directly
in tools like `R` or `Python`. We will talk about different metadata formats,
next.

## Metadata Formats

Metadata come in different formats. We will discuss three of those in this tutorial:


* **Embedded in a File:** `Geotiffs` and `HDF5`
* **Ecological Metadata Language (EML):** A standardized metadata format stored 
in `xml` format which is machine readable. Metadata has some standards however it's
common to encounter metadata stored differently in EML files created by different
organizations.
* **Text file:** Sometimes metadata files can be found in text files that are either
downloaded with a data product OR that are available separately for the data. 
* **Directly on a website (HTML / XML):** Sometimes data are documented directly
in text format, on a web page. 



<i class="fa fa-star"></i> **Data Tip:** When you find metadata for a dataset 
that you are working with, **DOWNLOAD AND SAVE IT** immediately to a directory 
on your computer where you saved the data. It is also a good idea to document
the URL where you found the metadata and the data in a "readme" text file!
{: .notice}


## Embedded Metadata - Geotiff

If we want to automate workflows, it's ideal when key metadata required to process
our data are embedded directly in our data files. The **geotiff** (`fileName.tif`) 
is one common spatio-temporal format that can store **metadata** directly in the
`.tif` file itself.

## What is a GeoTIFF??

A `geotiff` file stores metadata or attributes about the file as embedded `tif tags`. 
A GeoTIFF is a standard `.tif` image format with additional spatial (georeferencing)
information embedded in the file as tags. These tags can include the following raster metadata:

1. A Coordinate Reference System (`CRS`)
2. Spatial Extent (`extent`)
3. Values for when no data is provided (`NoData` Value)
4. The `resolution` of the data

<i class="fa fa-star"></i> **Data Tip:**  Your camera uses embedded tags to store
information about pictures that you take including the camera make and model, 
and the time the image was taken!
{: .notice }

More about the  `.tif` format:

* <a href="https://en.wikipedia.org/wiki/GeoTIFF" target="_blank"> GeoTIFF on Wikipedia</a>
* <a href="https://trac.osgeo.org/geotiff/" target="_blank"> OSGEO TIFF documentation</a>

The `Raster` package in `R` allows us to directly access tif tags programatically.
We can quickly view the spatial `extent`, `coordinate reference system` and `resolution` 
of the data. 


    #load libraries
    library(raster)
    library(rgdal)
    
    #set working directory to ensure R can find the file we wish to import
    #setwd("working-dir-path-here")
    
    #render DSM for lesson content background
    DSM_HARV <- raster("NEON-DS-Airborne-Remote-Sensing/HARV/DSM/HARV_dsmCrop.tif")
    
    #view Coordinate Reference System (note this often contains horizontal units!)
    crs(DSM_HARV)

    ## CRS arguments:
    ##  +proj=utm +zone=18 +datum=WGS84 +units=m +no_defs +ellps=WGS84
    ## +towgs84=0,0,0

    #assign crs to an object (class) to use for reprojection and other tasks
    myCRS <- crs(DSM_HARV)
    myCRS

    ## CRS arguments:
    ##  +proj=utm +zone=18 +datum=WGS84 +units=m +no_defs +ellps=WGS84
    ## +towgs84=0,0,0

    #view spatial extent
    extent(DSM_HARV)

    ## class       : Extent 
    ## xmin        : 731453 
    ## xmax        : 733150 
    ## ymin        : 4712471 
    ## ymax        : 4713838

    #view spatial resolution
    res(DSM_HARV)

    ## [1] 1 1

    DSM_HARV

    ## class       : RasterLayer 
    ## dimensions  : 1367, 1697, 2319799  (nrow, ncol, ncell)
    ## resolution  : 1, 1  (x, y)
    ## extent      : 731453, 733150, 4712471, 4713838  (xmin, xmax, ymin, ymax)
    ## coord. ref. : +proj=utm +zone=18 +datum=WGS84 +units=m +no_defs +ellps=WGS84 +towgs84=0,0,0 
    ## data source : /Users/lwasser/Documents/data/1_DataPortal_Workshop/1_WorkshopData/NEON-DS-Airborne-Remote-Sensing/HARV/DSM/HARV_dsmCrop.tif 
    ## names       : HARV_dsmCrop 
    ## values      : 305.07, 416.07  (min, max)


We can in turn use this information to programtically perform processing tasks 
on our data including reprojections, cropping and more.

#We will do this in the vector and raster data series! <<link to tutorial series
landing pages>>

### Hierarchical Data Formats (HDF5)
HDF5 is another file type which supports embedded metadata format. Check out the 
following lessons on creating and working with HDF5 for more

# NEED TO ADD THESE LINKS

* LINK ONE
* link two


## Structured Metadata - EML
A second type of metadata is found in a **separate document**. This document
may be 

1. **Carefully structured** So that we can access metadata contents programatically
(e.g. EML)
2. **Written out in text or web page format** This is less ideal as it means we have
to manually extract key metadata attributes to use in our code but it is often useful
if we are reading about data collection and processing methods which may be 
length and detailed to support reproducible workflows.

We will briefly look at both structured and unstructured metadata formats, next.


## Structured Metadata - Introduction to EML

The Ecological Metadata Language (EML) is a data specification developed specifically
to document ecological data. An EML file is created using a `XML` based format.
This means that content is embedded within hierarchical tags. For example
the title of a dataset might be embedded in a `<title>` tag as follows:

`<title>Fisher Meteorological Station at Harvard Forest since 2001</title>`

Similarly, the creator of a dataset is also be found in a hierarchical tag
structure.


    <creator>
      <individualName>
        <givenName>Emery</givenName>
        <surName>Boose</surName>
      </individualName>
    </creator>
    

The `EML` package for `R` is designed to read and allow users to work with `EML`
formatted metadata. In this tutorial, we will overview demonstrate how we can
use EML in an automated workflow. NOTE: To save time, we will not explicetedly 
teach the `EML` package given it is still being developed. But we will provide
an example of how you can access `EML` programmatically below.

## EML Terminology

Let's first discuss some basic EML terminology. In the 
context of `EML`, a file documents a `dataset`. This `dataset` may consist of one
or more files that are documented in the `EML` document. In the case of our 
tabular meteorology data, the structure of our `EML` file includes:

1. The **dataset**. A dataset may contain
one or more data tables associated with it that may contain different types of related
information. For this Harvard meteorological data, the data tables contain tower
measurements including precipitation and temperature, that are aggregated
at various time intervales (15 minute, daily, etc) and that date back to 2001.
2. The **data tables**. Data tables refer to the actual data that make up the dataset. 
For the Harvard Data, each data table contains a suite of meterological metrics 
including precipiation and temperature (and associated quality flags), that are 
aggregated at a particular time interval. (e.g. one data table contains monthly
average data, another contains 15 minute averaged data, etc)

## Work With EML in R 

To begin, we will load the `EML` package directly from ropensci's Git repository.



    # install R EML tools
    # library("devtools")
    # install_github("ropensci/EML", build=FALSE, dependencies=c("DEPENDS", "IMPORTS"))
    
    # load ROpenSci EML package
    library("EML")
    
    # load ggmap for mapping
    library(ggmap)
    
    
    # data location
    # http://harvardforest.fas.harvard.edu:8080/exist/apps/datasets/showData.html?id=hf001
    # table 4 http://harvardforest.fas.harvard.edu/data/p00/hf001/hf001-04-monthly-m.csv

Next, we will read in the LTER `EML` file - directly from the online URL using
`eml_read`. This file documents multiple data products that can be downloaded.
<a href="http://harvardforest.fas.harvard.edu:8080/exist/apps/datasets/showData.html?id=hf001" target="_blank">
Check out the Harvard Forest Data Archive Page for Fisher Meteorological Station
for more on this dataset and to download the archive files directly.</a>

Note that because this eml file is large, it takes a few seconds for the file to 
load.



    # import EML from Harvard Forest Met Data
    eml_HARV <- eml_read("http://harvardforest.fas.harvard.edu/data/eml/hf001.xml")

    ## Error in getClass(Class, where = topenv(parent.frame())): "html" is not a defined class

    # view size of object
    object.size(eml_HARV)

    ## Error in structure(.Call(C_objectSize, x), class = "object_size"): object 'eml_HARV' not found

    # view the object class
    class(eml_HARV)

    ## Error in eval(expr, envir, enclos): object 'eml_HARV' not found

The `eml_read` function creates an `EML` class object. This object can be accessed
using `slots` in R (`@`) rather than a typical subset `[]` approach.

## Explore Metadata Attributes

We can begin to explore the contents of our EML file and associated data that it
describes. Let's start at the dataset level. We can use `eml_get` to view the 
contact information for the dataset, the keywords and it's associated temporal
and spatial (if relevant) coverage.



    # view the contact name listed in the file
    # this works well!
    eml_get(eml_HARV,"contact")

    ## Error in is(eml, "eml"): object 'eml_HARV' not found

    # grab all keywords in the file
    eml_get(eml_HARV,"keywords")

    ## Error in is(eml, "eml"): object 'eml_HARV' not found

    # figure out the extent & temporal coverage of the data
    eml_get(eml_HARV,"coverage")

    ## Error in is(eml, "eml"): object 'eml_HARV' not found


## Identify & Map Data Location

Looking at the coverage for our data, there is only one unique x and y value. This 
suggests that our data were collected at (x,y) one point location. We know this is a 
tower so a point location makes sense. Let's grab the x and y coordinates and 
create a quick context map. We will use `ggmap` to create our map.

**NOTE: if this were a rectangular extent we'd want the bounding BOX. this is important
if the data are for example, raster format, in HDF5 or something. we need the extent
to properly geolocate and process the data.**

<a href="https://www.nceas.ucsb.edu/~frazier/RSpatialGuides/ggmap/ggmapCheatsheet.pdf" target="_blank">Learn More: A nice cheatsheet for GGMAP created by NCEAS</a>


    # grab x coordinate
    XCoord <- eml_HARV@dataset@coverage@geographicCoverage@boundingCoordinates@westBoundingCoordinate

    ## Error in eval(expr, envir, enclos): object 'eml_HARV' not found

    #grab y coordinate
    YCoord <- eml_HARV@dataset@coverage@geographicCoverage@boundingCoordinates@northBoundingCoordinate

    ## Error in eval(expr, envir, enclos): object 'eml_HARV' not found

    #map <- get_map(location='Harvard', maptype = "terrain")
    map <- get_map(location='massachusetts', maptype = "toner", zoom =8)

    ## Error in readPNG(tmp): file is not in PNG format

    ggmap(map, extent=TRUE) +
      geom_point(aes(x=XCoord,y=YCoord), 
                 color="darkred", size=6, pch=18)

    ## Error in ggmap(map, extent = TRUE): object 'map' not found

The above example, demonstated how we can extract information from an `EML` document
and use it programatically in `R`! This is just the beginning of what we can do!


## Unstructured Metadata - Web pages & Text Files

## Metadata Stored on a Web Page

The metadata for the data that we are working with for the Harvard Forest field 
site are stored in both `EML` format and on a web page. Let's explore the web 
page first.

* <a href="http://harvardforest.fas.harvard.edu:8080/exist/apps/datasets/showData.html?id=hf001" target="_blank">View Harvard Forest Fisher Tower Webpage.</a>

Let's begin by visiting that page above. At the top of the page, there is a list of 
 data available for Harvard Forest. NOTE: **hf001-06: daily (metric) since 2001 
 (preview)** is the data that we used in the [previous tutorial]({{ site.baseurl }}R/Brief-Tabular-Time-Series-qplot/).

Scroll down to the **Overview** section. Take note of the information provided 
in that section and answer the following questions in the challenge below:

<div id="challenge" markdown="1">
## Challenge - Explore Metadata

Explore the metadata stored on the Harvard Forest LTER web page. Answer the 
following questions. 

1. What is the time span of the data available for this site? 
2. You have some questions about these data. Who is the lead investigator / who 
do you contact for more information? And how do you contact them? 
3. Where is this field site located? How is the site location information stored
in the metadata? Is there any information that may be useful to you viewing the location?
(HINT: what if you were not familiar with Harvard as a site / from another country, 
etc?)
4. Field Site Information: What is the elevation for the site? What is the dominant
vegetation cover for the site? HINT: is dominant vegetation easy to find in the
metadata?
5. How is snow dealt with in the precipitation data?
6. Are there some metadata attributes that might be useful to access in a script
in `R` or `Python` rather than viewed on a web page?

HINT: Can you answer all of the questions above from the information provided
on this website? Is there information that you might prefer to find on that page?
</div>



