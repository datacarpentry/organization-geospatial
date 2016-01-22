---
layout: post
title: "Lesson 03: Data About Data -- Intro to Metadata File Formats and Structure"
date:   2015-10-27
authors: []
contributors: [ ]
dateCreated: 2015-10-23
lastModified: 2016-01-22
packagesLibraries: [ ]
category: [self-paced-tutorial] 
tags: [R, GIS-Spatial-Data, metadata-eml, informatics]
mainTag: spatial-data-management-series
description: "This lesson introduces key metadata formats including FGDC and EML. It 
provides basic approaches for understanding these formats and how to work with these formats."
code1: 03-metadata-formats-and-files.R
image:
  feature: NEONCarpentryHeader_2.png
  credit: A collaboration between the National Ecological Observatory Network (NEON) and Data Carpentry
  creditlink: http://www.neoninc.org
permalink: R/metadata-file-formats-structures
comments: false
---

{% include _toc.html %}

##About
Add description.

**R Skill Level:** Intermediate - you've got the basics of `R` down.

<div id="objectives" markdown="1">

#Goals / Objectives

After completing this activity, you will:

* Understand that metadata come in many formats and must be maintained with the
data. 
* Understand that there is necessary metadata associated with and/or embedded in
the data.
* Understand that collecting data requires/includes collecting the metadata.
* Be able to create metadata files for different data types. 

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

* <a href="http://cran.r-project.org/web/packages/raster/raster.pdf" target="_blank">

</div>


![ ]({{ site.baseurl }}/images/rfigs/03-metadata-formats-and-files/elevation-map-1.png) 


<div id="challenge" markdown="1">
##Challenge: What Do I Know About My Data?
The figure above is a map created from the file `HARV_dsmCrop.tif`.  That is all
you know.  What other information would you like to know about this map and the
data contained in the file before you would feel comfortable using
this data to address your research question or to build a map for publication? 

</div>


Information that we might want to know are listed below, with the information
that we can gather from the map:

* Where is this?  -- The file name says HARV. Is that a location abbreviation?
... really we have no idea.  
* What is the file format? -- .tif means it is likely a GeoTIFF.  
* What coordinate reference system are the coordinates in?  -- Can't tell. 
* When was the data collected to lead to this map?  -- Can't tell
* How was the map created? -- Can't tell 
* What’s being measured? -- The file name contains DSM which often denotes a 
Digital Surface Model so it might be elevation but we're not 100% sure.   
* What units? -- Can't tell

Obviously we need more data about the data: metadata!

##What is Metadata?  Why is it Needed?
Metadata is structured data describing a dataset. Among other things metadata
should include by whom and how the data was collected or created, the units and
data structure, and spatial attributes. With spatial data there is information
that's necessary to understand it, but usually isn't included in the file. 
This is the metadata: data about the data.

###Ancillary Data
Each element in the file can have more data associated with it. This can be
information like a measured time series for a single, individual point or
vector. Ancillary data often appears as a .csv file. They don't have an explicit
spatial element (although they apply to a spatial element). You have to attach
that data to the spatial data information.


###Why is it useful
Need to document where the data came from and how it was produced
also in the case of structured, digital metadata (e.g. EML) it can be used to automate workflows. For instance, things like scale factors, units, and uncertainty values may be stored in metadata and accessed programmatically to convert / transform data within an algorithm.

##Where to find it? 
Metadate can be found in many different locations (in decreasing order of
usefulness): 

* embedded in the file (GeoTIFFs)
* a separate file that contains this information (EML, .txt or .csv)
* in the download directory
* listed on the web site as text or in a seperate directory
* in the original data collector's field notebook  

The location and format will vary with the provider and the data type.  A best
case scenario is that the data & it's metadata are embedded with the data
(GeoTIFFs) or in a downloadable package that is machine readible (.txt, .xml or
EML formats).  Less useful but still usable is when the metadata are available
in another format on the website, repository, or portal where the data were
download.  The worst case senario is that there is no additional metadata 
readily available, this may result in unusable data or extensive additonal
background work by the user.  

##Structured File Formats (very high level):
** provide examples of each of the above - we have that from the harvard met data and the EML file- i can pull XML and a file with a header - the daylength files have a header i think?

###Ecological Metadata Language (EML): XML based format… more here 
eg harvard forest LTER
Code chunk showing some EML
** link out to EML lesson (in NEON-DS-Lesson-Development Repo: {{ site.baseurl }}/R/EML)

###XML - common for GIS ….
Code chunk showing XML

###Web pages with text - EG harvard forest LTER
screen shots?

###HEADERS of text files
eg raster .asc files
** provide examples of each of the above - we have that from the harvard met data and the EML file- i can pull XML and a file with a header - the daylength files have a header i think? 
little activities to go look at metadata…







