#include "TwoDimArr.h"
 
/*TwoDimArr::TwoDimArr(const size_t &length, const real init_val=0.0)
{
        //std::cout << "Constructor called\n";
        //this->data_.resize(length, init_val);
        // Empty constructor
} */

// This opearator returns the 1D mapping data_  value of a Two dimensional array  
const real& TwoDimArr::operator() (const size_t &i, const size_t& j, const size_t& numGrid) const
{       
       //std::cout << "Const version called\n";
        
       // std::cout << ind << std::endl;
        return this->data_[i*numGrid+j]; 
}




real& TwoDimArr::operator() (const size_t &i, const size_t& j, const size_t& numGrid)
{
        //std::cout << "Non const version called\n";
        return this->data_[i*numGrid+j]; 
}

