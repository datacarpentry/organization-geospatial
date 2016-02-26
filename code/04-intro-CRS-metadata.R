## ----lat-long-example----------------------------------------------------

library(rgdal)
library(ggplot2)
library(rgeos)
library(raster)
setwd("~/Documents/data")

# read shapefile
worldBound <- readOGR(dsn="Global/Boundaries/ne_110m_land", 
                      layer="ne_110m_land")

# convert to dataframe
worldBound_df <- fortify(worldBound)  

# plot map
worldMap <- ggplot(worldBound_df, aes(long,lat, group=group)) +
  geom_polygon() +
  xlab("Longitude (Degrees)") + ylab("Latitude (Degrees)") +
  coord_equal() +
  ggtitle("Global Map - Geographic Coordinate System - WGS84 Datum\n Units: Degrees - Latitude / Longitude")

worldMap


## ----add-lat-long-locations----------------------------------------------

# define locations of Boulder, CO and Oslo, Norway
loc <- data.frame(lon=c(-105.2519, 10.7500, 2.9833),
                lat=c(40.0274, 50.9500, 39.6167))

# convert to dataframe
loc.df <- fortify(loc)  

# add a point to the map
mapLocations <- worldMap + geom_point(data=loc.df, 
                      aes(x=lon, y=lat, group=NULL, colour = "purple"),
                      size=5)

mapLocations + theme(legend.position="none")


## ----global-map-robinson-------------------------------------------------

# reproject from longlat to robinson
worldBound_robin <- spTransform(worldBound,
                                CRS("+proj=robin"))

worldBound_df_robin <- fortify(worldBound_robin)

robMap <- ggplot(worldBound_df_robin, aes(long,lat, group=group)) +
  geom_polygon() +
  labs(title="World map (robinson)") +
  coord_equal()

robMap

## ----add-locations-robinson----------------------------------------------

# add a point to the map
newMap <- robMap + geom_point(data=loc.df, 
                      aes(x=lon, y=lat, group=NULL, colour = "purple"),
                      size=5)

newMap + theme(legend.position="none")


## ----reproject-robinson--------------------------------------------------

# define locations of Boulder, CO and Oslo, Norway
loc 

# convert to spatial Points data frame
loc.spdf <- SpatialPointsDataFrame(coords = loc,data=loc,
                            proj4string=crs(worldBound))  

loc.spdf
# reproject data to Robinson
loc.spdf.rob <- spTransform(loc.spdf, CRSobj = CRS("+proj=robin"))

loc.rob.df <- as.data.frame(cbind(loc.spdf.rob$lon,loc.spdf.rob$lat))
names(loc.rob.df ) <- c("X","Y")
loc.rob <- fortify(loc.rob.df)
# notice the coordinate system in the Robinson projection (CRS) is DIFFERENT
# from the coordinate values for the same locations in a geographic CRS.
loc.rob
# add a point to the map
newMap <- robMap + geom_point(data=loc.rob, 
                      aes(x=X, y=Y, group=NULL, colour = "purple"),
                      size=5)

newMap + theme(legend.position="none")


## ----challenge-1, echo=FALSE---------------------------------------------

## notes about robinson -- you will see distortion above 40 = 45 degrees latitude 
## it is optimized for the latitudes between 0-45 (north and south). 

## geographic - notice that the latitude lines are closer together are you move
## north...

# What each CRS optimizes:
## Mercator: 
## ALbers Equal Area
## UTM Zone 11n
## Geographic WGS84 (lat/lon): 

## ---- geographic-WGS84, echo=FALSE, message=FALSE------------------------

# read grat shapefile
worldGrat30 <- readOGR(dsn="../../Global/Boundaries/ne_110m_graticules_all", 
                      layer="ne_110m_graticules_30")
# convert to dataframe
worldGrat30_df <- fortify(worldGrat30) 

#import box
wgs84Box <- readOGR("../../Global/Boundaries/ne_110m_graticules_all",
                    layer="ne_110m_wgs84_bounding_box") 
wgs84Box_df<- fortify(wgs84Box)

#plot data
ggplot(wgs84Box_df, aes(long,lat, group=group)) + 
  geom_polygon(fill="white") +
  xlab("Longitude (Degrees)") + ylab("Latitude (Degrees)") +
  ggtitle("World Map - Geographic WGS84 (lat/lon)") +
  geom_polygon(data=worldBound_df, aes(long,lat, group=group, fill=hole))+
  geom_path(data=worldGrat30, aes(long, lat, group=group, fill=NULL), linetype="dashed", color="grey50") +
  labs(title="World map + graticule (longlat)") + 
  coord_equal() + 
  scale_fill_manual(values=c("black", "white"), guide="none") # change colors & 

## ----crs-strings---------------------------------------------------------

library('rgdal')
epsg = make_EPSG()
# View(epsg)
head(epsg)

