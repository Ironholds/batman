# batman

`batman` is a package for taking representations of logical values commonly found in qualitative and categorical data, and mapping them to *actual* logical values.

In survey data and similar it's not uncommon to see logical values represented as things like:

1. "Yes"
2. "No"
3. "N/A"

This is nice and all, but when you throw it into R...

  
    > as.logical(c("Yes","No","N/A"))
    [1] NA NA NA
    
`batman` maps common representations to actual logicals.

# Installation

# Dependencies
