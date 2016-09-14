#' @title TRUE/FALSE equivalents in categorical data for various
#' languages
#'
#' @description A dataset containing the equivalents of TRUE or FALSE in
#' categorical or user-submitted data, localised to various languages
#'
#' @format A data.frame of three columns:
#' \describe{
#'   \item{language}{a two-letter language code vector of equivalents to TRUE;}
#'   \item{cat}{the actual categorical variable in that language;}
#'   \item{value}{the value (TRUE or FALSE) that \code{cat} represents.}
#' }
#' 
#' @seealso \code{\link{to_logical}}, which uses this dataset, and
#' \code{\link{get_languages}} to see what languages are available.
"categorical_booleans"

#'@title Get language codes for batman-supported languages
#'
#'@description retrieves a list of language codes for languages
#'supported by the \code{language} parameter in \code{\link{to_logical}}.
#'
#'@seealso \code{\link{categorical_booleans}}, the underlying dataset,
#'or \code{\link{to_logical}}, which uses that dataset.
#'
#'@examples
#'
#'get_languages()
#'# [1] "en"
#'
#'@export
get_languages <- function(){
  return(unique(batman::categorical_booleans$language))
}
