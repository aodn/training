
# Loading libraries -------------------------------------------------------
#Connection to THREDDS
library(thredds)
#Downloading data
library(curl)
#Data manipulation
library(dplyr)
#Spatial data
library(sf)
#Gridded data
library(terra)
#Plotting
library(ggplot2)
library(tidyterra)
#Base map
library(rnaturalearth)

# Connecting to IMOS THREDDS server ---------------------------------------
cat_url <- "https://thredds.aodn.org.au/thredds/catalog/IMOS/catalog.xml"
imos_cat <- CatalogNode$new(cat_url, prefix = "thredds")

# Exploring the catalog ---------------------------------------------------
# This will open the catalog in the web browser
imos_cat$browse()

# Listing datasets in the catalog
imos_cat$get_catalogs()

# We will check the SST datasets inside the SRS catalog
imos_cat$get_catalogs()[["SRS"]]$get_catalogs()[["SST"]]
# This option of catalog browsing is time consuming, so unless you're familiar
# with the structure of the catalog, it's better to use the web browser

# We will download SST data for 2025-01-01 using the HTTPserver option 
url <- paste0("https://thredds.aodn.org.au/thredds/fileServer/IMOS/SRS/SST/",
              "ghrsst/L3SM-1d/dn/2025/20250101092000-ABOM-L3S_GHRSST-SSTfnd-", 
              "MultiSensor-1d_dn.nc")

#Download data
curl_download(url, destfile = "AMSA2025/data/srs_sst_data.nc")

# Load SST data -----------------------------------------------------------
sst_data <- rast("AMSA2025/data/srs_sst_data.nc")
#Exploring SST data
names(sst_data)
# This dataset contains multiple variables, but we're interested in SST

# Checking SST
sst_data$sea_surface_temperature

# Note that the SST variable is in Kelvin, so we will convert it to Celsius
sst_celsius <- sst_data$sea_surface_temperature-273.15

# Plotting SST data
plot(sst_celsius)


# Cropping data -----------------------------------------------------------
# We will focus on a specific region, let's say Tasmania
# We will create a bounding box (xmin, xmax, ymin, ymax)
bbox_tasmania <- c(143, 150, -44, -39) 
# Crop the SST data to the bounding box
sst_tas <- crop(sst_celsius, bbox_tasmania)

# Plot the cropped SST data
plot(sst_tas)

# Let's make a nicer map using ggplot2 and tidyterra
aus <- ne_countries(country = "Australia", scale = "large", returnclass = "sf")

# Plotting data -----------------------------------------------------------
ggplot() +
  # Using tidyterra to plot the raster data
  geom_spatraster(data = sst_tas) +
  # Adding map of Tasmania
  geom_sf(data = aus, fill = "lightgrey", color = "black") +
  # Customizing the color scale
  scale_fill_viridis_c(option = "C", name = "SST (°C)") +
  # Cropping map to Tasmania
  coord_sf(xlim = c(143, 150), ylim = c(-44, -39), expand = FALSE) +
  # Adding title
  labs(title = "Sea Surface Temperature in Tasmania") +
  theme_minimal() +
  # Formatting text
  theme(legend.position = "bottom", legend.title.position = "top",
        legend.title = element_text(hjust = 0.5),
        legend.key.width = unit(1.5, "cm"))

# Saving the plot
ggsave("AMSA2025/outputs/sst_tasmania.png", width = 10, height = 6, dpi = 300, 
       bg = "white")


