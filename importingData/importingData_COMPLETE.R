# ---- Import Parks Data ----
# Look at the names of the files available in your working directory
list.files()

# parks.csv is in "comma separated values" format
parks <- read.csv("parks.csv") # Create an object called parks containing the data frame

# ---- QA/QC Techniques I: Exploring Data ----
# Explore Data: preview
head(parks)    # Print the first six rows
tail(parks)    # Print the last six rows
View(parks)    # View the data in a separate tab

# Explore Data: structure
nrow(parks)   # How many rows?
ncol(parks)    # How many columns?
dim(parks)     # How many rows and columns?
names(parks)   # Print column names

# Explore Data: class
str(parks)     # Print data structure

# ---- Interacting with Data Frames ----
# Interact with Data: columns as vectors
# Columns can be extracted as vectors using $
# objectname$component

parks$park_name   # Look at the values in the park_name column
parks$acres

# Remember that vectors are atomic, meaning they can
# only contain one class of data

# ---- QA/QC Techniques II: Assessing Data ----
# Assessing Data: numeric variables
summary(parks) # Summary statistics

# Assessing Data: character variables
unique(parks$state)         # Print unique state values
length(unique(parks$state)) # How many unique state values?

# Simple Tables
table(parks$state) # Count occurrences of each state

# Simple Visualizations: Univariate
hist(parks$acres) # Histogram of acres
barplot(table(parks$state))  # Barplot of states

# Simple Visualizations: Multivariate
plot(parks)                        # Scatterplots of all variables
plot(parks$acres ~ parks$year)     # Scatterplot of acres by year
boxplot(parks$acres ~ parks$state) # Distribution of acres by state

## Each park should have exactly one row in the data
## Which technique(s) would you use to confirm that no parks are repeated?
nrow(parks)                     # 56 rows
length(unique(parks$park_name)) # 56 unique park names
# or
table(parks$park_name) # Scroll through output and make sure they are all 1

# ---- Import Fees Data ----
# fees.txt is in "tab separated values" format
fees <- read.delim("fees.txt") # Create an object called fees containing the fee data

## Explore the data and perform some QA/QC
head(fees)
dim(fees)
str(fees)
summary(fees)
unique(fees$park_name)

# ---- Joining Data ----
# There is information in fees that we would like to
# add to the original parks data

head(parks, n = 2)  # optional argument n specifies the number of rows to print
head(fees, n = 2)

## How would you do this manually?
# Look up the park code or name
# Find the corresponding annual pass and per person values
# Add them to the parks data

# When joining data, consider:
# What variable(s) will be used to "match" records?
# Does anything need to be edited to make this work?
names(parks)
names(fees)

# dplyr::left_join(x, y) : return all rows from x and all 
# columns from x and y, matching each row based on 
# column names in common
left_join(parks, fees)

# Create a new object that contains this updated data set
parks_updated <- left_join(parks, fees)

head(parks_updated)

# QA/QC to confirm that this has worked
head(fees, n = 1) # Look at top row of fees
                  # Bryce Canyon has annual pass of 40
View(parks_updated)

# ---- Import Coordinate Data ----
# coords.csv is in "comma separated values" format
coords <- read.csv("coordinates.csv") # Create an object called coords containing the coordinates data

## Explore
# Use functions learned above to explore the data
## QA/QC
# Use techniques learned above to assess the data

# What variable(s) will be used to "match" records?
# Does anything need to be edited to make this work?
names(parks_updated)
names(coords)

# Join and update parks_updated object
left_join(parks_updated, coords)  # Test run
parks_updated <- left_join(parks_updated, coords) # Make it official!

head(parks_updated)

# ---- Exporting Data ----
# Before exporting the data, it's always a good idea
# to do another round of QA/QC on the data frame you want to save

# NEVER overwrite your original data file #

# Export as a .csv
write.csv(parks_updated, file = "parks_updated.csv",
          row.names = FALSE)

# Export as a .txt
write.table(parks_updated, "parks_updated.txt",
            sep = "\t", row.names = FALSE)
