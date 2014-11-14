pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used

        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
	
	# Calcuate mean by :
	#  first, reading all data into one variable
	#  then, calculating mean at once
	
	# initialize the pollutant data
	pd <- vector("numeric",length=0)	
	
	# Loop through the monitor ids
	for (mid in id) {
		# Read the CVS file for the monitor
		obs  <- read.csv(sprintf("%s\\%03d.csv",directory,mid))
		# Identify non-NA values
		idx <- !is.na(obs[,pollutant])
		# Collect the observations
		pd <- c(pd,obs[idx,pollutant])
	}
	# Return the mean
	mean(pd)
}
