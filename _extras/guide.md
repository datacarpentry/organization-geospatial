---
layout: page
title: "Instructor Notes"
---

{% include base_path.html %}

## Instructor notes

## Lesson motivation and learning objectives

This lesson is designed to introduce learners to the core concepts of geospatial 
raster and vector data that they will need in order to complete the other lessons
in this workshop. It is primarily intended for learners who have not worked
with geospatial data before (but plan to do so in the future), but it is also
useful for learners who have worked with geospatial data in GUI-based systems
like ArcGIS. Those systems often hide details of file formats and metadata types
that are essential to know about when working with geospatial data through CUI 
interfaces like R.

## Lesson design

#### [Introduction to Raster Data]({{ relative_root_path }}/{% link _episodes/01-intro-raster-data.md %})

* This episode includes graphics generated from data that will be used later 
in the workshop. Show these images from the lesson page as you work through the
episode. Tell learners that by the end of the workshop, they will be able to write
the code that generates these images. 
* Learners may be familiar with other file formats than GeoTIFF for storing raster
data. Emphasize that there are many different file formats used with geospatial data
but that for this workshop we are going to be working with GeoTIFF files.

#### [Introduction to Vector Data]({{ relative_root_path }}/{% link _episodes/02-intro-vector-data.md %})

* Like with the previous episode, note that there are many different file formats
for storing vector data but that we will be working with the Shapefile format
in this workshop. 

#### [Coordinate Reference Systems]({{ relative_root_path }}/{% link _episodes/03-crs.md %})

* Try not to get off track with jargon debates (CRS vs SRS, projection vs CRS). 
* Emphasize that the choice of projection depends on the size and location of the study site or data collection region.
* For describing CRSs, there are many different systems. We are choosing to limit 
the discussion in this workshop to PROJ4. Learners may encounter other systems in 
their work. 
* Don't get into the "Other Common Systems" callout box unless learners specifcally request information about other systems or mention others that they are working with.

#### [The Geospatial Landscape]({{ relative_root_path }}/{% link _episodes/04-geo-landscape.md %})

* This lesson discusses many different software packages. Don't read all of 
the text to the learners. Instead, provide a summary (commercial vs. open source vs. cloud systems).  
* Mention specific systems that learners have worked with or are planning on working with (especially if they mention specific systems in their pre-workshop survey responses). 

#### Concluding points

* The rest of the lessons in this workshop go into a lot more depth about 
each of the topics presented here. 
* We will be using R for the rest of the workshop.

## Technical tips and tricks

Not applicable. No software used in this lesson. 

## Common problems

TBA - Instructors please add situations you encounter here.


{% include links.md %}
