## ----na-value-tiff, eval=FALSE-------------------------------------------
## 
## #if you want a NA value of -9999, then you have to specify this when you
## #export a raster file in R
## exampleRaster <- writeRaster(rasterObject,
##                              FileName.tif,
##                              datatype = "INT1U",
##                              NAflag = -9999)

## ----elevation-map, include=TRUE, results="hide", echo=FALSE-------------
#load libraries
library(raster)
library(rgdal)


#render DSM for lesson content background
DSM_HARV <- raster("NEON-DS-Airborne-Remote-Sensing/HARV/DSM/HARV_dsmCrop.tif")

# code output here - DEM rendered on the screen
plot(DSM_HARV, main="Continuous Elevation Map\n NEON Harvard Forest Field Site")


