# Using AODN Cloud-Optimised (CO) products

This repository contains example notebooks in `R` showing how to access datasets available in the AODN repository of publicly available cloud-optimised datasets. These notebooks include suggested workflows on how to query datasets to create summary tables, figures, and maps.

## Table of contents 

  - [Table of contents](#table-of-contents)
  - [More information](#more-information)
  - [What is the AODN cloud-optimised product?](#What-is-the-AODN-cloud-optimised-product?)
  - [Discovering datasets in AODN CO products](#Discovering-datasets-in-AODN-CO-products)
    - [Discovering datasets via AWS OPD](#Discovering-datasets-via-AWS-OPD)
  - [Code snippets](#code-snippets)
    - [Connecting to tabular dataset in S3 bucket](#connecting-to-tabular-dataset-in-s3-bucket)
    - [Extracting tabular data from S3 bucket](#extracting-tabular-data-from-s3-bucket)
    - [Extracting gridded data from S3 bucket](#extracting-gridded-data-from-s3-bucket)



## What is the AODN cloud-optimised product?

The AODN cloud-optimised (CO) product is a collection of datasets that are stored in Amazon Web Services (AWS) S3 buckets in a format that allows for efficient access and analysis. These datasets are available to the public and can be accessed using the AWS open Data access portal. The AODN CO product is progresively incorporating all IMOS datasets available in the AODN catalogue. These new formats allow the user to access very large datasets without the need to download them to their local machine. Instead, users can connect to the datasets directly in the cloud and extract only the data they need for their analysis.

AODN has created a dedicated Python library to facilitate the access to these datasets, which is available at [AODN CO Python library](https://github.com/aodn/aodn_cloud_optimised), including an extensive collection of example notebooks to help users get started with the AODN CO products. Also, the library includes a set of functions to connect to the datasets, extract data based on spatial and temporal conditions, and create summary tables, figures, and maps.


[Table of contents](#table-of-contents)

## Discovering datasets in AODN CO products

To browse datasets available in the AODN CO catalogue, you can search for datasets in the AWS open Data access portal, which is available at [Amazon Marketplace open Data Program](https://aws.amazon.com/marketplace/search/results?searchTerms=AODN&prevFilters=%257B%2522trk%2522%3A%25228384929b-0eb1-4af3-8996-07aa409646bc%2522%2C%2522sc_channel%2522%3A%2522el%2522%2C%2522FULFILLMENT_OPTION_TYPE%2522%3A%2522DATA_EXCHANGE%2522%2C%2522CONTRACT_TYPE%2522%3A%2522OPEN_DATA_LICENSES%2522%2C%2522filters%2522%3A%2522FULFILLMENT_OPTION_TYPE%2CCONTRACT_TYPE%2522%257D). This portal provides a list of datasets available in the AODN CO catalogue, along with links to the datasets and their metadata.



### Discovering datasets via AWS OPD

To look for available AODN CO products, use the search term "AODN" in the [Amazon Marketplace Open Data Program](https://aws.amazon.com/marketplace/search/results?searchTerms=AODN&prevFilters=%257B%2522trk%2522%3A%25228384929b-0eb1-4af3-8996-07aa409646bc%2522%2C%2522sc_channel%2522%3A%2522el%2522%2C%2522FULFILLMENT_OPTION_TYPE%2522%3A%2522DATA_EXCHANGE%2522%2C%2522CONTRACT_TYPE%2522%3A%2522OPEN_DATA_LICENSES%2522%2C%2522filters%2522%3A%2522FULFILLMENT_OPTION_TYPE%2CCONTRACT_TYPE%2522%257D) portal. This will return a list of datasets available in the AODN CO catalogue, along with links to the datasets and their metadata.

For example, you can find the "Moorings Hourly time-series product" dataset, which is a collection of hourly time-series data from moorings deployed in the Great Barrier Reef. The dataset is available in the AODN CO catalogue and can be accessed via the following link: [Moorings Hourly time-series product](https://aws.amazon.com/marketplace/pp/prodview-ehugzdbvxxvoa?sr=0-1&ref_=beagle&applicationId=AWSMPContessa). You will have the description of the product, a link tto the AODN metadata catalogue entry, and the S3 URL address to access the dataset. There is also links to especific notebooks designed to explore this particular collection. In the section "Resources on AWS" take note of the S3 Bucket Ressource Name; you will need this to connect to the dataset in `R` or `Python`.

For example, the S3 URL address for the "Moorings Hourly time-series product" dataset is `s3://aodn-cloud-optimised/mooring_hourly_timeseries_delayed_qc.parquet/`. 

[Table of contents](#table-of-contents)

## Code snippets

In this section, we are including code snippets that will help you get started with the GBR DMS. These snippets are available in `R` and `Python`, simply select the language you want to use from the tabs below.

### Connecting to tabular dataset in S3 bucket

To run this code in `R` or `Python`, you will need to have the S3 URL address for the dataset of your interest. For this example, we are using the *Moorings Hourly time-series product* dataset, but you can simply replace the S3 URL address with the one for the dataset you want to access.

You can get this URL following the instructions in the [Searching for datasets via STAC](#searching-for-datasets-via-stac) section above.

<details>

<summary><b> Instructions for R users </b></summary>

``` r
# Loading arrow library to connect to S3 bucket
library(arrow)
# Providing S3 URL address for dataset of interest
dataset_s3 <- "s3://aodn-cloud-optimised/mooring_hourly_timeseries_delayed_qc.parquet/"
# Connecting to S3 bucket
s3_conn <- s3_bucket(dataset_s3)
# Accessing dataset
ds <- open_dataset(s3_conn)
```

Remember that you can change the value of `dataset_s3` to the S3 URL address for the dataset you want to access.

Note that if you do not have the `arrow` library installed in your machine, you will need to install it before running the code above. You can do so by running the following line: `install.packages("arrow")`. Alternatively, you can run refer to the [Setting up your machine](#setting-up-your-machine) section below for instructions on how to install all packages used in this repository at once.

</details>

<details>

<summary><b> Instructions for Python users </b></summary>

``` python
# Loading pyarrow library to connect to S3 bucket
from pyarrow import parquet as pq
# Providing S3 URL address for dataset of interest
dataset_s3 = 's3://aodn-cloud-optimised/mooring_hourly_timeseries_delayed_qc.parquet/'
# Connecting to S3 bucket
ds = pq.ParquetDataset(dataset_s3)
```

Remember that you can change the value of `dataset_s3` to the S3 URL address for the dataset you want to access.

Note that if you do not have the `pyarrow` package installed in your machine, you will not be able to run the code above. You can install it using a package manager such as `pip` or `conda`. Alternatively, you can run refer to the [Setting up your machine](#setting-up-your-machine) section below for instructions on how to install all packages used in this repository at once.

</details>

### Extracting tabular data from S3 bucket

Once you have connected to the S3 bucket, you do not have to download the entire dataset to your local machine to carry out your analysis. Instead, you can extract data from the dataset of interest based on one or more conditions. You can then load into memory only the relevant data needed to create summary tables, figures, or maps. We are including code snippets showing a simple data selection based on spatial and temporal conditions.

<details>

<summary><b> Instructions for R users </b></summary>

Once you have connected to the S3 bucket, you can use [`dplyr` verbs](https://dplyr.tidyverse.org/) to extract a subset of the data based on one or more conditions. Here, we assume that a dataset connection has already been established following instructions in the [Connecting to S3 bucket](#connecting-to-s3-bucket) section above and this dataset is stored in the `ds` variable. We will assume that our dataset has `longitude`, `latitude`, and `time` columns, and we will use them to extract data based on spatial and temporal conditions.

``` r
# Loading relevant libraries
library(dplyr)

# We will extract data for the year 2019 that includes Townsville and Cairns
ds_subset <- ds |> 
  # Select one moorning site
  filter(site_code == "NRSMAI") 
  # select a TIME range
  filter(TIME >= "2019-01-01" & time <= "2019-12-31") |> 
  # We could even select only the columns we need
  # We will assume that the dataset also has a column called 'site_code' and we want to select it
  select(LONGITUDE, LATITUDE, TIME, site_code, TEMP, PSAL)

# We can now load the data into memory
ds_subset <- ds_subset |> 
  collect()
```

Note that these are common `dplyr` verbs, but they are actually excecuted by `arrow` (not all `dplyr` verbs are available in `arrow`, see (here)[https://arrow.apache.org/docs/r/reference/acero.html]). You don't get any data until you add the `collect()` verb at the end.   

You can change the values of the conditions above to extract data that is relevant for your needs. Other conditions may include extracting data based on a specific site, a specific depth range, or even a specific variable.

</details>

<details>

<summary><b> Instructions for Python users </b></summary>

Once you have connected to the S3 bucket, you can use the `pandas` package to connect to a dataset and extract a subset of the data based on one or more conditions. We will assume that our dataset has `longitude`, `latitude`, and `time` columns, and we will use them to extract data based on spatial and temporal conditions. We will use the *AIMS Sea Surface Temperature Monitoring Program* dataset as an example, but you can replace the S3 URL address with the one for the dataset you want to access.

``` python
# Loading relevant packages
import pandas as pd

# We store the S3 URL address in a variable
dataset_s3 = 's3://aodn-cloud-optimised/mooring_hourly_timeseries_delayed_qc.parquet/'

# We will define a variable with our conditions to extract data for the year 2019 that includes Townsville and Cairns
filters = [
    ('site_code', '==', 'NRSMAI'),
    ('TIME', '>=', pd.Timestamp('2019-01-01T10:00:00Z')),
    ('TIME', '<', pd.Timestamp('2020-01-01T10:00:00Z')),
]

# We will extract data for the year 2019 that includes Townsville and Cairns
ds_subset = pd.read_parquet(
    dataset_s3,
    # We can select the columns of our interest with the columns argument
    columns=['LATITUDE', 'LONGITUDE', 'TIME', 'site_code', 'TEMP', 'PSAL],
    # We can now apply our filters
    filters=filters,
    # We can connect anonymously because this is a public dataset
    storage_options={'anon': True},
)
```

</details>

### Extracting gridded data from S3 bucket

Gridded data is also available in the AODN CO product. This data is stored in [Zarr](https://zarr.readthedocs.io/en/stable/) format, which is a format that allows for efficient storage of array-based data. This data is also stored in S3 buckets, but the connection and extraction process is slightly different from the one described above for tabular data.

<details>

<summary><b> Instructions for R users </b></summary>

Unfortunately, there is not support yet to connect with Zarr files stored in a S3 bucket using `R`. However, you can use the `terra` package to connect to the netCDF files provided in the [AODN THREDDS server](https://thredds.aodn.org.au/thredds/catalog/IMOS/catalog.html). 


</details>

<details>

<summary><b> Instructions for Python users </b></summary>

Instead of using `dask_geopandas` to connect to the S3 bucket and extract tabular data, we will use the `s3fs` package to connect and extract gridded data. We will use the *satellite_austemp_sst-anomaly_australia.zarr/* dataset as an example, but you can replace the S3 URL address with the one for the dataset you want to access.

``` python
#Loading relevant packages
#Connecting to S3 bucket
import s3fs
#Loading and manipulating gridded data
import xarray as xr

#Storing the S3 URL address in a variable
url = 'satellite_austemp_sst-anomaly_australia.zarr/'

#Connecting to public bucket - No credentials required
s3_bucket = s3fs.S3FileSystem(anon = True)

#Loading data into memory
coral_ds = xr.open_dataset(s3fs.S3Map(root = url, s3 = s3_bucket), engine = 'zarr')
```

</details>

[Table of contents](#table-of-contents)
 