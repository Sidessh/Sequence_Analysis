# Sequence_Analysis

# Bioinformatics Sequence Analysis Web App

This project is a Shiny web application built in R for performing sequence analysis on FASTA files. It allows users to upload FASTA files containing DNA or protein sequences, perform basic sequence analysis, and visualize the results.

## Features

- **Upload FASTA File**: Users can upload FASTA files containing biological sequences (DNA, RNA, or protein).
- **Nucleotide or Amino Acid Count**: Performs counting of nucleotides (A, T, C, G) for DNA sequences or amino acids for protein sequences.
- **Visualizations**: Generates plots or visual representations of sequence analysis results (e.g., bar plots for nucleotide/amino acid frequencies).

## Installation and Running

### Prerequisites

- R and RStudio installed on your local machine.
- Required R packages: `shiny`, `Biostrings` (for sequence analysis).

### Running the App

1. Clone or download this repository to your local machine.

2. Open the R project in RStudio.

3. Install necessary packages if not installed:
   ```R
   install.packages("shiny")
   install.packages("htmltools")
   if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
    BiocManager::install("Biostrings")
    BiocManager::install("seqinr")

Run the Shiny app by opening the app.R file and clicking on the "Run App" button in RStudio.

Access the app in your web browser at the specified URL (usually something like http://127.0.0.1:XXXX).

Usage
Upon running the app, the main interface allows users to upload a FASTA file.
After file upload, the app calculates and displays nucleotide or amino acid, sequence, counts and visualizes the results.
    
