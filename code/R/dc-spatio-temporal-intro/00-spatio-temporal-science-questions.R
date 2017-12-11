## ----Field-Site-Map, include=TRUE, echo=FALSE, results="hide", message =FALSE, warning=FALSE----

# create a map that shows the location of BOTH field sites.
# add a legend with a point for each site.
library(rgdal)
# Read the Shapefile
State.Boundary.US <- readOGR("NEON-DS-Site-Layout-Files/US-Boundary-Layers",
          "US-State-Boundaries-Census-2014")

Boundary.US <- readOGR("NEON-DS-Site-Layout-Files/US-Boundary-Layers",
          "US-Boundary-Dissolved-States")
# palette(terrain.colors((50)))
# palette()

plot(State.Boundary.US,
     main="NEON Field Site Locations \nHarvard Forest & San Joachin Experimental Range",
     border="grey")

plot(Boundary.US,
     add=TRUE)

# add Harvard forest
# lat long: 42.5369, -72.17266

points(y=42.5369, x=-72.17266,
       col = "magenta",
       pch=19)

# Add SJER
# 37.10878, -119.73228
points(x=-119.73228,y=37.10878,
       col = "darkgreen",
       pch=19)

# add a legend to our map
legend("bottomleft",
       legend=c("Harvard Forest (HARV)","San Joachin (SJER)"),
       pch=19,
       bty="n",
       col=c("magenta", "darkgreen"),
       cex=1.2)


## ----sources-of-data, echo=FALSE-----------------------------------------

# Some sources of data are discussed below.
# some ways of finding data - repositories / data catalogs (e.g. DataOne)
# agency sites - in the US - EPA, USGS, NRCS, NOAA all have data portals
# spatial data - national map, etc
# the key component here is not that they get all of the sources - that they
# begin to think about how we find data!


## ----explore-landsat-data, echo=FALSE------------------------------------
# Answers for Harvard Forest; will vary by location
# 1. Landsat 8 (good quality), Landsat 7 EMT+ SLC-off (some problem areas),
# Landsat 7 EMT+ SLC-on (one strip of missing data), Landsat 4-5 (good quality),
# Landsat 1-5 (missing large amounts of data).


## ----challenge-code-HARV-external-data, echo=FALSE-----------------------

# 1) GIS data, Maps, Remote Sensing,
# Note: Many research stations (not all) have GIS type of data available.

# 2) Lots of text on pages & EML files

# 3) Some of the file formats found: .csv, EML, .pdf, .shp, .zip, .tiff,


