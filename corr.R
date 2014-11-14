corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0

        ## Return a numeric vector of correlations

	# Get the list of files that meet the threshold
	complete_obs_no <- complete(directory)
	use_ids <- complete_obs_no$id[complete_obs_no$nobs>threshold]
	
	# Initialize the correlation 
	pollu_cor <- vector("numeric",length=0)
	# Loop through valid files
	for (mid in use_ids) {
		# Read the CVS file for the monitor
		obs  <- read.csv(sprintf("%s\\%03d.csv",directory,mid))
		# Calculate correlation for complete pairs
		pollu_cor <- c(pollu_cor, cor(obs[,"sulfate"], obs[,"nitrate"], 
								use="pairwise.complete.obs"))
		
	}
	pollu_cor
}

