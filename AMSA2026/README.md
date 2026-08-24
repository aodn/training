# AMSA 2026 Canberra, 30 August 2026  

*A deep dive into AODN data* 

## Scope  

The Integrated Marine Observing System (IMOS) Australian Ocean Data Network (AODN) is updating its data collections to cloud-optimised formats, such as Zarr and Parquet. This transition changes how researchers interact with data; rather than downloading large files to a local drive, users now need to access and filter data programmatically in the cloud.

Understanding the specific tools and libraries required to work with these formats is essential for efficient research. This workshop provides a hands-on technical guide for students and researchers with existing Python or R coding skills to master these new workflows.

The session is built around practical applications. After introducing the AODN data collections and the cloud-optimised formats, we will provide a suite of ready-to-work notebooks featuring specific use cases, which will be selected where possible to align with the research interests of the participants. By working through these examples, attendees will learn how to connect to cloud-optimised repositories, query and subset large datasets without full downloads, and integrate AODN data directly into their existing analysis pipelines.

By the end of the workshop, participants will have the code templates and technical knowledge to use the updated AODN infrastructure effectively, making their data processing faster and more reproducible.

## Agenda  

| Time     | Session                                                                                   | Speakers           |
|----------|-------------------------------------------------------------------------------------------|--------------------|
| 09:00 | ARRIVAL & REGISTRATION                                                                    |                    |
| 09:30 | Welcome & acknowledgement of Country                                                      | Eduardo Klein      |
| 09:45 | IMOS program overview                                                                     | Eduardo Klein      |
| 10:00 | Where can I access IMOS data? (overview of architecture: new portal launch, THREDDS, S3)  | Eduardo Klein      |
| 10:45 | MORNING TEA                                                                               |                    |
| 11:00 | What is a Cloud-Optimised file?                                                           | Tom Galindo        |
| 11:15 | AODN Cloud optimise Library                                                               | Laurent Besnard    |
| 12:30 | Working with IMOS cloud optimised datasets                                                | Laurent Besnard, Tom Galindo, Denisse Fierro    |
| 13:00 | LUNCH                                                                                     |                    |
| 13:30 | Guided tutorial: Using IMOS data in R, Python adn CO tools                                | Laurent Besnard, Tom Galindo, Denisse Fierro |
| 14:30 | Excercise: definition of case studies and working groups                                  | Facilitators and Participants |
| 15:00 | free flowing AFTERNOON TEA                                                                |                    |
| 15:00 | Excersice: cont.                                                                          | Facilitators and Participants |
| 16:00 | Results and WORKSHOP CLOSE                                                                | Facilitators and Participants |


## Facilitators  
Tom Galindo  
Laurent Besnard  
[Denisse Fierro Arcos](https://github.com/lidefi87/)  
Eduardo Klein  


## Important

It is indispensable that you set up your computer with the required software before the workshop. 
Please follow the instructions in the [pre-event instructions document](Pre-Event_Instructions.md).



---

## Python Environment Setup

Python 3.12 or later is required. We recommend [uv](https://docs.astral.sh/uv/) for environment and package management.

### With `uv` (recommended)

```bash
uv sync && source .venv/bin/activate
```

### With `pip`

```bash
python -m venv .venv && source .venv/bin/activate && pip install .
```

### Running notebooks

```bash
jupyter notebook
```

Or open any `.ipynb` in your IDE and select the `.venv` as the kernel.

### Key Python packages

| Package | Purpose |
|---------|---------|
| `pyarrow` | Parquet I/O and S3 dataset connection |
| `polars` | DataFrame and LazyFrame computation |
| `polars-h3` | H3 spatial indexing within Polars |
| `polars-st` | Spatial (geometry) operations in Polars |
| `pydeck` | GPU-accelerated H3 hexagon map rendering |
| `h3` | H3 indexing for polygon-to-cell conversion |
| `geopandas` | Shapefile loading and CRS handling |
| `matplotlib` / `seaborn` | Statistical plotting |
| `rich` | Schema and table display in notebooks |

> **Note:** Shared utilities live in the `nesp` package (`nesp/util.py`) and are installed when you run `uv pip install .` or `pip install .`. Notebooks import them as `from nesp import util` — no path manipulation needed.

---

## R Environment Setup

R 4.x or later is required. Install the following packages from CRAN and GitHub before running any `.Rmd` notebook.

### CRAN packages

```r
install.packages(c(
  "arrow",      # S3 dataset connection and Parquet I/O
  "sf",         # Spatial features
  "dplyr",      # Data manipulation
  "tidyr",      # Data reshaping
  "stringr",    # String operations
  "lubridate",  # Date/time handling
  "ggplot2",    # Plotting
  "leaflet"     # Interactive maps
  "terra"       # Raster/vector operations
))
```

### H3 for R (from GitHub)

The `h3-r` package is recommended as it bundles the underlying C library automatically:

```r
# install.packages("remotes")
remotes::install_github("crazycapivara/h3-r")
(yes, crazycapivara...)
```

> See the [h3-r documentation](https://crazycapivara.github.io/h3-r/articles/h3.html) for usage examples.

### Running notebooks

Open any `.Rmd` file in RStudio and click **Knit**, or run chunks interactively.

---

## H3 Spatial Indexing

Some datasets are spatially aggregated using the [Uber H3](https://h3geo.org/) hexagonal grid system. See [`h3.md`](h3.md) for an overview of H3 concepts, resolution levels, and why hexagons are used over traditional grids.

