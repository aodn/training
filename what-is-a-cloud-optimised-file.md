# Slide 1: Introduction to Cloud-Optimized Files
## Rethinking Data Storage: Introduction to Cloud-Optimized Formats
**Modern File Architectures for Large-Scale Geospatial Analytics**

---

### What it is
Storage formats designed specifically to enable fast, efficient access to massive datasets directly over object storage without requiring local file downloads.

### The Problem
Traditional monolithic file formats require downloading the entire file to read a subset of data. This creates bandwidth bottlenecks and slow compute workflows at scale.

### The Solution
Cloud-optimized files support chunking and internal spatial or columnar indexes, allowing systems to use **HTTP range requests** to read only the bytes needed.

---

# Slide 2: Why Cloud-Optimized for IMOS data?
## Overcoming Legacy Storage Limits

* **Eliminated File Proliferation:** Consolidate millions of fragmented daily files into single, scalable, virtualized stores.
* **Parallel Cloud Reading:** Chunks can be read simultaneously across distributed compute nodes without read locks.
* **Superior Compression:** Larger, unified arrays allow compression algorithms to work across space and time dimensions.
* **Metadata-First Architecture:** Inspect schema and dimensions instantly without downloading or opening bulk data payloads.

---

# Slide 3: Core Formats
## Tailored Architectures for Different Data Structures

* **Parquet for Vector Data:** A columnar format optimized for tabular and geometric features, enabling fast filtering across millions of records.
* **Zarr for Gridded Data:** A chunked, N-dimensional array format designed for complex multi-variable raster and climate datasets.
* **Metadata Separation:** Both formats allow metadata to be read instantly without scanning the full underlying dataset.

---

# Slide 4: Parquet vs. Zarr
## Matching the Format to the Data Model

Different data models require different structural optimizations for cloud-native performance.

| Feature | Parquet | Zarr |
| :--- | :--- | :--- |
| **Primary Data Model** | Vector / Feature Collections | Gridded / N-Dimensional Arrays |
| **Data Layout** | Columnar Storage | Chunked Array Blocks |
| **Key Use Case** | Point observations, polygons, tables | Satellite imagery, climate models, rasters |

* **Byte-Range Requests:** Both formats eliminate full-file downloads by reading target byte ranges directly.

---

# Slide 5: User Benefits
## Faster Insights, Less Overhead

* **Faster Subsetting:** Fetch only the specific spatial boundary, variable, or time slice you need using direct HTTP range requests—no full-file reads required.
* **Rapid Downloads:** Smaller, better compressed data payloads mean vastly reduced transfer times and lower bandwidth usage.
* **Instant Schema Access:** Inspect data structure, coordinate reference systems, and variable metadata instantly without parsing heavy payload files.

---