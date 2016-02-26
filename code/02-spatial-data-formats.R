## ----na-value-tiff, eval=FALSE-------------------------------------------
## 
## #if you want a NA value of -9999, then you have to specify this when you
## #export a raster file in R
## exampleRaster <- writeRaster(rasterObject,
##                              FileName.tif,
##                              datatype = "INT1U",
##                              NAflag = -9999)

