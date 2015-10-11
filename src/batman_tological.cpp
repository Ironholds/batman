#include "batman_tological.h"

void batman_tological::lowercase(std::string& x){
  unsigned int input_size = x.size();
  for(unsigned int i = 0; i < input_size; i++){
    x[i] = tolower(x[i]);
  }
}

int batman_tological::to_logical_single(std::string x){
  
  // Lowercase
  lowercase(x);
  
  // Check for true/false vals
  if(true_vals.find(x) != true_vals.end()){
    return true;
  }
  
  if(false_vals.find(x) != false_vals.end()){
    return false;
  }
  
  // If nothing, NA!
  return NA_INTEGER;
}

LogicalVector batman_tological::to_logical_vector(std::vector < std::string > x){
  
  unsigned int input_size = x.size();
  LogicalVector output(input_size);
  
  for(unsigned int i = 0; i < input_size; i++){
    output[i] = to_logical_single(x[i]);
  }
  
  return output;
}

batman_tological::batman_tological(std::vector < std::string > custom_true,
                                   std::vector < std::string > custom_false){
  
  // Handle possible custom values and language
  // values.
  unsigned int true_size = custom_true.size();
  if(true_size){
    for(unsigned int i = 0; i < true_size; i++){
      true_vals.insert(custom_true[i]);
    }
  }
  
  unsigned int false_size = custom_false.size();
  if(false_size){
    for(unsigned int i = 0; i < false_size; i++){
      false_vals.insert(custom_false[i]);
    }
  }
}
