## ----crs-strings---------------------------------------------------------

library('rgdal')
epsg = make_EPSG()
#View(epsg)
head(epsg)

## ----view-extent---------------------------------------------------------
# View the extent of the raster
DEM@extent


## ----calculate-raster-extent---------------------------------------------
#create a raster from the matrix
myRaster1 <- raster(nrow=4, ncol=4)
    
#assign some random data to the raster
myRaster1[]<- 1:ncell(myRaster1)
    
#view attributes of the raster
myRaster1

#is the CRS defined?
myRaster1@crs

#what are the data extents?
myRaster1@extent
plot(myRaster1, main="Raster with 16 pixels")

## ----raster-attributes---------------------------------------------------
#load raster library
library(raster)
library(rgdal)
    
# Load raster in an R object called 'DEM'
DEM <- raster("DigitalTerrainModel/SJER2013_DTM.tif")  
    
# View raster attributes 
DEM


## ----change-raster-resolution--------------------------------------------
myRaster2 <- raster(nrow=8, ncol=8)
myRaster2 <- resample(myRaster1, myRaster2, method='bilinear')
myRaster2

plot(myRaster2, main="Raster with 32 pixels")

myRaster3 <- raster(nrow=2, ncol=2)
myRaster3 <- resample(myRaster1, myRaster3, method='bilinear')
myRaster3

plot(myRaster3, main="Raster with 4 pixels")

myRaster4

plot(myRaster4, main="Raster with 1 pixels")

