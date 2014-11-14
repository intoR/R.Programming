complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases

	# Create the data frame
	results <- data.frame(id = id, nobs = id*0)
	# Loop through the ids
	iCntr <- 0 # a counter
	for (mid in id) {
		iCntr <- iCntr + 1
		# Read the CVS file for the monitor
		obs  <- read.csv(sprintf("%s\\%03d.csv",directory,mid))
		# Identify complete values (non-NA for both pollutants)
		idx <- !is.na(obs[,"sulfate"]) & !is.na(obs[,"nitrate"])
		results$nobs[iCntr] <- sum(idx)
	}
	results
}

