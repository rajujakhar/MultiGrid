#include "GridUtil.h"

TwoDimArr& GridUtil::getVec()
{
        return u_;
}

GridUtil::GridUtil(const size_t &level)
{
        size_t temp = pow(2,level);
        numGrid_ = temp+1;
        h_ = 1.0/temp;
        
        u_.data_.resize(numGrid_*numGrid_,0.0);
         
}

GridUtil::~GridUtil()
{
        //Empty Destructor      
}

/*
This function sets the initial boundary conditions defined by function g in the exercise sheet 
*/

void GridUtil::setBCs()
{

      double x1,y1,x2,y2;
      size_t size = numGrid_*numGrid_;
      for(size_t i=0, j=(numGrid_-1)*numGrid_; (i<numGrid_) && (j<size); ++i,++j)
      {
            x1 = h_*(i%numGrid_);
            x2 = h_*(j%numGrid_);
            y1 = 0.0;
            y2 = h_*(numGrid_-1);

            u_.data_[i] = sin(M_PI*x1)*sinh(M_PI*y1);
            u_.data_[j] = sin(M_PI*x2)*sinh(M_PI*y2);
      }

      size_t leftIndex = numGrid_;
      size_t rightIndex;
      
      while(leftIndex < size)
      {
            rightIndex = leftIndex + numGrid_ - 1;
            x1 = h_*(leftIndex%numGrid_);
            x2 = h_*(rightIndex%numGrid_); 
            y1 = h_*(leftIndex/numGrid_);
            y2 = h_*(rightIndex/numGrid_); 

            u_.data_[leftIndex] = sin(M_PI*x1)*sinh(M_PI*y1);
            u_.data_[rightIndex] = sin(M_PI*x2)*sinh(M_PI*y2);

            leftIndex+= numGrid_;
      }
}


/*
This function displays the grid entries u
*/
void GridUtil::displayGrid() const
{
        std::cout << "Grid Entries:\n ";
        
        for(int row=(numGrid_ - 1) ; row>= 0; --row)
        {
                size_t index;
                for(size_t col=0; col<numGrid_; ++col)
                {
                        index = row*numGrid_ + col;
                        //cout << index << "\t"; 
                        std::cout << u_.data_[index] << "\t";
                }        
                
                std::cout << "\n";
        }
}

