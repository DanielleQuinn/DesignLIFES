# ---- Import Parks Data ----
# Look at the names of the files available in your working directory

# parks.csv is in "comma separated values" format
# Create an object called parks containing the data frame

# ---- QA/QC Techniques I: Exploring Data ----
# Explore Data: preview

# Explore Data: structure

# Explore Data: class

# ---- Interacting with Data Frames ----
# Interact with Data: columns as vectors
# Columns can be extracted as vectors using $
# objectname$component

# Look at the values in the park_name column

# Remember that vectors are atomic, meaning they can
# only contain one class of data

# ---- QA/QC Techniques II: Assessing Data ----
# Assessing Data: numeric variables

# Assessing Data: character variables
# Print unique state values
# How many unique state values?

# Simple Tables
# Count occurrences of each state

# Simple Visualizations: Univariate
# Histogram of acres
# Barplot of states

# Simple Visualizations: Multivariate
# Scatterplots of all variables
# Scatterplot of acres by year
# Distribution of acres by state

## Each park should have exactly one row in the data
## Which technique(s) would you use to confirm that no parks are repeated?

# ---- Import Fees Data ----
# fees.txt is in "tab separated values" format
# Create an object called fees containing the fee data

## Explore the data and perform some QA/QC

# ---- Joining Data ----
# There is information in fees that we would like to
# add to the original parks data

## How would you do this manually?
# Look up the park code or name
# Find the corresponding annual pass and per person values
# Add them to the parks data

# When joining data, consider:
# What variable(s) will be used to "match" records?
# Does anything need to be edited to make this work?

# dplyr::left_join(x, y) : return all rows from x and all 
# columns from x and y, matching each row based on 
# column names in common

# Create a new object that contains this updated data set

# QA/QC to confirm that this has worked

# ---- Import Coordinate Data ----
# coords.csv is in "comma separated values" format
# Create an object called coords containing the coordinates data

## Explore
# Use functions learned above to explore the data
## QA/QC
# Use techniques learned above to assess the data

# What variable(s) will be used to "match" records?
# Does anything need to be edited to make this work?

# Join and update parks_updated object

# ---- Exporting Data ----
# Before exporting the data, it's always a good idea
# to do another round of QA/QC on the data frame you want to save

# NEVER overwrite your original data file #

# Export as a .csv

# Export as a .txt
