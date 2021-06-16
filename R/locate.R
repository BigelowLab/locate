#' Interpolate the locations of values within an ordered vector viewed from left to right
#'
#' Inpsired by \href{http://www.numerical.recipes/}{locate() from numerical recipes},
#'   \code{\link[base]{findInterval}} and
#'   \href{https://www.l3harrisgeospatial.com/docs/value_locate.html}{VALUE_LOCATE() from IDL}.
#'
#' @export
#' @param x vector of values (in any order) including sortable character types
#' @param vec ordered vector (ascending or descending) of same type as \code{x}
#' @param ... other arguments for \code{sapply}
#' @return vector of indices ranging from 0 to the length of \code{vec}
#' \itemize{
#' \item{0 indices indicate \code{x} values less than the left most value of \code{vec}}
#' \item{For ascending vectors, the index, i, of x is found where \code{vex[i] <= x < vec[i+1]} with an open right-hand end}
#' \item{For descending vectors, the index, i, of x is found where \code{vex[i] >= x > vec[i+1]} with an open right-hand end}
#' }
#' @examples
#' \dontrun{
#'   x <- c(13, 7, 22)
#'   locate(x, 10:19)
#'   locate(x, 19:10)
#'   locate(c("zoo", "dog", "fish", "cat"), letters)
#'   locate(c("zoo", "dog", "fish", "cat"), letters, USE.NAMES = FALSE)
#' }
locate <- function(x, vec, ...){

  nx <- length(vec)
  asc <- vec[nx] >= vec[1]

  locate_one <- function(x1, vec = NULL, asc = TRUE){

    jl <- 1
    jr <- length(vec)

    if (asc){
      if (x1 < vec[jl]) {
        return(0)
      } else if(x1 >= vec[jr]) {
        return(jr)
      }
    } else {
      if (x1 > vec[jl]) {
        return(0)
      } else if(x1 <= vec[jr]) {
        return(jr)
      }
    }

    if (asc){
      while(abs((jr - jl)) > 1){
        jm <- (jr+jl)/2
        if(x1 >= vec[jm]){
          jl <- jm
        } else {
          jr <- jm
        }
      } # while
    } else {
      while((jr - jl) > 1){
        jm <- (jr+jl)/2
        if(x1 < vec[jm]){
          jl <- jm
        } else {
          jr <- jm
        }
      } #while
    }
   as.integer(jm)
  }
  sapply(x, locate_one, vec = vec, asc = asc, ...)
}
