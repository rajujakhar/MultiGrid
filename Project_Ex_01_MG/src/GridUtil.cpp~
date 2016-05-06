#include "GridUtil.h"
#include "Precision.h"

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
      //real x1,y1,x2,y2;
      real x, y = h_*(numGrid_-1);              // Outer boundary 
      
      size_t size = numGrid_*numGrid_;
      //for(size_t i=0, j=(numGrid_-1)*numGrid_; (i<numGrid_) && (j<size); ++i,++j)
      for(size_t j=(numGrid_-1)*numGrid_; j<size; ++j)
      {
           // x1 = h_*(i%numGrid_);
            x = h_*(j%numGrid_);
            //y1 = 0.0;
           // u_.data_[i] = sin(M_PI*x1)*sinh(M_PI*y1);
            u_.data_[j] = sin(M_PI*x)*sinh(M_PI*y);
      }

      /*  size_t leftIndex = numGrid_;
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
      } */
}


/*
This function displays the grid entries u
*/
void GridUtil::displayGrid(const TwoDimArr& arr) const
{
        std::cout << "Grid Entries:\n ";
        
        for(int row=(numGrid_ - 1) ; row>= 0; --row)
        {
                size_t index;
                for(size_t col=0; col<numGrid_; ++col)
                {
                        index = row*numGrid_ + col;
                        //cout << index << "\t"; 
                        std::cout << arr.data_[index] << "\t";
                }        
                
                std::cout << "\n";
        }
}

//This is a overloaded function of displayGrid which prints u_ entries 
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
                        std::cout << this->u_.data_[index] << "\t";
                }        
                
                std::cout << "\n";
        }
}

// This function writes the solution to solution.txt that can be visualized by gnuplot
void GridUtil::writeSol(const TwoDimArr& arr) const
{
        std::ofstream f_out("computedSolution.txt");
        std::ofstream f_act("actualSolution.txt");
        std::ofstream f_err("errSolution.txt");
        real x,y,act,comp;
        
        for(size_t i=0; i<numGrid_ ; ++i)
        {
                for(size_t j=0; j<numGrid_ ;++j)
                {
                        x = j*h_ ; 
                        y = i*h_;
                        comp = arr.data_[i*numGrid_+j];
                        act = sin(M_PI*x)*sinh(M_PI*y);
                        f_out << x << "\t" << y << "\t" << comp << std::endl;
                        f_act << x << "\t" << y << "\t" << act << std::endl;
                        f_err << x << "\t" << y << "\t" << fabs(act-comp) << std::endl;
                }        
        }
             
        f_out.close();
        f_act.close();
        f_err.close();       

      //  std::cout << "The Actual, computed solution and error solution has been written in actualSolution.txt, computedSolution.txt and errSolution.txt resp\n";        
}

// This function writes the error after the Multi Grid solver has been completed
void GridUtil::measureError(const TwoDimArr & a)
{
	real x,y,act,comp,diff,error = 0.0;

	 for(size_t i=0; i<numGrid_ ; ++i)
        {
                for(size_t j=0; j<numGrid_ ;++j)
                {
                        x = j*h_ ; 
                        y = i*h_;
                        comp = a.data_[i*numGrid_+j];
                        act = sin(M_PI*x)*sinh(M_PI*y);
                 	diff = comp - act;
			error += diff * diff;       
		}        
        }
	error = std::sqrt(error);
	
	//std::cout<<"Error between the computed and analytical solution for h = 1/"<<numGrid_-1 <<" is : "<<error<<std::endl;
}
		



	
