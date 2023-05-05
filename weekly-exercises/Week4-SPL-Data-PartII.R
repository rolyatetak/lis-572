# SPL Data Part II

# Load the Seattle Public Library Data
# https://github.com/melaniewalsh/Neat-Datasets/raw/main/SPL-Checkouts-2018-2023-atleast15checkouts.csv
spl_data <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/raw/main/SPL-Checkouts-2018-2023-atleast15checkouts.csv", stringsAsFactors = FALSE)

# Load the dplyr library
#Load the stringr library
# install.packages("stringr")
library("dplyr")
library("stringr")

########### Publishers
# Exercise 1
# What are all the distinct publishers in the SPL data — e.g., Random House, Scholastic, etc.? 
# Save as a variable distinct_publishers
distinct_publishers <- spl_data %>% 
                       distinct(Publisher)

############ Creators
# Exercise 2
# Filter the dataframe for a specific author/creator but try to capture different existing representations of their name
# Save as creator_df
creator_df <- spl_data %>% 
              filter(str_detect(Creator, "Joan.*Didion|Didion.*Joan"))

############ Publication Years
# Exercise 3
# What are the most common publication dates for items in the SPL data?
# To answer this question, you need to make a dataframe that shows how many times each publication date appears
# Save your new dataframe as a variable called publication_years
publication_years <- spl_data %>% 
                     group_by(PublicationYear) %>% 
                     summarize(n())

# What do you notice about the publication year data? What steps should we take next? Should we clean these values?

############ Most Checked Out Items
# Exercise 4
# What are the most checked out items in this SPL data?
# To answer this question, you need to make a dataframe that shows how many times each individual item has been checked out
# Save your new dataframe as a variable called most_checked_out
most_checked_out <- spl_data %>% 
                    group_by(Title) %>% 
                    summarize(sum(Checkouts))