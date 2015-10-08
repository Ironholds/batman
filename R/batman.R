
#' @title Convert categorical representations of logicals to actual logicals
#'
#' @description Survey systems and other third-party data sources commonly use non-standard representations of logical values
#' when it comes to qualitative data - "Yes", "No" and "N/A", say. batman is a package designed to seamlessly convert these into
#' actual logical values.
#' 
#' @seealso \code{to_logical}
#' 
#' @useDynLib batman
#' @importFrom Rcpp sourceCpp
#' @docType package
#' @name batman
NULL

#' @title Convert categorical representations of true/false values to a logical
#' 
#' @description \code{to_logical} is designed for the situation where you have categorical data
#' (perhaps from a survey, or direct user input) that represents TRUE/FALSE values as something
#' other than TRUE/FALSE - "Yes", "No", "None", "Y" or "False", say. With \code{to_logical}
#' you can easily convert a vector of these values into an actual, logical vector, using
#' either a predefined set of accepted TRUE or FALSE equivalents, or a set you specify
#' yourself.
#' 
#' @param x a vector of categorical TRUE/FALSE/NA values.
#' 
#' @param custom_true a vector of values to consider, in addition to the ones
#' \code{to_logical} already recognises, TRUE. Empty by default. Note that
#' the comparison code is case-insensitive, so there's no need to include
#' (for example) both "ja" and "Ja".
#' 
#' @param custom_false a vector of values to consider, in addition to the ones
#' \code{to_logical} already recognises, FALSE. Empty by default; see the notes
#' on case sensitivity above.
#' 
#' @examples
#' # A very simple example using the pre-known true and false equivalents
#' categorical_values <- c("true","t","y","yes","f","no","1")
#' to_logical(categorical_values)
#' 
#' # Use a custom specifier
#' categorical_values <- c("NA","NA","NA","NA","NA,"NA,"NA","NA","Batman")
#' to_logical(categorical_values, custom_true = c("Batman"))
#' 
#' @export
to_logical <- function(x, custom_true = c(), custom_false = c()){
  return(to_logical_(x, custom_true, custom_false))
}
