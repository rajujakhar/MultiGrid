#include "TwoDimArr.h"
 
/*TwoDimArr::TwoDimArr(const size_t &length, const double init_val=0.0)
{
        //std::cout << "Constructor called\n";
        //this->data_.resize(length, init_val);
        // Empty constructor
} */

// This opearator returns the 1D mapping data_  value of a Two dimensional array  
const double& TwoDimArr::operator() (const size_t &i, const size_t& j, const size_t& numGrid) const
{       
       std::cout << "Const version called\n";
        
       // std::cout << ind << std::endl;
        return this->data_[i*numGrid+j]; 
}




double& TwoDimArr::operator() (const size_t &i, const size_t& j, const size_t& numGrid)
{
        //std::cout << "Non const version called\n";
       // size_t ind =i*numGrid+j; 
       // std::cout << ind << std::endl;
        return this->data_[i*numGrid+j]; 
}





/*int main()
{

TwoDimArr arr(25);
size_t numGrid = 5;

//arr.operator()(1,2,numGrid);
std::cout << " Value before:  " << arr(2,3,5) << std::endl; 
arr(2,3,5) = 1.;
std::cout << " Value after:  " << arr(2,3,5) << std::endl; 

for(int i =-0; i< 25; ++i)
{
        std::cout <<  arr.data_[i];
}
std::cout << std::endl;
    //for(int i=0;i<10;++i  )arr(i,4,numGrid);
} 
 */ 
