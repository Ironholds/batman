#include <Rcpp.h>
using namespace Rcpp;

#ifndef __BATMAN_TOLOGICAL__
#define __BATMAN_TOLOGICAL__

class batman_tological {
  
private:
  
  std::set < std::string > true_vals;
  
  std::set < std::string > false_vals;
  
  void lowercase(std::string& x);
  
  int to_logical_single(std::string x);
  
public:
  
  LogicalVector to_logical_vector(std::vector < std::string > x);
  
  batman_tological(std::vector < std::string > custom_true, std::vector < std::string > custom_false);
  
};
#endif
