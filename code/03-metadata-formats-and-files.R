## ----elevation-map, include=TRUE, results="hide", echo=FALSE-------------
library(raster)
# render DSM for lesson content background
DSM_HARV <- raster("NEON-DS-Airborne-Remote-Sensing/HARV/DSM/HARV_dsmCrop.tif")

# code output here - DEM rendered on the screen
plot(DSM_HARV,
      main="A Dataset You Are Given\n What metric does it represent?\nHow Was It Processed??")


## ----challenge-1, echo=FALSE---------------------------------------------

# the idea is that we have no idea what this raster represents (what metric),
# what the units are, what the scale represents. When it was collected. 
# this should engage the participants in a discussion of how do we share / document
# data efficiently for sharing.


## ----load-libraries------------------------------------------------------
# load libraries
library(raster)
library(rgdal)

# set working directory to ensure R can find the file we wish to import
# setwd("working-dir-path-here")

# open DSM using the raster package
DSM_HARV <- raster("NEON-DS-Airborne-Remote-Sensing/HARV/DSM/HARV_dsmCrop.tif")

# view Coordinate Reference System (note this often contains horizontal units!)
crs(DSM_HARV)


## ----crs-class-----------------------------------------------------------
# assign crs to an object (class) to use for reprojection and other tasks
myCRS <- crs(DSM_HARV)
myCRS

# what class is the new CRS object?
class(myCRS)
# view spatial extent
extent(DSM_HARV)

# view spatial resolution
res(DSM_HARV)


## ----view-extent---------------------------------------------------------
# view object extent
myExtent <- extent(DSM_HARV)
myExtent
class(myExtent)

# view other attributes of the raster
DSM_HARV

## ----challenge-extent, echo=FALSE----------------------------------------

# 1. they should create both objects
CHM.HARV <- raster("NEON-DS-Airborne-Remote-Sensing/HARV/CHM/HARV_chmCrop.tif")
crs(CHM.HARV)
extent(CHM.HARV)

# 2. the extent and CRS should be the same
# 3. The extent and CRS are different. 
ndvi1.HARV <- raster("NEON-DS-Landsat-NDVI/HARV/2011/ndvi/005_HARV_ndvi_crop.tif")
crs(ndvi1.HARV)
extent(ndvi1.HARV)

## ----install-EML-package, results="hide", warning=FALSE------------------
# install R EML tools
# library("devtools")
# install_github("ropensci/EML", build=FALSE, dependencies=c("DEPENDS", "IMPORTS"))

# load ROpenSci EML package
library("EML")

# load ggmap for mapping
library(ggmap)


# EML / data location
# http://harvardforest.fas.harvard.edu:8080/exist/apps/datasets/showData.html?id=hf001
# table 4 http://harvardforest.fas.harvard.edu/data/p00/hf001/hf001-04-monthly-m.csv

## ----read-eml, warning=FALSE, message=FALSE------------------------------
# import EML from Harvard Forest Met Data
# note: the original xml file is below commented out
# eml_HARV <- read_eml("http://harvardforest.fas.harvard.edu/data/eml/hf001.xml")
# import a truncated version of the eml file for quicker demonstration
eml_HARV <- read_eml("http://neon-workwithdata.github.io/NEON-R-Spatio-Temporal-Data-and-Management-Intro/hf001-revised.xml")

# view size of object
object.size(eml_HARV)

# view the object class
class(eml_HARV)


## ----view-eml-content----------------------------------------------------
# view the contact name listed in the file
eml_HARV@dataset@creator

# view information about the methods used to collect the data as described in EML
eml_HARV@dataset@methods


## ----map-location, warning=FALSE, message=FALSE--------------------------

# grab x coordinate from the coverage information
XCoord <- eml_HARV@dataset@coverage@geographicCoverage[[1]]@boundingCoordinates@westBoundingCoordinate@.Data

# grab y coordinate from the coverage information
YCoord <- eml_HARV@dataset@coverage@geographicCoverage[[1]]@boundingCoordinates@northBoundingCoordinate@.Data



# plot the NW corner of the site.
map <- get_map(location='massachusetts', maptype = "toner", zoom =8)

ggmap(map, extent=TRUE) +
  geom_point(aes(x=as.numeric(XCoord),y=as.numeric(YCoord)), 
             color="darkred", size=6, pch=18)


## ----metadata-challenge-1, echo=FALSE------------------------------------
# Metadata Notes from hf001_10-15-m_Metadata.txt
# 1. 2001-2015
# 2. Emery Boos - located at the top of the document, email is available
# 3. a lat long is available in the metadata at the top, we see the location described
# as Prospect Hill Tract (Harvard Forest). 
# 4. 342 m elevation, the veg type is not clear in the metadata
# 5. Found in the methods: Delayed melting of snow and ice (caused by problems with rain gage heater or heavy precipitation) is noted in log - daily values are corrected if necessary but 15-minute values are not. The gage may underestimate actual precipitation under windy or cold conditions.
# 6. this could be a discussion. things like units, time zone, etc are all useful
# if accessed programmatically


