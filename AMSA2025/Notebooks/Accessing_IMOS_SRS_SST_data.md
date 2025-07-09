IMOS_SRS_SST
================
Denisse Fierro Arcos
2025-07-08

- [Introduction](#introduction)
- [Loading required libraries](#loading-required-libraries)
- [Connecting to IMOS THREDDS
  server](#connecting-to-imos-thredds-server)
  - [Exploring the IMOS THREDDS
    catalog](#exploring-the-imos-thredds-catalog)
  - [Download SST data from IMOS THREDDS
    server](#download-sst-data-from-imos-thredds-server)
- [Load SST data](#load-sst-data)
- [Extracting SST data for points of
  interest](#extracting-sst-data-for-points-of-interest)
- [Extracting SST data with `remora`](#extracting-sst-data-with-remora)
- [Calculating mean SST for the first week of January
  2025](#calculating-mean-sst-for-the-first-week-of-january-2025)
- [Plotting SST data](#plotting-sst-data)
- [Conclusion](#conclusion)

# Introduction

In this notebook, we will explore how to access and visualize the IMOS
SRS Sea Surface Temperature (SST) data using R. We will also show how to
extract SST data using a point of interest.

This SST data product is available through the IMOS THREDDS Data Server
and it provides the skin sea surface temperature which was measured
using infra-red radiometers on various satellites. The data is
composited over multiple swaths/scenes and gridded over a 0.02 degree
rectangular grid over Australia. For more information, see
<http://www.ghrsst.org>

# Loading required libraries

``` r
#Connection to THREDDS
library(thredds)
#Downloading data
library(curl)
#Data manipulation
library(dplyr)
library(stringr)
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
#Extracting data from IMOS
library(remora)
```

# Connecting to IMOS THREDDS server

The IMOS THREDDS server can be accessed using the `thredds` package in
R. It is also possible to explore the catalog to find the dataset we are
interested in, which we show below, but we recommend using the web
browser for easier navigation.

``` r
# We define the URL of the IMOS THREDDS catalog
imos_cat_url <- "https://thredds.aodn.org.au/thredds/catalog/IMOS/catalog.xml"
# We create a CatalogNode object to connect to the IMOS THREDDS catalog
imos_cat <- CatalogNode$new(imos_cat_url, prefix = "thredds")
```

## Exploring the IMOS THREDDS catalog

We can open the catalog in the web browser to explore the datasets
available as follows:

``` r
imos_cat$browse()
```

    ## Warning in imos_cat$browse(): unable to browse
    ## URL:https://thredds.aodn.org.au/thredds/catalog/IMOS/catalog.xml

Once in the browser, you can change the extension of the catalog URL
from `catalog.xml` to `catalog.html`. This way you can explore the
catalog in a more user-friendly format.

As mentioned previously, we can also explore the catalog
programmatically, but this is more time-consuming. We will check the SST
datasets inside the SRS catalog:

``` r
# Listing datasets in the catalog
imos_cat$get_catalogs()
```

    ## $AATAMS
    ## CatalogNode (R6): 
    ##   verbose: FALSE    tries: 3    namespace prefix: d1
    ##   url: https://thredds.aodn.org.au/thredds/catalog/IMOS/AATAMS/catalog.xml
    ##   services [4]: Compound OPENDAP HTTPServer WMS
    ##   catalogRefs [5]: AATAMS_sattag_nrt acoustic_detections_QC acoustic_tagging archival_tagging satellite_tagging
    ##   datasets [1]: AATAMS
    ## 
    ## $ACORN
    ## CatalogNode (R6): 
    ##   verbose: FALSE    tries: 3    namespace prefix: d1
    ##   url: https://thredds.aodn.org.au/thredds/catalog/IMOS/ACORN/catalog.xml
    ##   services [4]: Compound OPENDAP HTTPServer WMS
    ##   catalogRefs [9]: gridded_1h-avg-current-map_QC gridded_1h-avg-current-map_non-QC gridded_1h-avg-wave-site-map_QC gridded_1h-avg-wave-spectra_QC gridded_1h-avg-wave-station-map_QC gridded_1h-avg-wind-map_QC radial radial_quality_controlled vector
    ##   datasets [1]: ACORN
    ## 
    ## $ACORN_JCU_historical
    ## CatalogNode (R6): 
    ##   verbose: FALSE    tries: 3    namespace prefix: d1
    ##   url: https://thredds.aodn.org.au/thredds/catalog/IMOS/ACORN_JCU_historical/catalog.xml
    ##   services [4]: Compound OPENDAP HTTPServer WMS
    ##   catalogRefs [2]: gridded_1h-avg-current-map_QC radial_quality_controlled
    ##   datasets [1]: ACORN_JCU_historical
    ## 
    ## $ANFOG
    ## CatalogNode (R6): 
    ##   verbose: FALSE    tries: 3    namespace prefix: d1
    ##   url: https://thredds.aodn.org.au/thredds/catalog/IMOS/ANFOG/catalog.xml
    ##   services [4]: Compound OPENDAP HTTPServer WMS
    ##   catalogRefs [3]: REALTIME seaglider slocum_glider
    ##   datasets [1]: ANFOG
    ## 
    ## $ANMN
    ## CatalogNode (R6): 
    ##   verbose: FALSE    tries: 3    namespace prefix: d1
    ##   url: https://thredds.aodn.org.au/thredds/catalog/IMOS/ANMN/catalog.xml
    ##   services [4]: Compound OPENDAP HTTPServer WMS
    ##   catalogRefs [10]: AM Acoustic Deep_Water_Waves NRS NSW PA QLD SA WA Wave_Buoys
    ##   datasets [1]: ANMN
    ## 
    ## $AUV
    ## CatalogNode (R6): 
    ##   verbose: FALSE    tries: 3    namespace prefix: d1
    ##   url: https://thredds.aodn.org.au/thredds/catalog/IMOS/AUV/catalog.xml
    ##   services [4]: Compound OPENDAP HTTPServer WMS
    ##   catalogRefs [74]: AUV_articles Apollo202309 Batemans201011 ... Wilsonsprom201603SS Wollongong202201 auv_viewer_data
    ##   datasets [1]: AUV
    ## 
    ## $Argo
    ## CatalogNode (R6): 
    ##   verbose: FALSE    tries: 3    namespace prefix: d1
    ##   url: https://thredds.aodn.org.au/thredds/catalog/IMOS/Argo/catalog.xml
    ##   services [4]: Compound OPENDAP HTTPServer WMS
    ##   catalogRefs [2]: aggregated_datasets dac
    ##   datasets [1]: Argo
    ## 
    ## $BGC_DB
    ## CatalogNode (R6): 
    ##   verbose: FALSE    tries: 3    namespace prefix: d1
    ##   url: https://thredds.aodn.org.au/thredds/catalog/IMOS/BGC_DB/catalog.xml
    ##   services [4]: Compound OPENDAP HTTPServer WMS
    ##   catalogRefs [1]: harvested_from_CSIRO
    ##   datasets [1]: BGC_DB
    ## 
    ## $`COASTAL-WAVE-BUOYS`
    ## CatalogNode (R6): 
    ##   verbose: FALSE    tries: 3    namespace prefix: d1
    ##   url: https://thredds.aodn.org.au/thredds/catalog/IMOS/COASTAL-WAVE-BUOYS/catalog.xml
    ##   services [4]: Compound OPENDAP HTTPServer WMS
    ##   catalogRefs [1]: WAVE-BUOYS
    ##   datasets [1]: COASTAL-WAVE-BUOYS
    ## 
    ## $DWM
    ## CatalogNode (R6): 
    ##   verbose: FALSE    tries: 3    namespace prefix: d1
    ##   url: https://thredds.aodn.org.au/thredds/catalog/IMOS/DWM/catalog.xml
    ##   services [4]: Compound OPENDAP HTTPServer WMS
    ##   catalogRefs [4]: ASFS DA Deployments SOTS
    ##   datasets [1]: DWM
    ## 
    ## $FAIMMS
    ## CatalogNode (R6): 
    ##   verbose: FALSE    tries: 3    namespace prefix: d1
    ##   url: https://thredds.aodn.org.au/thredds/catalog/IMOS/FAIMMS/catalog.xml
    ##   services [4]: Compound OPENDAP HTTPServer WMS
    ##   catalogRefs [7]: Davies_Reef Heron_Island Lizard_Island Myrmidon_Reef One_Tree_Island Orpheus_Island Rib_Reef
    ##   datasets [1]: FAIMMS
    ## 
    ## $NTP
    ## CatalogNode (R6): 
    ##   verbose: FALSE    tries: 3    namespace prefix: d1
    ##   url: https://thredds.aodn.org.au/thredds/catalog/IMOS/NTP/catalog.xml
    ##   services [4]: Compound OPENDAP HTTPServer WMS
    ##   catalogRefs [2]: Low_Cost_Wave_Buoy_Technology Profiling_Moorings
    ##   datasets [1]: NTP
    ## 
    ## $OceanCurrent
    ## CatalogNode (R6): 
    ##   verbose: FALSE    tries: 3    namespace prefix: d1
    ##   url: https://thredds.aodn.org.au/thredds/catalog/IMOS/OceanCurrent/catalog.xml
    ##   services [4]: Compound OPENDAP HTTPServer WMS
    ##   catalogRefs [1]: GSLA
    ##   datasets [1]: OceanCurrent
    ## 
    ## $SAIMOS
    ## CatalogNode (R6): 
    ##   verbose: FALSE    tries: 3    namespace prefix: d1
    ##   url: https://thredds.aodn.org.au/thredds/catalog/IMOS/SAIMOS/catalog.xml
    ##   services [4]: Compound OPENDAP HTTPServer WMS
    ##   catalogRefs [1]: Biogeochem
    ##   datasets [1]: SAIMOS
    ## 
    ## $SOOP
    ## CatalogNode (R6): 
    ##   verbose: FALSE    tries: 3    namespace prefix: d1
    ##   url: https://thredds.aodn.org.au/thredds/catalog/IMOS/SOOP/catalog.xml
    ##   services [4]: Compound OPENDAP HTTPServer WMS
    ##   catalogRefs [8]: SOOP-ASF SOOP-BA SOOP-CO2 SOOP-FishSOOP SOOP-SST SOOP-TMV SOOP-TRV SOOP-XBT
    ##   datasets [1]: SOOP
    ## 
    ## $SRS
    ## CatalogNode (R6): 
    ##   verbose: FALSE    tries: 3    namespace prefix: d1
    ##   url: https://thredds.aodn.org.au/thredds/catalog/IMOS/SRS/catalog.xml
    ##   services [4]: Compound OPENDAP HTTPServer WMS
    ##   catalogRefs [6]: ALTIMETRY AusTemp OC SSS SST Surface-Waves
    ##   datasets [1]: SRS
    ## 
    ## $eMII
    ## CatalogNode (R6): 
    ##   verbose: FALSE    tries: 3    namespace prefix: d1
    ##   url: https://thredds.aodn.org.au/thredds/catalog/IMOS/eMII/catalog.xml
    ##   services [4]: Compound OPENDAP HTTPServer WMS
    ##   catalogRefs [2]: demos test_files
    ##   datasets [1]: eMII

We can see there are a number of datasets available in the IMOS catalog.
We are interested in the `SRS` products, so we can check the datasets
available in the `SRS` catalog:

``` r
imos_cat$get_catalogs()[["SRS"]]
```

    ## CatalogNode (R6): 
    ##   verbose: FALSE    tries: 3    namespace prefix: d1
    ##   url: https://thredds.aodn.org.au/thredds/catalog/IMOS/SRS/catalog.xml
    ##   services [4]: Compound OPENDAP HTTPServer WMS
    ##   catalogRefs [6]: ALTIMETRY AusTemp OC SSS SST Surface-Waves
    ##   datasets [1]: SRS

We can see that the `SRS` catalog contains the `SST` dataset we are
interested in. There are multiple datasets available inside `SST`, but
below we show you the path to the `ghrsst` dataset, which contains the
Sea Surface Temperature data we want to access:

``` r
imos_cat$get_catalogs()[["SRS"]]$get_catalogs()[["SST"]]$
  get_catalogs()[["ghrsst"]]$get_catalogs()[["L3SM-1d"]]$
  get_catalogs()[["day"]]$get_catalogs()[["2025"]]
```

    ## CatalogNode (R6): 
    ##   verbose: FALSE    tries: 3    namespace prefix: d1
    ##   url: https://thredds.aodn.org.au/thredds/catalog/IMOS/SRS/SST/ghrsst/L3SM-1d/day/2025/catalog.xml
    ##   services [4]: Compound OPENDAP HTTPServer WMS
    ##   catalogRefs [0]: none
    ##   datasets [164]: 20250101032000-ABOM-L3S_GHRSST-SSTskin-MultiSensor-1d_day.nc 20250102032000-ABOM-L3S_GHRSST-SSTskin-MultiSensor-1d_day.nc ... 20250703032000-ABOM-L3S_GHRSST-SSTskin-MultiSensor-1d_day.nc 20250706032000-ABOM-L3S_GHRSST-SSTskin-MultiSensor-1d_day.nc

We can see that there are 163 files available in the `2025` folder,
which contains the SST data for that year. We also get a URL that will
allow us to explore the catalog further. We will use this URL to
download the SST data for the first week of 2025.

``` r
# First we connect to the catalog
srs_cat <- CatalogNode$new(paste0("https://thredds.aodn.org.au/thredds/catalog",
                                  "/IMOS/SRS/SST/ghrsst/L3SM-1d/day/2025/", 
                                  "catalog.xml"),
                           prefix = "thredds")

# Now we can get the dataset names available in the catalog
sst_jan_names <- srs_cat$get_dataset_names() |>
  str_subset("2025010[1-7]")

# Checking we have selected the correct datasets
sst_jan_names
```

    ## [1] "20250101032000-ABOM-L3S_GHRSST-SSTskin-MultiSensor-1d_day.nc"
    ## [2] "20250102032000-ABOM-L3S_GHRSST-SSTskin-MultiSensor-1d_day.nc"
    ## [3] "20250103032000-ABOM-L3S_GHRSST-SSTskin-MultiSensor-1d_day.nc"
    ## [4] "20250104032000-ABOM-L3S_GHRSST-SSTskin-MultiSensor-1d_day.nc"
    ## [5] "20250105032000-ABOM-L3S_GHRSST-SSTskin-MultiSensor-1d_day.nc"
    ## [6] "20250106032000-ABOM-L3S_GHRSST-SSTskin-MultiSensor-1d_day.nc"
    ## [7] "20250107032000-ABOM-L3S_GHRSST-SSTskin-MultiSensor-1d_day.nc"

We have seven datasets available for the first week of January 2025,
which is exactly what we wanted. Once again, this method to explore the
catalog is more time-consuming, so unless you’re familiar with the
structure of the catalog, we highlight recommend you use the web browser
instead.

We now need a complete URL to download the SST data as shown below.

``` r
# Get base url for HTTPserver access
http_base <- srs_cat$list_services()$http[["base"]]

# Put together full url to download selected files
sst_jan_urls <- sst_jan_names |> 
  map_chr(\(x) paste0("https://thredds.aodn.org.au", http_base,
                      srs_cat$get_datasets()[[x]]$get_url()))

# Checking results
sst_jan_urls
```

    ## [1] "https://thredds.aodn.org.au/thredds/fileServer/IMOS/SRS/SST/ghrsst/L3SM-1d/day/2025/20250101032000-ABOM-L3S_GHRSST-SSTskin-MultiSensor-1d_day.nc"
    ## [2] "https://thredds.aodn.org.au/thredds/fileServer/IMOS/SRS/SST/ghrsst/L3SM-1d/day/2025/20250102032000-ABOM-L3S_GHRSST-SSTskin-MultiSensor-1d_day.nc"
    ## [3] "https://thredds.aodn.org.au/thredds/fileServer/IMOS/SRS/SST/ghrsst/L3SM-1d/day/2025/20250103032000-ABOM-L3S_GHRSST-SSTskin-MultiSensor-1d_day.nc"
    ## [4] "https://thredds.aodn.org.au/thredds/fileServer/IMOS/SRS/SST/ghrsst/L3SM-1d/day/2025/20250104032000-ABOM-L3S_GHRSST-SSTskin-MultiSensor-1d_day.nc"
    ## [5] "https://thredds.aodn.org.au/thredds/fileServer/IMOS/SRS/SST/ghrsst/L3SM-1d/day/2025/20250105032000-ABOM-L3S_GHRSST-SSTskin-MultiSensor-1d_day.nc"
    ## [6] "https://thredds.aodn.org.au/thredds/fileServer/IMOS/SRS/SST/ghrsst/L3SM-1d/day/2025/20250106032000-ABOM-L3S_GHRSST-SSTskin-MultiSensor-1d_day.nc"
    ## [7] "https://thredds.aodn.org.au/thredds/fileServer/IMOS/SRS/SST/ghrsst/L3SM-1d/day/2025/20250107032000-ABOM-L3S_GHRSST-SSTskin-MultiSensor-1d_day.nc"

We are now ready to download the data.

## Download SST data from IMOS THREDDS server

``` r
# We will ensure we have a directory to store the data
if(!dir.exists("../data")){
  dir.create("../data", recursive = T)
}

# We will download the SST data for the first week of January 2025
# The file names will be named the same as in the catalog
map2(sst_jan_urls, sst_jan_names, 
     \(x, y) curl_download(x, file.path("../data/", y)))
```

Data download may take a few minutes depending on your internet
connection. Once the data is downloaded, we can load it into R for
further analysis.

# Load SST data

``` r
# We can get a list of the downloaded files
sst_jan_files <- list.files("../data", pattern = "GHRSST", full.names = T)

# We can load the SST data using the terra package
sst_jan_w1 <- rast(sst_jan_files)

# Exploring SST data
sst_jan_w1
```

    ## class       : SpatRaster 
    ## size        : 4500, 6000, 112  (nrow, ncol, nlyr)
    ## resolution  : 0.02, 0.02  (x, y)
    ## extent      : 70, 190, -70, 20  (xmin, xmax, ymin, ymax)
    ## coord. ref. : lon/lat WGS 84 (CRS84) (OGC:CRS84) 
    ## sources     : 20250101032000-ABOM-L3S_GHRSST-SSTskin-MultiSensor-1d_day.nc:sea_surface_temperature  
    ##               20250101032000-ABOM-L3S_GHRSST-SSTskin-MultiSensor-1d_day.nc:sst_dtime  
    ##               20250101032000-ABOM-L3S_GHRSST-SSTskin-MultiSensor-1d_day.nc:dt_analysis  
    ##               ... and 109 more sources
    ## varnames    : sea_surface_temperature (sea surface skin temperature) 
    ##               sst_dtime (time difference from reference time) 
    ##               dt_analysis (deviation from last SST analysis) 
    ##               ...
    ## names       : sea_s~ature, sst_dtime, dt_analysis, wind_speed, wind_~m_sst, sea_i~ction, ... 
    ## unit        :      kelvin,    second,      kelvin,      m s-1,        hour,           1, ...

The dataset contains multiple variables, but we are interested in the
`sea_surface_temperature` variable. We can subset the data to keep SST
data only and then we will convert it from Kelvin to Celsius.

You may also have noticed that there is no information about dates in
the raster object. We can extract this information from the `source`
attribute of the raster object.

``` r
# Subsetting SST data
sst_jan_w1 <- sst_jan_w1[[names(sst_jan_w1) == "sea_surface_temperature"]]

# Getting dates from the source attribute
date_sst_jan <- sources(sst_jan_w1) |> 
  str_extract(pattern = "2025010[1-7]") |> 
  as.Date(format = "%Y%m%d")

# Adding dates as time and names to the raster object
time(sst_jan_w1) <- date_sst_jan
names(sst_jan_w1) <- date_sst_jan

# Transforming from Kelvin to Celsius
sst_jan_w1_celsius <- sst_jan_w1 - 273.15
sst_jan_w1_celsius
```

    ## class       : SpatRaster 
    ## size        : 4500, 6000, 7  (nrow, ncol, nlyr)
    ## resolution  : 0.02, 0.02  (x, y)
    ## extent      : 70, 190, -70, 20  (xmin, xmax, ymin, ymax)
    ## coord. ref. : lon/lat WGS 84 (CRS84) (OGC:CRS84) 
    ## source(s)   : memory
    ## varname     : sea_surface_temperature (sea surface skin temperature) 
    ## names       : 2025-01-01, 2025-01-02, 2025-01-03, 2025-01-04, 2025-01-05, 2025-01-06, ... 
    ## min values  :  -3.111253,  -3.123773,  -3.439873,  -3.564982,  -3.099774,  -3.140474, ... 
    ## max values  :  42.158746,  39.066226,  40.410126,  44.685017,  43.490225,  46.409525, ... 
    ## time (days) : 2025-01-01 to 2025-01-07 (7 steps)

# Extracting SST data for points of interest

We can extract SST data for specific points of interest using the
`extract` function from the `terra` package. For example, we can extract
SST data for a points in the south and west coast of Australia.

``` r
# Defining points of interest
points_of_interest <- data.frame(lon = c(137.5, 115.7),
                                 lat = c(-37.5, -19)) |> 
  # Converting points to a spatial object
  st_as_sf(coords = c("lon", "lat"), crs = 4326)

# Extracting SST data for points of interest
sst_points <- extract(sst_jan_w1_celsius, points_of_interest, xy = T)

# Checking extracted SST data
sst_points
```

    ##   ID 2025-01-01 2025-01-02 2025-01-03 2025-01-04 2025-01-05 2025-01-06
    ## 1  1   16.95875   17.55623   17.59013         NA         NA   16.73953
    ## 2  2         NA   31.73623   31.54013   31.26502   31.86022   31.68953
    ##   2025-01-07      x      y
    ## 1         NA 137.49 -37.51
    ## 2   31.99361 115.69 -19.01

We can reformat the extracted data to make it easier to read and
visualize.

``` r
sst_points <- sst_points |> 
  pivot_longer(cols = !c(ID, x, y), names_to = "date",
               values_to = "sst_celsius")

sst_points
```

    ## # A tibble: 14 × 5
    ##       ID     x     y date       sst_celsius
    ##    <dbl> <dbl> <dbl> <chr>            <dbl>
    ##  1     1  137. -37.5 2025-01-01        17.0
    ##  2     1  137. -37.5 2025-01-02        17.6
    ##  3     1  137. -37.5 2025-01-03        17.6
    ##  4     1  137. -37.5 2025-01-04        NA  
    ##  5     1  137. -37.5 2025-01-05        NA  
    ##  6     1  137. -37.5 2025-01-06        16.7
    ##  7     1  137. -37.5 2025-01-07        NA  
    ##  8     2  116. -19.0 2025-01-01        NA  
    ##  9     2  116. -19.0 2025-01-02        31.7
    ## 10     2  116. -19.0 2025-01-03        31.5
    ## 11     2  116. -19.0 2025-01-04        31.3
    ## 12     2  116. -19.0 2025-01-05        31.9
    ## 13     2  116. -19.0 2025-01-06        31.7
    ## 14     2  116. -19.0 2025-01-07        32.0

# Extracting SST data with `remora`

We can also use the `remora` package to extract SST data for our points
of interest. This package provides a convenient way to access IMOS data
for specific locations. More information about `remora` can be found in
their website: <https://imos-animaltracking.github.io/remora/>.

For this example, we will use the same points of interest defined above.

``` r
# We can explore the environment variables available in the remora package
imos_variables()
```

<table class=" lightable-paper" style='font-family: "Arial Narrow", arial, helvetica, sans-serif; width: auto !important; margin-left: auto; margin-right: auto;'>

<thead>

<tr>

<th style="text-align:left;">

Variable
</th>

<th style="text-align:left;">

Platform
</th>

<th style="text-align:left;">

Temporal resolution
</th>

<th style="text-align:left;">

Units
</th>

<th style="text-align:left;">

Function to use
</th>

<th style="text-align:left;">

Description
</th>

<th style="text-align:left;">

Source
</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;font-weight: bold;">

bathy
</td>

<td style="text-align:left;">

Composite raster product
</td>

<td style="text-align:left;">

- </td>

  <td style="text-align:left;">

  meters
  </td>

  <td style="text-align:left;">

  extractEnv()
  </td>

  <td style="text-align:left;width: 30em; ">

  Australian Bathymetry and Topography Grid. 250 m resolution.
  </td>

  <td style="text-align:left;">

  Geosciences Australia
  </td>

  </tr>

  <tr>

  <td style="text-align:left;font-weight: bold;">

  dist_to_land
  </td>

  <td style="text-align:left;">

  Raster product
  </td>

  <td style="text-align:left;">

  - </td>

    <td style="text-align:left;">

    kilometers
    </td>

    <td style="text-align:left;">

    extractEnv()
    </td>

    <td style="text-align:left;width: 30em; ">

    Distance from nearest shoreline (in km). Derived from the
    high-resolution Open Street Map shoreline product.
    </td>

    <td style="text-align:left;">

    This package
    </td>

    </tr>

    <tr>

    <td style="text-align:left;font-weight: bold;">

    rs_sst
    </td>

    <td style="text-align:left;">

    Satellite-derived raster product
    </td>

    <td style="text-align:left;">

    daily (2002-07-04 - present)
    </td>

    <td style="text-align:left;">

    degrees Celcius
    </td>

    <td style="text-align:left;">

    extractEnv()
    </td>

    <td style="text-align:left;width: 30em; ">

    1-day multi-swath multi-sensor (L3S) remotely sensed sea surface
    temperature (degrees Celcius) at 2 km resolution. Derived from the
    Group for High Resolution Sea Surface Temperature (GHRSST)
    </td>

    <td style="text-align:left;">

    IMOS
    </td>

    </tr>

    <tr>

    <td style="text-align:left;font-weight: bold;">

    rs_sst_interpolated
    </td>

    <td style="text-align:left;">

    Raster product
    </td>

    <td style="text-align:left;">

    daily (2006-06-12 - present)
    </td>

    <td style="text-align:left;">

    degrees Celcius
    </td>

    <td style="text-align:left;">

    extractEnv()
    </td>

    <td style="text-align:left;width: 30em; ">

    1-day interpolated remotely sensed sea surface temperature (degrees
    Celcius) at 9 km resolution. Derived from the Regional Australian
    Multi-Sensor Sea surface temperature Analysis (RAMSSA, Beggs et
    al. 2010) system as part of the BLUElink Ocean Forecasting Australia
    project
    </td>

    <td style="text-align:left;">

    IMOS
    </td>

    </tr>

    <tr>

    <td style="text-align:left;font-weight: bold;">

    rs_chl
    </td>

    <td style="text-align:left;">

    Satellite-derived raster product
    </td>

    <td style="text-align:left;">

    daily (2002-07-04 - present)
    </td>

    <td style="text-align:left;">

    mg.m-3
    </td>

    <td style="text-align:left;">

    extractEnv()
    </td>

    <td style="text-align:left;width: 30em; ">

    Remotely sensed chlorophyll-a concentration (OC3 model). Derived
    from the MODIS Aqua satellite mission. Multi-spectral measurements
    are used to infer the concentration of chlorophyll-a, most typically
    due to phytoplankton, present in the water (mg.m-3).
    </td>

    <td style="text-align:left;">

    IMOS
    </td>

    </tr>

    <tr>

    <td style="text-align:left;font-weight: bold;">

    rs_current
    </td>

    <td style="text-align:left;">

    Composite raster product
    </td>

    <td style="text-align:left;">

    daily (1993-01-01 - present)
    </td>

    <td style="text-align:left;">

    ms-1; degrees
    </td>

    <td style="text-align:left;">

    extractEnv()
    </td>

    <td style="text-align:left;width: 30em; ">

    Gridded (adjusted) sea level anomaly (GSLA), surface geostrophic
    velocity in the east-west (UCUR) and north-south (VCUR) directions
    for the Australasian region derived from the IMOS Ocean Current
    project. Two additional variables are calculated: surface current
    velocity (ms-1) and bearing (degrees).
    </td>

    <td style="text-align:left;">

    IMOS
    </td>

    </tr>

    <tr>

    <td style="text-align:left;font-weight: bold;">

    rs_salinity
    </td>

    <td style="text-align:left;">

    Satellite-derived raster product
    </td>

    <td style="text-align:left;">

    weekly (2011-08-25 - 2015-06-07)
    </td>

    <td style="text-align:left;">

    psu
    </td>

    <td style="text-align:left;">

    extractEnv()
    </td>

    <td style="text-align:left;width: 30em; ">

    7-day composite remotely sensed salinity. Derived from the NASA
    Aquarius satellite mission (psu).
    </td>

    <td style="text-align:left;">

    IMOS
    </td>

    </tr>

    <tr>

    <td style="text-align:left;font-weight: bold;">

    rs_turbidity
    </td>

    <td style="text-align:left;">

    Satellite-derived raster product
    </td>

    <td style="text-align:left;">

    daily (2002-07-04 - present)
    </td>

    <td style="text-align:left;">

    m-1
    </td>

    <td style="text-align:left;">

    extractEnv()
    </td>

    <td style="text-align:left;width: 30em; ">

    Diffuse attenuation coefficient at 490 nm (K490) indicates the
    turbidity of the water column (m-1). The value of K490 represents
    the rate which light at 490 nm is attenuated with depth. For example
    a K490 of 0.1/meter means that light intensity will be reduced one
    natural log within 10 meters of water. Thus, for a K490 of 0.1, one
    attenuation length is 10 meters. Higher K490 value means smaller
    attenuation depth, and lower clarity of ocean water.
    </td>

    <td style="text-align:left;">

    IMOS
    </td>

    </tr>

    <tr>

    <td style="text-align:left;font-weight: bold;">

    rs_npp
    </td>

    <td style="text-align:left;">

    Satellite-derived raster product
    </td>

    <td style="text-align:left;">

    daily (2002-07-04 - present)
    </td>

    <td style="text-align:left;">

    mgC.m_2.day-1
    </td>

    <td style="text-align:left;">

    extractEnv()
    </td>

    <td style="text-align:left;width: 30em; ">

    Net primary productivity (OC3 model and Eppley-VGPM algorithm).
    Modelled product used to compute an estimate of the Net Primary
    Productivity (NPP). The model used is based on the standard
    vertically generalised production model (VGPM). The VGPM is a
    “chlorophyll-based” model that estimates net primary production from
    chlorophyll using a temperature-dependent description of
    chlorophyll-specific photosynthetic efficiency. For the VGPM, net
    primary production is a function of chlorophyll, available light,
    and the photosynthetic efficiency. The only difference between the
    Standard VGPM and the Eppley-VGPM is the temperature-dependent
    description of photosynthetic efficiencies, with the Eppley approach
    using an exponential function to account for variation in
    photosynthetic efficiencies due to photoacclimation.
    </td>

    <td style="text-align:left;">

    IMOS
    </td>

    </tr>

    <tr>

    <td style="text-align:left;font-weight: bold;">

    moor_sea_temp
    </td>

    <td style="text-align:left;">

    Fixed sub-surface moorings
    </td>

    <td style="text-align:left;">

    hourly
    </td>

    <td style="text-align:left;">

    degrees Celcius
    </td>

    <td style="text-align:left;">

    extractMoor()
    </td>

    <td style="text-align:left;width: 30em; ">

    Depth-integrated in-situ, hourly time-series measurements of sea
    temperature (degrees Celcius) at fixed mooring locations
    </td>

    <td style="text-align:left;">

    IMOS
    </td>

    </tr>

    <tr>

    <td style="text-align:left;font-weight: bold;">

    moor_psal
    </td>

    <td style="text-align:left;">

    Fixed sub-surface moorings
    </td>

    <td style="text-align:left;">

    hourly
    </td>

    <td style="text-align:left;">

    psu
    </td>

    <td style="text-align:left;">

    extractMoor()
    </td>

    <td style="text-align:left;width: 30em; ">

    Depth-integrated in-situ, hourly time-series measurements of
    salinity (psu) at fixed mooring locations
    </td>

    <td style="text-align:left;">

    IMOS
    </td>

    </tr>

    <tr>

    <td style="text-align:left;font-weight: bold;">

    moor_ucur
    </td>

    <td style="text-align:left;">

    Fixed sub-surface moorings
    </td>

    <td style="text-align:left;">

    hourly
    </td>

    <td style="text-align:left;">

    ms-1
    </td>

    <td style="text-align:left;">

    extractMoor()
    </td>

    <td style="text-align:left;width: 30em; ">

    Depth-integrated in-situ, hourly time-series measurements of
    subsurface geostrophic current velocity in the east-west direction
    (ms-1) at fixed mooring locations
    </td>

    <td style="text-align:left;">

    IMOS
    </td>

    </tr>

    <tr>

    <td style="text-align:left;font-weight: bold;">

    moor_vcur
    </td>

    <td style="text-align:left;">

    Fixed sub-surface moorings
    </td>

    <td style="text-align:left;">

    hourly
    </td>

    <td style="text-align:left;">

    ms-1
    </td>

    <td style="text-align:left;">

    extractMoor()
    </td>

    <td style="text-align:left;width: 30em; ">

    Depth-integrated in-situ, hourly time-series measurements of
    subsurface geostrophic current velocity in the north-south direction
    (ms-1) at fixed mooring locations
    </td>

    <td style="text-align:left;">

    IMOS
    </td>

    </tr>

    <tr>

    <td style="text-align:left;font-weight: bold;">

    BRAN_temp
    </td>

    <td style="text-align:left;">

    3D Raster product
    </td>

    <td style="text-align:left;">

    daily (1993-01-01 - present)
    </td>

    <td style="text-align:left;">

    degrees Celcius
    </td>

    <td style="text-align:left;">

    extractBlue()
    </td>

    <td style="text-align:left;width: 30em; ">

    Water temperature at specified depth from the surface to 4,509-m
    depth
    </td>

    <td style="text-align:left;">

    Bluelink (CSIRO)
    </td>

    </tr>

    <tr>

    <td style="text-align:left;font-weight: bold;">

    BRAN_salt
    </td>

    <td style="text-align:left;">

    3D Raster product
    </td>

    <td style="text-align:left;">

    daily (1993-01-01 - present)
    </td>

    <td style="text-align:left;">

    psu
    </td>

    <td style="text-align:left;">

    extractBlue()
    </td>

    <td style="text-align:left;width: 30em; ">

    Water salinity at specified depth from the surface to 4,509-m depth
    </td>

    <td style="text-align:left;">

    Bluelink (CSIRO)
    </td>

    </tr>

    <tr>

    <td style="text-align:left;font-weight: bold;">

    BRAN_cur
    </td>

    <td style="text-align:left;">

    3D Raster product
    </td>

    <td style="text-align:left;">

    daily (1993-01-01 - present)
    </td>

    <td style="text-align:left;">

    ms-1; degrees clockwise
    </td>

    <td style="text-align:left;">

    extractBlue()
    </td>

    <td style="text-align:left;width: 30em; ">

    Geostrophic velocity in the east-west (UCUR) and north-south (VCUR)
    directions from the surface to 4,509-m depth. Two additional
    variables are calculated: BRAN_spd = current velocity (ms-1) and
    BRAN_dir = current bearing (degrees).
    </td>

    <td style="text-align:left;">

    Bluelink (CSIRO)
    </td>

    </tr>

    <tr>

    <td style="text-align:left;font-weight: bold;">

    BRAN_wcur
    </td>

    <td style="text-align:left;">

    Raster product
    </td>

    <td style="text-align:left;">

    daily (1993-01-01 - present)
    </td>

    <td style="text-align:left;">

    ms-1
    </td>

    <td style="text-align:left;">

    extractBlue()
    </td>

    <td style="text-align:left;width: 30em; ">

    Vertical current speed in the water column is calculated (negative =
    downwards; positive = upwards) using the layers available between
    the surface to 200-m depths.
    </td>

    <td style="text-align:left;">

    Bluelink (CSIRO)
    </td>

    </tr>

    <tr>

    <td style="text-align:left;font-weight: bold;">

    BRAN_ssh
    </td>

    <td style="text-align:left;">

    Raster product
    </td>

    <td style="text-align:left;">

    daily (1993-01-01 - present)
    </td>

    <td style="text-align:left;">

    meters
    </td>

    <td style="text-align:left;">

    extractBlue()
    </td>

    <td style="text-align:left;width: 30em; ">

    Sea surface height at the water surface
    </td>

    <td style="text-align:left;">

    Bluelink (CSIRO)
    </td>

    </tr>

    <tr>

    <td style="text-align:left;font-weight: bold;">

    BRAN_mld
    </td>

    <td style="text-align:left;">

    Raster product
    </td>

    <td style="text-align:left;">

    daily (1993-01-01 - present)
    </td>

    <td style="text-align:left;">

    meters
    </td>

    <td style="text-align:left;">

    extractBlue()
    </td>

    <td style="text-align:left;width: 30em; ">

    Mixed layer depth in relation to the water surface
    </td>

    <td style="text-align:left;">

    Bluelink (CSIRO)
    </td>

    </tr>

    <tr>

    <td style="text-align:left;font-weight: bold;">

    BRAN_wind
    </td>

    <td style="text-align:left;">

    Raster product
    </td>

    <td style="text-align:left;">

    daily (1993-01-01 - present)
    </td>

    <td style="text-align:left;">

    ms-1; degrees clockwise
    </td>

    <td style="text-align:left;">

    extractBlue()
    </td>

    <td style="text-align:left;width: 30em; ">

    Two variables are calculated, including BRAN_wind_spd = wind
    velocity (ms-1) and BRAN_wind_dir = wind bearing (degrees).
    </td>

    <td style="text-align:left;">

    Bluelink (CSIRO)
    </td>

    </tr>

    </tbody>

    </table>

We will use `rs_sst` which is the same product we accessed via the
THREDDS server. Note that this step may take a few minutes to complete.

``` r
remora_sst <- extractEnv(sst_points, X = "x", Y = "y", datetime = "date",
                         env_var = "rs_sst")
```

# Calculating mean SST for the first week of January 2025

``` r
mean_sst_jan_w1 <- mean(sst_jan_w1_celsius, na.rm = TRUE)
mean_sst_jan_w1
```

    ## class       : SpatRaster 
    ## size        : 4500, 6000, 1  (nrow, ncol, nlyr)
    ## resolution  : 0.02, 0.02  (x, y)
    ## extent      : 70, 190, -70, 20  (xmin, xmax, ymin, ymax)
    ## coord. ref. : lon/lat WGS 84 (CRS84) (OGC:CRS84) 
    ## source(s)   : memory
    ## name        :      mean 
    ## min value   : -3.146391 
    ## max value   : 40.503609

# Plotting SST data

We can create a simple plot of the mean SST using base R.

``` r
plot(mean_sst_jan_w1)
```

![](figures/unnamed-chunk-16-1.png)<!-- -->

We can also create a more informative plot using `ggplot2` and
`tidyterra` packages. We will use the `geom_spatraster` function to plot
the raster data and add a base map of Australia using the
`rnaturalearth` package.

``` r
# Getting a base map of Australia
aus <- ne_countries(country = "Australia", scale = "medium",
                    returnclass = "sf")
```

Remember that when using `ggplot2`, we create a plot by stacking layers.
This means we will need to add the raster data as the first layer and
then add the base map as a second layer. We can also add points for the
locations we extracted SST data from.

``` r
ggplot()+
  # Using tidyterra to plot the raster data
  geom_spatraster(data = mean_sst_jan_w1) +
  # Setting the color scale for the SST data
  scale_fill_viridis_c(option = "C", name = "SST (°C)") +
  # Adding base map of Australia
  geom_sf(data = aus, fill = NA, color = "grey") +
  # Adding points for the locations we extracted SST data from
  geom_sf(data = points_of_interest, color = "darkgreen", size = 3) +
  # Adding labels and theme
  labs(title = "Mean Sea Surface Temperature (SST) for January 2025",
       x = "Longitude", y = "Latitude") +
  theme_bw()
```

    ## <SpatRaster> resampled to 500821 cells.

![](figures/unnamed-chunk-18-1.png)<!-- -->

We can also make a plot comparing the mean SST for the first week of
January 2025 at our two points of interest.

``` r
sst_points |> 
  ggplot(aes(x = date, y = sst_celsius, color = as.factor(ID))) +
  geom_line(aes(group = ID)) +
  geom_point() +
  labs(title = "SST at Points of Interest for January 2025",
       x = "Date", y = "SST (°C)", color = "Point ID") +
  theme_bw()
```

    ## Warning: Removed 2 rows containing missing values or values outside the scale range
    ## (`geom_line()`).

    ## Warning: Removed 4 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

![](figures/unnamed-chunk-19-1.png)<!-- -->

Finally, we can also create a multipanel plot to visualize the SST data
for each day of the first week of January 2025 at our points of
interest.

``` r
ggplot()+
  geom_spatraster(data = sst_jan_w1_celsius)+
  scale_fill_viridis_c(option = "C", name = "SST (°C)") +
  geom_sf(data = aus, fill = "#fff2cc", color = "#fff2cc") +
  facet_wrap(~lyr) +
  theme_bw() +
  labs(title = "Sea Surface Temperature (SST) for January 2025") +
  theme(legend.position = "bottom", legend.title.position = "top", 
        axis.text.x = element_text(angle = 45, hjust = 1))
```

    ## <SpatRaster> resampled to 500821 cells.

![](figures/unnamed-chunk-20-1.png)<!-- -->

Remember that you can save any plots as follows:

``` r
ggsave("../outputs/sst_australia_jan2025.png", dpi = 300, 
       bg = "white")
```

# Conclusion

In this notebook, we have gone through the basics of how to access IMOS
data available via the THREDDS server, specifically the Sea Surface
Temperature (SST) data. We have shown how to download the data, load it
into R, extract SST data for specific points of interest, and visualize
the data using `ggplot2` and `tidyterra`. We have also shown how to
calculate the mean SST for the first week of January 2025 and created
multifaceted plots to visualise the data.
