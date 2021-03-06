
options("width"=100,
        "digits.secs"=2)

r <- character()
r["CRAN"] <- "https://cloud.r-project.org"
options(repos = r)

if (exists("opt") && "exclude" %in% names(opt) &&
    opt$exclude == "" && file.exists("~/git/rcpp-logs/data/blacklist.csv")) {
    opt$exclude <- "~/git/rcpp-logs/data/blacklist.csv"
}

Sys.setenv("MAKE"="make")

Sys.setenv("BOOSTLIB"="/usr/include")   # for the borked src/Makevars of ExactNumCI
Sys.setenv("RGL_USE_NULL"="TRUE")       # Duncan Murdoch on r-package-devel on 12 Aug 2015#

if (file.exists("~/git/rcpp-logs/data/dot.Makevars")) {
    Sys.setenv("R_MAKEVARS_USER"="~/git/rcpp-logs/data/dot.Makevars")
}
