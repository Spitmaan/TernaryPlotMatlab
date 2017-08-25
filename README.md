# TernaryPlotMatlab
Ternary plot in altitude method for matlab

FUNCTION [HG,HCB]=TERSURF(m,n,p,d,mlbl,nlbl,plbl) plots the values in the vector d as a pseudo color plot in a ternary diagram in altitude method. The three vectors m,n,p define the position of a data value within the ternary diagram in altitude method. The ternary system is created within the function. Axis label can be added using the xlbl values.

The function returns two handels: hg can be used to modify the main plot, and hcb is the handle for the colorbar.

Mehran Spitmaan, Dartmouth College (c) 2017
