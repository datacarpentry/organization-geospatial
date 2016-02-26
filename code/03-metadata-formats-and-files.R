## ----elevation-map, include=TRUE, results="hide", echo=FALSE-------------
#render DSM for lesson content background
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

# render DSM for lesson content background
DSM_HARV <- raster("NEON-DS-Airborne-Remote-Sensing/HARV/DSM/HARV_dsmCrop.tif")

# view Coordinate Reference System (note this often contains horizontal units!)
crs(DSM_HARV)

# assign crs to an object (class) to use for reprojection and other tasks
myCRS <- crs(DSM_HARV)
myCRS

# view spatial extent
extent(DSM_HARV)

# view spatial resolution
res(DSM_HARV)

DSM_HARV

## ----install-EML-package, results="hide", warning=FALSE------------------
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

## ----read-eml------------------------------------------------------------
# import EML from Harvard Forest Met Data
eml_HARV <- eml_read("http://harvardforest.fas.harvard.edu/data/eml/hf001.xml")

# view size of object
object.size(eml_HARV)

# view the object class
class(eml_HARV)

## ----view-eml-content----------------------------------------------------
# view the contact name listed in the file
# this works well!
eml_get(eml_HARV,"contact")

# grab all keywords in the file
eml_get(eml_HARV,"keywords")

# figure out the extent & temporal coverage of the data
eml_get(eml_HARV,"coverage")


## ----map-location, warning=FALSE, message=FALSE--------------------------
# grab x coordinate
XCoord <- eml_HARV@dataset@coverage@geographicCoverage@boundingCoordinates@westBoundingCoordinate
# grab y coordinate
YCoord <- eml_HARV@dataset@coverage@geographicCoverage@boundingCoordinates@northBoundingCoordinate


# map <- get_map(location='Harvard', maptype = "terrain")
map <- get_map(location='massachusetts', maptype = "toner", zoom =8)

ggmap(map, extent=TRUE) +
  geom_point(aes(x=XCoord,y=YCoord), 
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


