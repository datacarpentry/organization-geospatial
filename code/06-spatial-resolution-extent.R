## ----view-extent---------------------------------------------------------
# View the extent of the raster
DEM@extent


## ----calculate-raster-extent---------------------------------------------
# create a raster from the matrix
myRaster1 <- raster(nrow=4, ncol=4)
    
# assign some random data to the raster
myRaster1[]<- 1:ncell(myRaster1)
    
# view attributes of the raster
myRaster1

# is the CRS defined?
myRaster1@crs

# what are the data extents?
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


