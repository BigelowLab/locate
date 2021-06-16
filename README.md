locate
================

Interpolate the locations of values within an ordered vector viewed from
left to right.

Inpsired by [locate() from numerical
recipes](http://www.numerical.recipes), `base::findInterval()` and
[VALUE\_LOCATE() from
IDL](https://www.l3harrisgeospatial.com/docs/value_locate.html).

### Requirements

-   [R v4+](https://www.r-project.org/)

### Installation

    remotes::install_github("BigelowLab/locate")

### Examples

``` r
library(locate)

x <- c(13, 7, 22)
locate(x, 10:19)
```

    ## [1]  4  0 10

``` r
locate(x, 19:10)
```

    ## [1]  7 10  0

``` r
x <- c("zoo", "dog", "fish", "cat")
locate(x, letters)
```

    ##  zoo  dog fish  cat 
    ##   26    4    6    3

``` r
locate(x, letters, USE.NAMES = FALSE)
```

    ## [1] 26  4  6  3
