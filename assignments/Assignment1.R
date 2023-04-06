##############################################################################
## Assignment 1: Intro to R

## Please write your code/responses in the places marked "Your code/response here"

## This assignment draws on real Seattle Public Library circulation data for Emily St. John Mandel's novel Station Eleven in the year 2020.
## You are going to manipulate this real checkout data to explore different trends.
## For context, in March 2020, the WHO declared COVID-19 a pandemic, and this novel is a story about a fictional pandemic.

## To explore the circulation data for yourself, see https://data.seattle.gov/Community/Checkouts-by-Title/tmmm-ytt6/data
##############################################################################

# Name: Kate Skow

## 1. Assign the words "Station Eleven" to a variable called spl_book (1 point)

spl_book <- "Station Eleven"

## 2. Use a built-in R function to print the data type of the variable spl_book to the Console (1 point)

typeof(spl_book)

## 3. Assign the words "Emily St. John Mandel" to a variable called spl_author (1 point)

spl_author <- "Emily St. John Mandel"

## Imagine that we want to print out a statement that will describe any SPL book and author that we are analyzing, like so: "The SPL book that we are analyzing is [spl_book] by [spl_author]." Let's write some code that will accomplish this task.

## 4. Use a built-in R function to print out the sentence "The SPL book that we are analyzing is Station Eleven by Emily St. John Mandel." without actually typing "Station Eleven" and "Emily St. John Mandel" and instead using the variables spl_book and spl_author. (2 points)

paste0("The SPL book that we are analyzing is ", spl_book, " by ", spl_author, ".")

## 5. The number of SPL checkouts for physical copies of Station Eleven across the 12 months of the year 2020 was as follows: 31, 20, 12, 0, 0, 0, 0, 2, 3, 11, 14, 18
## Make a vector of these values and assign them to a variable called spl_checkouts (2 points)

spl_checkouts <- c(31,20,12,0,0,0,0,2,3,11,14,18)

# Bonus: You can plot the checkouts by month using plot()!
plot(spl_checkouts)

## 6. Use a built-in R function to calculate the length of the vector spl_checkouts (1 point)

length(spl_checkouts)

## 7. Use a built-in R function to calculate the maximum value of the vector spl_checkouts (1 point)

max(spl_checkouts)

## 8. Use a built-in R function to calculate the minimum value of the vector spl_checkouts (1 point)

min(spl_checkouts)

## 9. Use a built-in R function to calculate the average (mean) value of the vector spl_checkouts (1 point)

mean(spl_checkouts)

## 10. Use a built-in R function to calculate the sum total of the vector spl_checkouts (1 point)

sum(spl_checkouts)

## 11. Make an in-code comment below (1 point), and write 3 or more sentences about the pattern of the physical checkouts for Station Eleven across the 12 months of 2020: 31, 20, 12, 0, 0, 0, 0, 2, 3, 11, 14, 18.

## Does this pattern surprise you? Why or not why not? What other information or data would you want to explore after seeing this information? (3 points)

# The pattern doesn't totally surprise me; the four consecutive months of zero checkouts is due to library closures beginning in March 2020, and the lower numbers in August and September is probably because of libraries allowing limited pickups. It might also be lower because some patrons may not have immediately known they could begin checking out physical items again. I'd really love to see the e-resource checkout data for this title; I wonder if the same months as all the zero physical book checkouts (April-July) would have an influx of e-book or audiobook checkouts. At first, I was a little surprised to not see a massive spike starting in August - you can check out books again and this book is relevant to our current situation! - but then I considered the idea that by August, a lot of people may have been distinctly *avoiding* books relevant to our (incredibly prolonged) current situation. I know personally, I was really interested in The Decameron early on in 2020, but when September hit and we were still inside and watching our government totally flounder on dealing with everything, I did *not* want to engage with pandemic-related media. (And I didn't even know then that after 6 months of lockdown, the end was hardly in sight!)