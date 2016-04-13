Chicago Transit
===============

[![Build Status](https://travis-ci.org/incazteca/chicago_transit.svg?branch=master)](https://travis-ci.org/incazteca/chicago_transit.svg?branch=master)

An interactive tool to demonstrate the reach of Chicago transit options utilizing
data from the CTA and US census data

If you wish to contribute to the project below is a rough roadmap

# Roadmap

1. ~~Retrieve and parse CTA KML files~~ (KML files OUTDATED) CTA now uses GTFS
  * ~~KML files for CTA Stations~~
  * ~~KML files for CTA Rail lines~~
1. Retrieve and parse CTA rail stations and lines from GTFS data set.
2. Retrieve and parse US census data for Chicago
3. Create frontend
  * Basically create a Google map with overlays of the CTA stations and provide
    overlays on stations with regards as to how many people reside within a 10 minute
    walk to the station, 15 minute bus ride. And how long it takes for the train to reach
    other stations
  * Future iterations will allow users to see reach for current CTA layout, and compare
    it to the one from Transit Future.
  * Further iteration will allow users to create their own CTA system and allow them
    to find the best route configuration that will reach most residents.
