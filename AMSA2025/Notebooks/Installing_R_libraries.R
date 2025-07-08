## Installing R libraries to run AMSA 2025 notebooks

# `checking_libraries` function checks that all R libraries used in the AMSA 
# 2025 repository are installed in your local machine. If any libraries are not
# already installed in your machine, this function will install them 
# automatically.

checking_libraries <- function(){
  #List of packages needed to run all notebooks in repository
  packages_required <- c("arrow", "tidyverse", "sf", "rnaturalearth", 
                         "leaflet", "terra", "tidyterra", "thredds", "curl",
                         "ggthemes")
  
  #Checking packages installed in local machine
  packages_local <- installed.packages()
  
  #Find if there are any packages used in repository missing in local machine
  packages_needed <- packages_required[!packages_required %in% packages_local]
  
  #If packages are missing, install them
  if(length(packages_needed)){
    print(paste0("The following packages will be installed: ", 
                 paste(packages_needed, collapse = ", ")))
    install.packages(packages_needed)
    #If no packages are missing, print message
  }else{print(paste0("All packages needed to run notebooks in this ", 
                       "repository are available in your machine."))}
}

