## ----import-vector, warning=FALSE----------------------------------------

# load libraries required to work with spatial data
#library(raster) # commands to view metadata from vector objects
# library(rgdal) # library of common GIS functions
library(terra)


# Open shapefile
roads_HARV <- vect("NEON-DS-Site-Layout-Files/HARV/HARV_roads.shp")

# view slots available for the object
slotNames(roads_HARV)

# view all methods available for that object
# methods(class = class(roads_HARV))


## ----view-lines-coordinates----------------------------------------------

# view the coordinates for each vertex, for the last feature in the spatial object
length(roads_HARV)
names(roads_HARV)

geom(roads_HARV[13])



## ----view-attributes-----------------------------------------------------
# view all attributes for a spatial object
# note, the code below just looks at the first 3 features
head(names(roads_HARV), 3)


## ----challenge-code-shapefiles, echo=FALSE-------------------------------


# Two. There are both points (study plots labelled in legend by the soil type)
# and lines (the boardwalk, footpath, stone walls, and woods road in legend) in
# this map. Since there are two different types of vectors (points & lines)
# there must be two shapefiles as a single shapefile can only contain 1 type of
# vector data.


## ----import-tif----------------------------------------------------------
# view attributes for a geotif file
CHM_HARV <- rast("NEON-DS-Airborne-Remote-Sensing/HARV/CHM/HARV_chmCrop.tif")

CHM_HARV


## ----na-value-tiff, eval=FALSE-------------------------------------------
## 
## # if you want a NA value of -9999, then you have to specify this when you
## # export a raster file in R
## exampleRaster <- writeRaster(rasterObject,  # object to export/write
##                              FileName.tif,  # name of new .tif file
##                              datatype = "INT1U",  # the data type
##                              NAflag = -9999)  # your desired NA or noData value

