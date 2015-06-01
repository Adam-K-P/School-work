// Adam Pinarbasi
// $Id: bigint.cpp,v 1.61 2014-06-26 17:06:06-07 - - $

#include <cstdlib>
#include <exception>
#include <limits>
#include <stack>
#include <stdexcept>
#include <vector>
using namespace std;

#include "bigint.h"
#include "debug.h"

using digit_t = unsigned char;
using bigvalue_t = vector<digit_t>;

bigint::bigint (const string& that) {
   auto itor = that.cbegin();
   negative = false;
   if (itor != that.cend() and *itor == '_') {
      negative = true;
      ++itor;
   }
   size_t this_s = that.size() - 1; 
   do {
      if (negative and this_s == 0) break;
      if ((that.size() == 1 and that.at(0) == 0) or
         (that.size() == 2 and that.at(0) == 0 and negative)) {
         negative = false; //ensure it's not negative
         break;
      }
      if (that.at(this_s) - '0' != 0)
         big_value.push_back(that.at(this_s) - '0');
   }
   while (this_s-- != 0);
}

//Addition
bigvalue_t bigint::do_bigadd (const bigvalue_t& left, 
                              const bigvalue_t& right) const {
   bigvalue_t result;
   bool carry = false;
   size_t r_size = (left.size() > right.size() ? left.size() 
                                               : right.size());
   for (size_t i = 0; i < r_size; ++i) {
      digit_t left_val = (i >= left.size() ? 0 : left.at(i));
      digit_t right_val = (i >= right.size() ? 0 : right.at(i));
      digit_t sum = left_val + right_val + (carry ? 1 : 0);
      if (sum >= 10) {
         result.push_back(sum % 10);
         if (i == r_size - 1) result.push_back(1);
         carry = true;
         continue;
      }
      result.push_back(sum);
      carry = false;
   }
   return result;
}

//Removes all high order zeros from a bigvalue_t
void trim_zeros (bigvalue_t& result) {
   if (result.size() == 0) return;
   for (size_t j = result.size() - 1; result.at(j) == 0; --j) {
      if (j == 0) { result.resize(0); break; }
      result.pop_back();
   }
}

//Subtraction 
bigvalue_t left_copy; 
bigvalue_t bigint::do_bigsub (const bigvalue_t& left,
                              const bigvalue_t& right) const {
   bigvalue_t result;
   left_copy = left; //circumvents const
   size_t r_size = left.size();
   result.resize(r_size);
   for (size_t i = 0; i < r_size; ++i) {
      digit_t left_val = left_copy.at(i);
      digit_t right_val = i >= right.size() ? 0 : right.at(i);
      if (left_val < right_val) {
         left_val += 10;
         size_t j = 1;
         while (left_copy.at(i + j) == 0) left_copy.at(i + (j++)) = 9;
         left_copy.at(i + j) -= 1;
      }
      result.at(i) = left_val - right_val;
   }
   trim_zeros(result);
   return result;
}

//Multiplication
bigvalue_t bigint::do_bigmull (const bigvalue_t& left,
                               const bigvalue_t& right) const {
   bigvalue_t result;
   if(left.size() == 0 or right.size() == 0) return result;
   size_t l_size = left.size();
   size_t r_size = right.size();
   result.resize(l_size * r_size > l_size + r_size ? l_size * r_size 
                                                   : l_size + r_size);
   for (size_t i = 0; i < l_size; ++i) {
      digit_t c = 0;
      for (size_t j = 0; j < r_size; ++j) {
         digit_t prod = c + result.at(i + j) + (left.at(i) * 
                                                right.at(j) );
         result.at(i + j) = prod % 10;
         c = prod / 10;
      }
      if (c != 0) result.at(i + r_size) = c;
   }
   result.shrink_to_fit();
   trim_zeros(result);
   return result;
}

//returns true if left is greater than right
//and false otherwise 
bool bigint::do_bigless (const bigint& left, 
                         const bigint& right) const {
   if (left.big_value.size() > right.big_value.size()) return true;
   if (left.big_value.size() < right.big_value.size()) return false;
   size_t i = left.big_value.size() - 1;
   do {
      if (left.big_value.at(i) > right.big_value.at(i)) return true;
      if (left.big_value.at(i) < right.big_value.at(i)) return false;
   } while (i-- != 0);
   return false;
}

bigint operator+ (const bigint& left, const bigint& right) {
   bigint result;
   if(left.negative != right.negative) {
      bool order = left.do_bigless(left, right);
      result.negative = order ? left.negative : right.negative;
      if (order) result.big_value = left.do_bigsub(left.big_value, 
                                                   right.big_value);
      else       result.big_value = right.do_bigsub(right.big_value, 
                                                    left.big_value);
   }
   else {
      result.big_value = left.do_bigadd(left.big_value, 
                                        right.big_value);
      result.negative = left.negative;
   }
   return result;
}

bigint operator- (const bigint& left, const bigint& right) {
   bigint result;
   if(left.negative != right.negative) {
      result.big_value = left.do_bigadd(left.big_value, 
                                         right.big_value);
      result.negative = left.negative;
   }
   else {
      if(left.do_bigless(left, right)) {
         result.negative = false;
         result.big_value = left.do_bigsub(left.big_value, 
                                           right.big_value);
      }
      else { 
         result.negative = true;
         result.big_value = left.do_bigsub(right.big_value, 
                                            left.big_value);
      }
   }
   return result;
}

