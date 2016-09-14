
#' @title Convert categorical representations of logicals to actual logicals
#'
#' @description Survey systems and other third-party data sources commonly use non-standard
#' representations of logical values when it comes to qualitative data - "Yes", "No" and "N/A", say.
#' batman is a package designed to seamlessly convert these into actual logical values.
#' 
#' @seealso \code{to_logical}
#' 
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
#' @param language the language to use. See \code{\link{get_languages}} for the list
#' of supported languages. If your language is not supported, you can use
#' \code{custom_true} and \code{custom_false} to provide values.
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
#' # Use a custom specifier, too
#' categorical_values <- c("NA","NA","NA","NA","NA","NA","NA","NA","Batman")
#' to_logical(categorical_values, custom_true = c("Batman"))
#' 
#' @export
to_logical <- function(x, language = "en", custom_true = character(), custom_false = character()){
  
  values <- batman::categorical_booleans[
    batman::categorical_booleans$language == language,
  ]
  if(!nrow(values)){
    if(length(custom_true) && length(custom_false)){
      warning("We have no true/false equivalents for the language you selected - relying entirely on custom_true and custom_false")
      values <- data.frame(cat = c(custom_true, custom_false),
                           value = c(rep(TRUE, length(custom_true)),
                                     rep(FALSE, length(custom_false))),
                           stringsAsFactors = FALSE)
    } else {
      stop("We have no true/false equivalents for the language you selected, and custom values have not been provided. See ?to_logical")
    }
  } else {
    if(length(custom_true) || length(custom_false)){
      values <- rbind(values,
                      data.frame(language = "language",
                                 cat = c(custom_true, custom_false),
                                         value = c(rep(TRUE, length(custom_true)),
                                                   rep(FALSE, length(custom_false))),
                                 stringsAsFactors = FALSE)
      )
    }
  }
  
  return(values$value[match(tolower(x), values$cat)])
}
