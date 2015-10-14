# NA N-A N/A Batman

`batman` is a package for taking representations of logical values commonly found in qualitative and categorical data, and mapping them to *actual* logical values.

In survey data and similar it's not uncommon to see logical values represented as things like:

1. "Yes"
2. "No"
3. "N/A"

This is nice and all, but when you throw it into R...

    > as.logical(c("Yes","No","N/A"))
    [1] NA NA NA
    
`batman` maps common representations to actual logicals. It contains one core function, `to_logical`, designed to do just that:

    > library(batman)
    > to_logical(c("Yes","No", "N/A"))
    [1]  TRUE FALSE    NA

The goal is to have it not only provide this functionality, but provide this functionality in an internationalised way -
with support for as many languages as possible. If you're interested in contributing localised equivalents to TRUE or FALSE
values, please open a [GitHub isuse](https://github.com/Ironholds/batman/issues) with your translations! You'll
be credited in the DESCRIPTION file. See the [contribution guidelines](https://github.com/Ironholds/batman/blob/master/CONTRIBUTING.md).

Please note that this project is released with a [Contributor Code of Conduct](https://github.com/Ironholds/batman/blob/master/CONDUCT.md). By participating in this project
you agree to abide by its terms.

# Installation

`batman` isn't on CRAN yet (it works perfectly, we'd just like more translations), so installation consists of:

    > library(devtools)
    > install_github("ironholds/batman", ref = "0.1.0")

# Dependencies

Other than base R, the only dependency is [Rcpp](https://cran.r-project.org/web/packages/Rcpp/index.html), which
we use for added speed when parsing strings (and it's worthwhile - the code can handle 700k strings in 137 milliseconds)
