## ----elevation-map, include=TRUE, results="hide", echo=FALSE-------------
#render DSM for lesson content background
DSM_HARV <- raster("NEON-DS-Airborne-Remote-Sensing/HARV/DSM/HARV_dsmCrop.tif")

# code output here - DEM rendered on the screen
plot(DSM_HARV)


