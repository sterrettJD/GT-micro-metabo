library(argparse)

parser <- ArgumentParser(description="Run PERMANOVA using Adonis2")

parser$add_argument("dist",
                    help="distance matrix to be used")
parser$add_argument("metadata",
                    help="metadata file to be used")
parser$add_argument("formula",
                    help="a string formula (with no spaces) for Adonis2")


# read distance matrix

# read metadata

# get formula

# run adonis