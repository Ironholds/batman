#include "batman_tological.h"

//[[Rcpp::export]]
LogicalVector to_logical_(std::vector < std::string > x, std::vector < std::string > trues,
                          std::vector < std::string > falses){
  batman_tological bat_mobile(trues, falses);
  return bat_mobile.to_logical_vector(x);
}
