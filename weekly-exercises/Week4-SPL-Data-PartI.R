# SPL Data — Queering the Catalog

# Load the Seattle Public Library Data
# https://github.com/melaniewalsh/Neat-Datasets/raw/main/SPL-Checkouts-2018-2023-atleast15checkouts.csv
spl_data <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/raw/main/SPL-Checkouts-2018-2023-atleast15checkouts.csv", stringsAsFactors = FALSE)

# Load the dplyr library
# Load the tidyverse library
library(dplyr)
library(tidyverse)
# Load the stringr library
# install.packages("stringr")
library("stringr")

# Exercise 1: First, filter for all of the Lord of the Rings books and save to a variable filtered titles. Then, filter for a book/item of your choice. 
lotr_titles <- spl_data %>%  
               filter(str_detect(Title, "(?i)lord of the rings"))

## Now search for a title that you are interested in!

filtered_titles <- spl_data %>% 
                   filter(str_detect(Title, "(?i)jurassic park"))

### Subject Headings
### How has the Seattle Public Library handled changes in LOC Subject Headings?

# Exercise 2: Filter for all books that include a certain term (e.g. "aliens") in the Subject Heading
term1_subjects <- spl_data %>% 
                  filter(str_detect(Subjects, "(?i)aliens"))

# Exercise 3: Filter for all books that include another term that you want to compare to term 1 (e.g. "noncitizens") in the Subject Heading
term2_subjects <- spl_data %>% 
                  filter(str_detect(Subjects, "(?i)noncitizens"))

## Let's compare the books that have term 1-related Subject Headings and the books that have term 2-related Subject Headings

# Exercise 4: Group the term1_subejcts and term2_subjects by subject heading OR by year, and then use the function n() to count how frequent each heading is OR how many headings appeared each year

term1_subjects_df <- term1_subjects %>% 
                     group_by(CheckoutYear) %>% 
                     summarize(num_records = n())

term2_subjects_df <- term2_subjects %>% 
                     group_by(CheckoutYear) %>% 
                     summarize(num_records = n())

## What additional work might we need to do to analyze Subject Headings?

### Bonus Material

# Reformat the SPL data so that you can plot the total number of checkouts for any title(s) over time

# Group the Lord of the Rings titles by year, then calculate the sum total of the checkouts (and save as a column called "total_checkouts")

# Once you've done this correctly, you should be able to run the code to make a plot of checkouts over time

lotr_checkouts <- lotr_titles %>% 
                  group_by(CheckoutYear) %>% 
                  summarize(total_checkouts = sum(Checkouts))

# Make a plot
plot(lotr_checkouts$CheckoutYear, lotr_checkouts$total_checkouts, type = 'b')

filtered_checkouts <- filtered_titles %>% 
                      group_by(CheckoutYear) %>% 
                      summarize(total_checkouts = sum(Checkouts))

# Make a plot
plot(filtered_checkouts$CheckoutYear, filtered_checkouts$total_checkouts, type = 'b')

# You can use a tidyverse function separate_rows() to split a column with multiple items into individual rows with each item. Check it out! 
spl_data_subjects <- spl_data %>% 
                     separate_rows(Subjects, sep = ",")