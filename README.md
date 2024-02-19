# DS4002-Project 1: Sentiment Analysis of The Office Characters
### Group Leader: Nina Ysabel Alinsonorin 
### Group 2: Grace Guinan & Addison Lowman 

## (1) Software and Platform
- Software type: R Studio
- Package: schrute
- Platform: Mac/Windows

 ## (2) A Map of Documentation 
- This repository contains the contents necessary to implement our sentiment analysis which consists of 3 main folders. The contents of each are as follows:
- DATA FOLDER: This folder contains all of the data for this project- specifically, a csv file, "office_vader.csv", with all text dialogue from "The Office" and "theoffice.rda", which has the VADER sentiment analysis package preloaded.
- OUTPUT FOLDER: This folder contains all generated output, namely all graphs and statistical figures which we drew our analysis from.
- SCRIPTS FOLDER: This folder contains all source code for this project, including a MASTER script file (which has all other script files) and individual script files.  

## (3) Result Replication 
In this section, you should give explicit step-by-step instructions to reproduce the Results of your study. These instructions should be written in straightforward plain English, but they must be concise, but detailed and precise enough, to make it possible for an interested user to reproduce your results without much difficulty. N.B. This section will be crucial for the CS1 assignment, where you'll be required to reproduce the results of other groups. Therefore, make sure to explain this section thoroughly. 
### In order to replicate the results of our study, you must follow these steps: 
1. Download office_vader.csv from the DATA folder
2. Go to the SCRIPTS file and download or copy the contents of the "project1_getting_varder_dataset.R"
3. Open R studio and open the file you downloaded or create a new file and paste the contents
4. Change this line: write.csv(final_dat, "C:\\Users\\Grace\\Desktop\\Data Science Project\\office_vader.csv", row.names = FALSE) to have the file path of where the data would be downloaded on your computer
5. Run this file
  - If you run into package install problems, run packages.install() on any package that you may need to run the file 
7. Go back to the SCRIPTS file and download or copy the contents of the "project1_analyzing_vader.R"
8. In R studio and open the file you downloaded or create a new file and paste the contents
9. Run this file

## (4) References
Lindblad B (2022). schrute: The Entire Transcript from the Office in Tidy Format. R package version 1.0.1, https://bradlindblad.github.io/schrute/ [Accessed February 2024].

K. Roehick, “Package ‘vader’,” in Valence Aware Dictionary and sEntiment Reasoner (VADER), September 2020. Available: Katherine Roehick, https://cran.r-project.org/web/packages/vader/vader.pdf [Accessed February 2024].
