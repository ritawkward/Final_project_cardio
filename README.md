---
title: Heart Disease Mortality Data Among US Adults
author: Zihan(Teddy)Guo
output: github_document
---

# Introduction with this Project

This project analyzes heart disease mortality among U.S. adults aged 35 years and older from 2018 to 2020
using data from the Centers for Disease Control and Prevention(CDC). The purpose of this project is to 
describe demographic and geographic variations in heart disease mortality, to visualize mortality differences
by sex, and to use a regression model to identify factors assocaited with mortality rates. 

# Contents of the report

* Introduction
* Descriptive Statistics
* Mortality by sex
* Regression model

# Report Description--Final_report.html

**final_report.html is located in the output**
* Loads the all the report from the output folder
* Includes the intro, graphs and also the key points for each visualizations

# Code Description

**code/00_code.R**
* Reads the dataset from the url
* Cleans and recodes the variable
* Saved and cleaned to the `output/data_clean.rds`

**code/01_descriptive.R**
* Reads the dataset from the `output/00_code.R`
* Creates the descriptive graphs
* Saves the outputs to the `output/table_one.rds`

**code/02_graphical.R**
* Reads the dataset from the `output/00_code.R`
* Creates the ggplot specifically bar chart using ggplot function
* Saves the outputs to the `output/figure2_plot.png`

**code/03_regression.R**
* Reads the dataset from the `output/00_code.R`
* Creates the regression tables
* Saves the outputs to the `output/model_table.rds`

**code/04_render_report.R**
* Use the render() to finalize the report (Cardiovascular.Rmd)
* Output saved to `output/final_report.html`

**Synchronize your package repository**
* This project use renv to ensure the R package environment is fully reproducible. 
* If you clone this repository, you can just use `make install`

**Make Rule--for the renv**
* Make Install
* Make Clean
* Make

# Potential Problem
**If you get an error with the package issues, then create a Rproject with my final project directory, then run 
`make install`, and `make clean` and `make`**

# Docker Build
* This project uses Docker and Make to generate a fully reproducible HTML report.
* The Docker image can be built using `make docker-build`

# Running the Docker file
* The report can be built by running the Makefile target docker-report.
* The `final_report` folder will be created automatically if it does not already exist

## Build the report (Mac)
* From your local computer, run `make docker-report`
* Output the final HTML report to `final_report/final_report.html`



