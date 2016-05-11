#include "Grid.h"


Grid::Grid(const size_t &level) 
{
        const size_t temp = pow(2,level);
        h_ = 1.0/temp;
        numGrid_ = temp+1;
        const size_t numTotPoints=numGrid_*numGrid_;
        this->f_.data_.resize(numTotPoints,0.0);
        this->res_.data_.resize(numTotPoints,0.0);
        this->u_.data_.resize(numTotPoints,0.0);
        //std::cout << "Level " << level << " grid constructed with total grid points " << numTotPoints << std::endl;  
}




            
