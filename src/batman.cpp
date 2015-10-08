#include "batman_tological.h"

//[[Rcpp::export]]
LogicalVector to_logical_(std::vector < std::string > x, std::vector < std::string > custom_true,
                          std::vector < std::string > custom_false){
  batman_tological bat_mobile(custom_true, custom_false);
  return bat_mobile.to_logical_vector(x);
}
