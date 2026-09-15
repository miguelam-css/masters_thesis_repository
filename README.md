# Who can afford to avoid the heat?

Code for the master's thesis *Who can afford to avoid the heat? Mobility, income,
gender, and age in the response to extreme heat*, authored by Miguel Agenjo
Montejo (Tutor: Iñaki Úcar Marqués), in the context of the Masters in 
Computational Social Science at Universidad Carlos III de Madrid.

All the scripts are written in R as Quarto notebooks, which allow us to
explain and comment on decisions made in a more readable way.

## How to run the code

To ensure everything works, the scripts in `download_scripts/` should be the
first to be ran. After that, the scripts in `analysis_scripts`, in the order
the numbering at the beggining of the files indicates. 

## Computational requirements

Some of the operations in the scripts require big amounts of RAM memory
available. Whenever possible, we wrote the code in a way that makes it easier
for users with less powerful computers to run the code (we created DuckDB
datasets that allow operations that wouldn't be possible in most computers'
RAM memory, saved and loaded .RDS files that allow to free memory temporarily,
and left indications on when to restart R sessions to free memory before
running certain chunks. Still, some operations will not be possible unless
using a powerful computer or allocating lots of swap memory (the highest
RAM usage peak we registered was 110GB when running the intersectionality
model in scrip `07b`).

## Data

The data folder in this repository is empty. This a deliberate decision, since
it takes nearly 200GB of disc space. The scripts in the `download_scripts/`
folder allow to download all the required data. THe UTCI dataset is the 
only exception. It comes from the ERA5-HEAT dataset of the Copernicus
Climate Data Store (CDS) and needs a register before providing the data. The 
data were requested through the CDS web form (one archive for the peninsula and 
one for the Canary Islands (in order to request a lighter download). The
coordinates needed when downloading this datset are computed in 
`download_scripts/bounding_box_coordinates.qmd`, and can be consulted there.

## Folders

This repository is organized in four folders:

- `download_scripts/` contains the download scripts for MITMS and INE data, 
and the calculation of the bounding boxes necessary to download the UTCI data.
- `analysis_scripts/` contains preprocessing, models and figures. It is 
important to run them in the order of the number at the beginning of each file
name to make sure it works.
- `dataviz_theme/` contains a .R script with a custom ggplot theme used in all
the figures in our work, and a Quarto notebook explaining the data
visualization decisions we made to ensure accesible figures.
- `report/`  contains the tables and figures of the thesis, exported by
scripts `07a`, `07b`, `08`, `09` and `10`.
