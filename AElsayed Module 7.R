# Load the gapminder dataset
install.packages("gapminder")
library(gapminder)

# Step 1: View the first few rows of the dataset 
head(gapminder)

# Step 2: Check if a generic function can be applied
# Check what kind of object the dataset is
class(gapminder)

# Use a simple function to summarize the data
summary(gapminder)

# Step 3: Simple S3 and S4 Examples

# S3 System - Create a basic list with country data
s3_gapminder <- list(country = gapminder$country[1:3], 
                     year = gapminder$year[1:3], 
                     lifeExp = gapminder$lifeExp[1:3])

# Assign a class to the list, making it an S3 object
class(s3_gapminder) <- "country_data"

# Print the S3 object to see the data
s3_gapminder

# S4 System - Define a simple class for country data
setClass("country_data", 
         slots = list(
           country = "character", 
           year = "numeric", 
           lifeExp = "numeric"
         ))

# Convert the country column to character and create the S4 object
s4_gapminder <- new("country_data", 
                    country = as.character(gapminder$country[1:3]), 
                    year = gapminder$year[1:3], 
                    lifeExp = gapminder$lifeExp[1:3])

# Print the S4 object to see the data
s4_gapminder