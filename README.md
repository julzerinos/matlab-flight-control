# Matlab Flight Control

## Project Overview

A set of functions simulating flight control in a Matlab figure. The application generates and animates a map with islands and creates flights between the cities of those islands.

![Image One](https://raw.githubusercontent.com/julzerinos/matlab-flight-control/image-branch/src/flight-control-1.png)

![Image Two](https://raw.githubusercontent.com/julzerinos/matlab-flight-control/image-branch/src/flight-control-2.png)

## Instructions

Run the `run.m` script in the project directory. For flavour, change the `N` (cities count), `MapSize` (square side length of the map) and `MaxFlights` (the amount of maximum flights going on at once) variables in the `run.m` script.

Click the left mouse button to toggle a speed-up of flights.

## Project Documentation

`run.m`
> The bread and butter of the project. This script prepares the map, flights and runs the animation loop. 

`function [ax, x, y] = map(fh, MapSize, N)`
> Creates a square map of side length 2 x MapSize. City points are generated and islands are created for each city point.

`function island = island(ax, xi, yi, type)`
> Function plots random sized islands at given coordinates. This may be created in various modes (circle, polygon, trigonometric) to achieve various results.

`function cities = city(N)`
> Function creates a N-sized list of random city names.

`function [aph, dest, direction] = course(CityX, CityY)`
> Create an airplane course between two cities.

`function p = airplane(x, y, angle, col)`
> Helper function to create and plot an airplane patch.

`function arrow(s, d, col)`
> Function plots a dashed arrow with arrowhead in the middle.

`function state = fly(aph, dest, direction)`
> Updates airplane position and label in one animation loop iteration.
