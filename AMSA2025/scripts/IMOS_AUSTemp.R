
# Loading libraries -------------------------------------------------------
#Connection to THREDDS
library(thredds)
#Downloading data
library(curl)
#Data manipulation
library(dplyr)
library(stringr)
library(tidyr)
library(purrr)
#Spatial data
library(sf)
#Gridded data
library(terra)
#Plotting
library(ggplot2)
library(tidyterra)
#Base map
library(rnaturalearth)
#Animal tracks
library(remora)

# Degree Heating Week -----------------------------------------------------
# We will use the IMOS Degree Heating Week (DHW) for the end of April 2025
# We will download the DHW data for 2025-04-30 using the HTTPserver option

# Create a CatalogNode object to access the DHW collection
dhw_cat <- CatalogNode$new(
  paste0("https://thredds.aodn.org.au/thredds/catalog/IMOS/SRS/AusTemp/dhd/",
         "2025/catalog.xml"), prefix = "thredds")

# Get a list of datasets in the DHW collection for the end of April 2025
dhw_apr <- dhw_cat$get_dataset_names() |>
  str_subset("202504[2-3][0-9]")

# Get base url for HTTPserver access
http_base <- dhw_cat$list_services()$http[["base"]]

# Put together full url to download selected files
dhw_urls <- dhw_apr |> 
  map_chr(\(x) paste0("https://thredds.aodn.org.au", http_base,
                      dhw_cat$get_datasets()[[x]]$get_url()))

# Download selected files - They will be named the same as in the catalog
map2(dhw_urls, dhw_apr, \(x, y) curl_download(x, 
                                              file.path("AMSA2025/data/", y)))

# Load DHW data ----------------------------------------------------------
dhw <- rast(list.files("AMSA2025/data/", pattern = "AusTemp", full.names = T), )

# Exploring DHW data
longnames(dhw)

# Selecting Degree Heating Days (DHD)
dhd <- dhw[[names(dhw) == "dhd"]]

# Calculating mean over week
dhd_mean <- mean(dhd, na.rm = TRUE)
#Checking results
plot(dhd_mean)



# Load animal tracking data -----------------------------------------------
tracks <- TownsvilleReefQC
# Check data
tracks

# We will work with the last individual because it as the largest number of
# detections
df <- tracks |> 
  filter(filename == "A69-9002-14765_43669525_43669972") |>
  unnest(QC)

# Creating a bounding box for the animal tracks
bb_track <- c(min(df$receiver_deployment_longitude)-0.5,
              max(df$receiver_deployment_longitude)+0.5,
              min(df$receiver_deployment_latitude)-0.5,
              max(df$receiver_deployment_latitude)+0.5)

# Cropping mean DHD data using the bounding box
dhd_mean <- crop(dhd_mean, bb_track)


# Plotting DHW data with animal tracks -----------------------------------
# Get a map of Australia
aus <- ne_countries(country = "Australia", scale = "large",
                    returnclass = "sf") |> 
  st_crop(st_bbox(dhd_mean))

ggplot()+
  geom_spatraster(data = dhd_mean)+
  geom_sf(data = aus)+
  geom_point(data = df, aes(x = receiver_deployment_longitude, 
                            y = receiver_deployment_latitude),
             color = "green")+
  # Customizing the color scale
  scale_fill_viridis_c(option = "A", name = "Mean DHD")+
  # Remove x and y axis labels
  labs(x = NULL, y = NULL, 
       title = "Mean Degree Heating Days (DHD) in northern Australia") +
  theme_bw()+
  # Formatting legend
  theme(legend.position = "bottom", legend.title.position = "top",
        legend.title = element_text(hjust = 0.5),
        legend.key.width = unit(1.5, "cm"), 
        legend.frame = element_rect(colour = "black"))
  
# Saving the plot
ggsave("AMSA2025/outputs/mean_dhd_north_australia.png", width = 10, height = 6,
       dpi = 300, bg = "white")


# Extracting data ---------------------------------------------------------
extracted_data <- extract(dhd_mean, 
                          df[, c("receiver_deployment_longitude", 
                                 "receiver_deployment_latitude")], xy = T, 
                          ID = F)

ggplot()+
  geom_point(data = extracted_data, aes(x, y, colour = mean))+
  geom_sf(data = aus)+
  labs(x = NULL, y = NULL)+
  theme_bw()
