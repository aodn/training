# Pre-Event Instructions

During this event, we will go through some `R` based notebooks showing how to access dataset available in the AODN Cloud-Optimised catalogue. These notebooks show how to perform simple analyses and create a variety of graphs, including maps, time series and bar plots.

To make the most out of this work, we recommend that you follow the instructions below **before** you attend the workshop. This will ensure you have all the necessary software installed in your computer so you are able to run these notebooks during the workshop.

**NOTE:** Installation of necessary software may take some time. To avoid delays, we highly recommend that you install all necessary software **before** the workshop.

# Items to complete before workshop

-   [ ] Install `R`
-   [ ] Install RStudio
-   [ ] *Install RTools (Windows users only)*
-   [ ] Check `R` and RStudio have been successfully installed
-   [ ] Download/clone example notebooks
-   [ ] Install `R` packages
-   [ ] Install IMOS-related `R` packages
-   [ ] Install `QGIS` and plugins

# **1. Installation instructions**

The notebooks developed for this training event show how to access datasets available in the AODN Cloud-Optimised product using `R`.

You can copy these notebooks in your local machine by downloading or cloning our GitHub repository: <https://github.com/aodn/training>. To run these notebooks, you will need to have installed `R` and all libraries used in our example notebooks. In this section, we provide instructions on how to install everything you need.

*Remember, you will need to make sure that you have installed all necessary software prior to the training as this may take some time.*

## 1.1 `R`

