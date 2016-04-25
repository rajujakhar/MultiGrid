#include "gridUtil.h"

// Initialise the static variable numObjects with 0
size_t GridUtil::numObjects = 0; 

GridUtil::GridUtil(const size_t &n) : numGridX_(n+1), numGridY_(numGridX_), hx_(1.0/n), hy_(hx_) 
{
        size_t numTotPoints=numGridX_*numGridY_;
        this->u_.resize(numTotPoints);
        this->f_.resize(numTotPoints);
        
        // Initialize u_ and f_ with zeros using generic algorithm defined in algorithm header
        std::fill(this->u_.begin(), this->u_.end(), 0.0);
        std::fill(this->f_.begin(), this->f_.end(), 0.0);
}

/*
This function restricts the GridUtill class to create one object
*/
GridUtil GridUtil::createInstance(const size_t &n)
{
        if(numObjects ==0)
        {
                GridUtil grid(n);
                numObjects++;
                return grid;
                 
        }
        else
        {
                throw "More than one object creation NOT allowed in the Singelton class\n";
                //return nullptr;
                
        }
        
}        
/*
This function sets the initial boundary conditions defined by function g in the exercise sheet 
*/
void GridUtil::setBCs()
{
      double x1,y1,x2,y2;
      size_t size = numGridX_*numGridY_;
      for(size_t i=0, j=(numGridY_-1)*numGridX_; (i<numGridX_) && (j<size); ++i,++j)
      {
            x1 = hx_*(i%numGridX_);
            x2 = hx_*(j%numGridX_);
            y1 = 0.0;
            y2 = hy_*(numGridY_-1);

            this->u_[i] = sin(M_PI*x1)*sinh(M_PI*y1);
            this->u_[j] = sin(M_PI*x2)*sinh(M_PI*y2);
      }

      size_t leftIndex = numGridX_;
      size_t rightIndex;
      
      while(leftIndex < size)
      {
            rightIndex = leftIndex + numGridX_ - 1;
            x1 = hx_*(leftIndex%numGridX_);
            x2 = hx_*(rightIndex%numGridX_); 
            y1 = hy_*(leftIndex/numGridX_);
            y2 = hy_*(rightIndex/numGridX_); 

            this->u_[leftIndex] = sin(M_PI*x1)*sinh(M_PI*y1);
            this->u_[rightIndex] = sin(M_PI*x2)*sinh(M_PI*y2);

            leftIndex+= numGridX_;
      }
}


/* Previous version of expensive setBCs method, Please do not remove this commented code
void setBCs(std::vector<double> &u, const size_t &numGridX_, const size_t &numGridY_)
{
        size_t size = numGridX_*numGridY_;
        for(size_t i=0; i < size; ++i)
        {
                double x = h*(i%numGridX_);
                double y = h*(i/numGridX_);
                  //cout << "x: "  << x << "y: " << y << "\t";         
                if(!isInteriorPoint(i, numGridX_, numGridY_))
                {
                        u[i] = sin(M_PI*x)*sinh(M_PI*y);
                }
                        
                 
        }
}*/
      

/*
This function determines if the given argument is a interior point of grid or not.
*/
bool GridUtil::isInteriorPoint(const size_t &index)
{
       if( (index%numGridX_ ==0) || ((index+1)%numGridX_ ==0 ))
       return false;
       else if( ((index/numGridX_) == 0) || (index/numGridX_ == (numGridY_-1)) )
       return false; 
       
       return true; 
}

/*
This function displays the grid entries of u_  
*/
void GridUtil::displayGrid() const
{
        //u_[0] = 0;
        std::cout << "Grid Entries:\n ";
        for(int row=(numGridY_ - 1) ; row>= 0; --row)
        {
                size_t index;
                for(size_t col=0; col<numGridX_; ++col)
                {
                        index = row*numGridX_ + col;
                        //cout << index << "\t"; 
                        std::cout << this->u_[index] << "\t";
                }        
                
                std::cout << "\n";
        }
}

//int main() {std::cout <<"Check if main working\n";}

        