bigint operator+ (const bigint& right) {
   bigint result = right;
   result.negative = false;
   return result;
}

bigint operator- (const bigint& right) {
   bigint result = right;
   result.negative = true;
   return result;
}

long bigint::to_long() const {
   long result = 0;
   bigint max { "9223372036854775807" };
   if (*this > max or *this < -max)  
      throw range_error("Runtime error: exponent too large in raise");
   long i = 1;
   for (size_t j = 0; j < (size_t)this->big_value.size(); ++j) {
      result += ((long)this->big_value.at(j) * i);
      i *= 10;
   }
   return result;
}

bool abs_less (const bigvalue_t& left, const bigvalue_t& right) {
   if (left.size() < right.size()) return true;
   if (left.size() > right.size()) return false;
   if (left.size() == 0 or right.size() == 0) return false;
   size_t i = left.size() - 1;
   do {
      if (left.at(i) < right.at(i)) return true;
      if (left.at(i) > right.at(i)) return false;
   } while (i-- != 0);
   return false;
}

bigint operator* (const bigint& left, const bigint& right) {
   bigint result;
   result.negative = (left.negative == right.negative ? false : true);
   result.big_value = left.do_bigmull(left.big_value, right.big_value);
   return result;
}

void divide_by_2 (bigvalue_t& value) {
   size_t i = value.size() - 1;
   bool odd = false;
   do {
      digit_t quotient = ((odd ? 10 : 0) + value.at(i)) / 2;
      digit_t remainder = value.at(i) % 2;
      if (remainder == 1) odd = true;
      else odd = false;
      value.at(i) = quotient;
   } while (i-- != 0);
   trim_zeros(value);
}

//Division
using quot_rem = pair<bigint, bigint>;
quot_rem bigint:: divide (const bigvalue_t& left, 
                          const bigvalue_t& right) const {
   bigint zero, divisor, quotient, remainder, power_of_2, two;
   divisor.big_value = right;
   remainder.big_value = left;
   power_of_2.big_value.push_back(1);
   two.big_value.push_back(2);
   while (abs_less(divisor.big_value, remainder.big_value)) {
      divisor.big_value.resize(left.size());
      power_of_2.big_value.resize(left.size());
      divisor = divisor * two;
      power_of_2 = power_of_2 * two;
   }
   while (abs_less(zero.big_value, power_of_2.big_value)) {
      if (not abs_less(remainder.big_value, divisor.big_value)) {
         remainder = remainder - divisor;
         quotient = quotient + power_of_2;
      }
      divide_by_2(divisor.big_value);
      divide_by_2(power_of_2.big_value);
   }
   return {quotient, remainder};
}

bigint operator/ (const bigint& left, const bigint& right) {
   if (right.big_value.size() == 0)    
      throw domain_error ("divide by 0");
   bigint result;
   result = left.divide (left.big_value, right.big_value).first;
   result.negative = (left.negative == right.negative ? false : true);
   trim_zeros(result.big_value);
   return result;
}

bigint operator% (const bigint& left, const bigint& right) {
   bigint result;
   result = left.divide (left.big_value, right.big_value).second;
   result.negative = (left.negative == right.negative ? false : true);
   trim_zeros(result.big_value);
   return result;
}

bool operator== (const bigint& left, const bigint& right) {
   if(left.negative != right.negative or left.big_value.size() != 
                                         right.big_value.size()  ) 
      return false;
   size_t i = left.big_value.size() - 1;
   do if(left.big_value.at(i) != right.big_value.at(i)) return false;
   while(i-- != 0);
   return true;
}

bool operator< (const bigint& left, const bigint& right) {
   if (left.negative != right.negative) 
      return left.negative ? true : false;
   if (left.big_value.size() > right.big_value.size())
      return left.negative ? true : false;
   if (left.big_value.size() < right.big_value.size())
      return left.negative ? false : true;
   size_t i = left.big_value.size() - 1;
   do {
      if (left.big_value.at(i) > right.big_value.at(i)) 
         return left.negative ? true : false;
      if (left.big_value.at(i) < right.big_value.at(i)) 
         return left.negative ? false : true;
   } while(i-- != 0);
   return false;
}

ostream& operator<< (ostream& out, const bigint& that) {
   if (that.big_value.size() == 0) {
      out << "0";
      return out;
   }
   if (that.negative) out << "-";
   size_t i = that.big_value.size() - 1;
   size_t j = 0;
   do {
      out << (char)(that.big_value.at(i) + '0') ;
      //70 characters in total per line in dc output
      if (++j % 69 == 0) out << "\\" << endl;
      
   } while (i-- != 0);
   return out;
}

bigint pow (const bigint& base, const bigint& exponent) {
   bigint base_copy = base;
   long expt = exponent.to_long();
   bigint result { "1" };
   if (expt < 0) {
      base_copy = result / base_copy;
      expt = - expt;
   }
   while (expt > 0) {
      if (expt & 1) { //odd
         result = result * base_copy;
         --expt;
      }else { //even
         base_copy = base_copy * base_copy;
         expt /= 2;
      }
   }
   return result;
}

