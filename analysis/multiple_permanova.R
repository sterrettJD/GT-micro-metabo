# manage package dependencies
if(!require("argparse", quietly=T)){
    install.packages("argparse", repos = "https://cloud.r-project.org")
}

if(!require("vegan", quietly=T) || packageVersion("vegan") < "2.6"){
    install.packages("vegan", repos = "https://cloud.r-project.org")
}

parser <- argparse::ArgumentParser(description="Run PERMANOVA using Adonis2")

parser$add_argument("dist",
                    help="distance matrix to be used")
parser$add_argument("metadata",
                    help="metadata file to be used")
parser$add_argument("RHS",
                    help="a string formula for the 
                          right hand side of the Adonis2 formula")
parser$add_argument("strata", 
                    default=NULL,
                    nargs="?",
                    help="a string formula for Adonis2 strata")


args <- parser$parse_args()

# read distance matrix
dist.mat <- read.csv(args$dist, header=T)
rownames(dist.mat) <- dist.mat$X
dist.mat$X <- NULL
colnames(dist.mat) <- rownames(dist.mat)

# read metadata
metadata <- read.csv(args$metadata)

# get formula
form <- as.formula(paste("dist.mat ~", args$RHS))

print("Running Adonis for the following formula:")
print(form)
print(paste("Permuting within the strata:", args$strata))

# run adonis

if(!is.null(args$strata)){
    res <- vegan::adonis2(formula=form, data=metadata,
                      strata=metadata[,args$strata],
                      permutations=99999)
} else {
    res <- vegan::adonis2(formula=form, data=metadata,
                      permutations=99999)
}


print(res)