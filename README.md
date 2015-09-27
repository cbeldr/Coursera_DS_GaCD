Getting and Cleaning Data - Course Project
README.md
explains how all of the scripts work and how they are connected

Repository Files:
    README.md -- This file, explains how all files in the repository work and how they are connected.
    
    getdata-projectfiles-UCI HAR Dataset.zip -- Original, unmodified data needed for the project.  Downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
    
    CodeBook.md -- a code book that describes the variables, the data, and all transformations or work performed to produce the final data file.
    
    run_analysis.R -- R code used to combine, clean, and transform the original data to produce the requested dataset.
    
    data_averages.txt -- final data file.  Contains the average of each mean() and std() variable for each Subject and Activity.
    


Initial Steps:
1) Data downladed from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2) Extract data from the above zip archive and place all extracted files (regardless of initial directory in the zip archive) in your chosen R working directory

