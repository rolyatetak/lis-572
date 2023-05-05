# Load data
np_data <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/1979-2020-National-Park-Visits-By-State.csv", stringsAsFactors = FALSE)

# View this dataframe by clicking on the spreadsheet icon in the Global Environment

# Install tidyverse
install.packages("tidyverse")

# Load dplyr library
library(dplyr)

# Select 2 columns from the data and save to the variable smaller_df
smaller_df <- np_data %>% select(ParkName,Year,RecreationVisits)

# View this dataframe by clicking on the spreadsheet icon in the Global Environment

# Filter the dataframe for only values in the state of Washington and save to the variable
# Hint: Think about the special equals sign that you will need to use!
wa_parks <- np_data %>% filter(State == "WA")

# View this dataframe by clicking on the spreadsheet icon in the Global Environment

# Calculate the sum total of RecreationVisits to Washington by using summarize() on the smaller dataframe wa_parks
wa_parks %>% summarize(sum(RecreationVisits))
                             