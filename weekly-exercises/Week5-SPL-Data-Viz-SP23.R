# SPL Data Viz

# Visualizing the SPL's circulation data with ggplot

# Load the data
# "https://github.com/melaniewalsh/Neat-Datasets/raw/main/SPL-Checkouts-2018-2023-atleast15checkouts.csv"

spl_df <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/raw/main/SPL-Checkouts-2018-2023-atleast15checkouts.csv", stringsAsFactors = FALSE)

library(dplyr)
library(stringr)

# Exercise 1: Calculate the total number of SPL checkouts per year with dplyr functions
# Hint: the category that you need to group by is often preceded by the word "each" or "per" 
# Save as checkouts_per_year
checkouts_per_year <- spl_df %>%
  group_by(CheckoutYear) %>%
  summarize(total_checkouts = sum(Checkouts))

# Plot with default R function
plot(checkouts_per_year, type = 'b')

# Load ggplot2 library
# install.packages("ggplot2")
library("ggplot2")

# Exercise 2: Plot "checkouts_per_year" with ggplot functions
# Make a purple line plot of checkouts (or another color)
ggplot(data = checkouts_per_year) +
  geom_line(aes(x = CheckoutYear,
                y = total_checkouts),
            color = "purple")


# Exercise 3: Calculate the total number of SPL checkouts per year per "material type"
# Hint: you'll need to group by multiple columns!
# Save as checkouts_per_year_type
checkouts_per_year_type <- spl_df %>%
  group_by(MaterialType, CheckoutYear) %>%
  summarize(total_checkouts = sum(Checkouts))

# Filter for only specific values (code already filled in for you)
checkouts_per_year_type <- checkouts_per_year_type %>% filter(MaterialType %in% c("AUDIOBOOK", "BOOK", "EBOOK"))

# Turn off scientific notation for y axis
options(scipen=999)

# Exercise 4: Plot checkouts_per_year_type as a line plot with ggplot and make the color of each line correspond to its material type
ggplot(data = checkouts_per_year_type) +
  geom_point(aes(x = CheckoutYear, y = total_checkouts, color = MaterialType)) + 
  geom_line(aes(x = CheckoutYear, y = total_checkouts, color = MaterialType))


# Exercise 5: Add a title, subtitle, and custom x,y axis labels to this plot
# Add a caption that explains the most salient pattern(s) in the plot
ggplot(data = checkouts_per_year_type) +
  geom_line(aes(x = CheckoutYear,
                y = total_checkouts,
                color = MaterialType)) +
  labs(title = "Total SPL Checkouts by Type",
       caption = "Book checkouts plummeted in 2020",
       x = "Total Checkouts",
       y = "Checkout Year",
       color = "Material Type")

# Exercise 6: Change the color scheme of this plot
# Choose one of the color schemes featured in the website below:
# https://r-graph-gallery.com/38-rcolorbrewers-palettes.html
ggplot(data = checkouts_per_year_type) +
  geom_line(aes(x = CheckoutYear,
                y = total_checkouts,
                color = MaterialType)) +
  labs(title = "Total SPL Checkouts by Type",
       caption = "Book checkouts plummeted in 2020",
       x = "Checkout Year",
       y = "Total Checkouts ",
       color = "Material Type") +
  scale_color_brewer(palette = "Paired")


# EXTRA CREDIT: How did SPL checkouts fluctuate over time for a particular author, title, or titles of your choice?

# First, find the total number of SPL checkouts per year for an author or title of your choice
# Then visualize it as a line plot with a custom title, x/y axis labels, and a brief caption
# Try to craft the title and caption so that it communicates what's going on clearly and in an attention-grabbing way (the title/caption can be silly or funny, if warranted!)
# When you're finished, post the image on Discord in #spl-extra-credit and submit to Canvas 

gwtdt_checkouts <- spl_df %>% filter(str_detect(Title, "(?i)girl with the dragon tattoo")) %>% 
  group_by(MaterialType, CheckoutYear) %>%
  summarize(total_checkouts = sum(Checkouts))

gwtdt_checkouts <- gwtdt_checkouts %>% filter(MaterialType %in% c("AUDIOBOOK", "BOOK", "EBOOK"))

ggplot(data = gwtdt_checkouts) +
  geom_line(aes(x = CheckoutYear,
                y = total_checkouts,
                color = MaterialType)) +
  labs(title = "Girl With The Dragon Tattoo",
       caption = "Do certain people just love this audiobook?",
       x = "Checkout Year",
       y = "Total Checkouts ",
       color = "Material Type") +
  scale_color_brewer(palette = "Spectral")