`R` is distributed by CRAN and is available for Windows, Linux, and MacOS. Installers are available [here](https://cran.r-project.org/). Make sure you download the installer that matches the operating system in your machine.

**NOTE:** `R` must be installed **before** you attempt to install RStudio or RTools.

## 1.2 RStudio

Once you install `R` in your local machine, you will need to install a program that allows you to interact with `R`. This program is known as an integrated development environment (IDE). There are several IDEs that allow you to interact with `R`, but RStudio is by far the most popular. We will use RStudio in our workshop, so we recommend you install it, especially if you are not an experienced `R` user. However, if you are more comfortable using a different IDE, you do not need to install RStudio.

You can download RStudio Desktop [here](https://posit.co/download/rstudio-desktop/) for free. Once again, ensure you select the installer that matches the operating system in your machine.

## 1.3 RTools (Windows users ONLY)

If you are running `R` in a Windows machine, you will also need to install RTools. This program will allow you to build some `R` packages. RTools installers can be downloaded from [here](https://cran.r-project.org/bin/windows/Rtools/).

The version of RTools you need to install will depend on the version of `R` you have installed your computer. If you installed `R` while following these instructions, then you will need to download RTools 4.3. Otherwise, check the version of `R` you have installed in your machine to identify the correct RTools version. If you are unsure about the `R` version installed in your machine, you can simply type `version` in the RStudio console.

**NOTE:** Non-Windows users are **NOT** required to install RTools.

## 1.4 Checking `R` and RStudio installation

Open RStudio in your machine. If you cannot find RStudio, follow the instructions below.

-   **Windows:** Click **Start**, search for “*rstudio”*, and click to open.
-   **macOS:** Use **Cmd+Space** to open Spotlight Search and type “*rstudio*” to open the program.
-   **Linux–CentOS:** Open **Applications** \> **System Tools** \> ***rstudio***.
-   **Linux–Ubuntu:** Open the Dash by clicking the Ubuntu icon, then type “*rstudio*”.

Once RStudio is opened, type `version` in the console (panel on the lower left) and press ENTER/RETURN. This should print output similar to the one shown below.

``` r
> version 

platform       x86_64-pc-linux-gnu         
arch           x86_64                      
os             linux-gnu                   
system         x86_64, linux-gnu           
status                                     
major          4                           
minor          3.3                         
year           2024                        
month          02                          
day            29                          
svn rev        86002                       
language       R                           
version.string R version 4.3.3 (2024-02-29)
nickname       Angel Food Cake 
```

If you were able to open RStudio and the console printed something similar to what is shown above, then you have successfully installed `R` and RStudio in your machine.

# 2. **Accessing example notebooks**

All notebooks created for this workshop are publicly available through our GitHub [repository](https://github.com/aodn/training).

Note that although the repository is publicly available in GitHub, you will need to have been granted access to the API services used in the notebooks. You don´t need special access to connect directly with public datasets. If the training exercises require the use of API calls, you will receive access credentials in advance.

## 2.1 **Making example notebooks accessible in your local machine**

As mentioned above, all notebooks are in public repository in GitHub. You can use `git` to clone this repository to your local machine. If you do not have `git` installed in your machine, but would like to install it, head over to their [website](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) for instructions and to download installers that match the operating system in your machine.

### 2.1.1 **Cloning a repository**

If you have `git` installed in your machine, follow these instructions.

1.  Head over our [public repository](https://github.com/aodn/training) containing the example notebooks.
2.  Click on the green **Code** button, located to the left *About* section.
3.  This will open a small tab, click on **HTTPS**, and you will see a URL ending in *.git.*
4.  Click on the two boxes to copy the link ending in *.git*. Alternatively, you can highlight the link and copy it.
5.  Open Git Bash in your machine.
6.  Navigate to the folder where you would like to clone the repository. You can use the `cd` command to do this. For example, if you would like to navigate to your documents, you could type: `cd /c/Users/your_user_name/Documents/` and press ENTER/RETURN.
7.  Finally type: `git clone [https://github.com/aodn/training.git](https://github.com/aodn/training.git)` and press ENTER/RETURN. This will create an exact copy of our repository in your machine.

### 2.1.2 **Downloading a repository**

If you do not have `git` installed in your machine, you can simply download the repository as a compressed folder (`zip` format). Follow the instructions below:

1.  Head over our [public repository](https://github.com/aodn/training) containing the example notebooks. You will see the page shown in the figure above.
2.  Click on the green **Code** button, located to the left *About* section.
3.  This will open a small tab showing **Download ZIP** as the last item in the list (see blue box in figure above). Click **Download ZIP** and a compressed (`zip`) folder will be downloaded.
4.  When the download is completed, un-compress this folder, and place it in the folder of your choice.

# 3. Installing `R` packages

In our repository, we included an `R` script that automatically checks that all libraries used in this notebook are installed in your machine. If there are any missing libraries, then the script will install them for you. This script can be found in the `notebooks` folder of our repository and it is called **`Installing_R_libraries.R`**

To run this script, use RStudio to open the repository that you cloned/downloaded in the previous step. Head over to the console and type the following lines:

``` r
source("R_based_scripts/Installing_R_libraries.R")
checking_libraries()
```

This will start the process of checking all packages are installed in your machine and install any missing packages.

# 4. Install IMOS-related `R` packages

There are two `R` packages that allows to interact with IMOS data.

## 4.1 Animal Tracking `remora` package

[`remora`](https://github.com/IMOS-AnimalTracking/remora) is an R package enabling the integration of animal acoustic telemetry data with oceanographic observations collected by ocean observing programs. It includes functions for:

-   Interactively exploring animal movements in space and time from acoustic telemetry data\
-   Performing robust quality-control of acoustic telemetry data as described in Hoenner et al. 2018\
-   Identifying available satellite-derived and sub-surface in situ oceanographic datasets coincident and collocated with the animal movement data, based on regional Ocean Observing Systems\
-   Extracting and appending these environmental data to animal movement data

Whilst the functions in `remora` were primarily developed to work with acoustic telemetry data, the environmental data extraction and integration functionalities will work with other spatio-temporal ecological datasets (eg. satellite telemetry, species sightings records, fisheries catch records).

To install `remora`

remora requires R version \>= 3.6.0

You will need the `remotes` package to install `remora`:

```         
install.packages("remotes")
library("remotes")     
```

The latest stable version of remora can be installed from GitHub:

```         
remotes::install_github('IMOS-AnimalTracking/remora', build_vignettes = TRUE, dependencies = TRUE)
```

## 4.2 Biological Ocean Observer `planktonr` package

[`planktonr`](https://github.com/PlanktonTeam/planktonr) is an `R` package that facilitates the download, analysis and visualisation of phytoplankton and zooplankton data. Our initial focus will be on plankton data stored on the Australian Ocean Data Network (AODN) and collected by the Integrated Marine Observing System (IMOS), but we hope to expand to other plankton data sets in the future.

Be aware that this package is in the very early stages of development. Functions and documentation are not complete so installing at the moment is at your own risk. If you are still interested, you can install the development version from GitHub with:

```         
# install.packages("devtools")
devtools::install_github("PlanktonTeam/planktonr")
```

Thanks to the team at the Integration and Application Network (ian.umces.edu/media-library) for the plankton symbols used in the `planktonr` hex sticker.

# 5. Installing QGIS and plugins

1.  Visit [qgis.org](https://qgis.org/resources/installation-guide/) for installing the latest version of QGIS.
2.  If wanting to follow allong, we will be using LTR Bratislava 3.40
3.  We will be using a plugin called "THREDDS Explorer". Visit [IHCantabria's GitHub](https://github.com/IHCantabria/THREDDSExplorer?tab=readme-ov-file#installation) and follow the instructions for installing (Currently only works on Windows machines).
4.  Once installed, add a new server to the THREDDS Explorer pointing to "<https://thredds.aodn.org.au/thredds/>"
5.  Install the "Point Sampling Tool" plugin, available through the plugin browser in QGIS
