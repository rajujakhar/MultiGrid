#define _USE_MATH_DEFINES
#include <iostream>
#include <vector>
#include <string>
#include <cmath>

using std::cin;
using std::cout;

double h_x;
double h_y;

/*
This function determines if the given argument is a interior point of grid or not.
*/
bool isInteriorPoint(const size_t &index, const size_t &numGridX, const size_t &numGridY)
{
       if( (index%numGridX ==0) || ((index+1)%numGridX ==0 ))
       return false;
       else if( ((index/numGridX) == 0) || (index/numGridX == (numGridY-1)) )
       return false; 
       
       return true; 
}

/*
This function sets the initial boundary conditions defined by function g in the exercise sheet 
*/

void setBCs(std::vector<double> &u, const size_t &numGridX, const size_t &numGridY)
{
      double x1,y1,x2,y2;
      size_t size = numGridX*numGridY;
      for(size_t i=0, j=(numGridY-1)*numGridX; i<numGridX, j<size; ++i,++j)
      {
            x1 = h_x*(i%numGridX);
            x2 = h_x*(j%numGridX);
            y1 = 0.0;
            y2 = h_y*(numGridY-1);

            u[i] = sin(M_PI*x1)*sinh(M_PI*y1);
            u[j] = sin(M_PI*x2)*sinh(M_PI*y2);
      }

      size_t leftIndex = numGridX;
      size_t rightIndex;
      

      while(leftIndex < size)
      {
            rightIndex = leftIndex + numGridX - 1;
            x1 = h_x*(leftIndex%numGridX);
            x2 = h_x*(rightIndex%numGridX); 
            y1 = h_y*(leftIndex/numGridX);
            y2 = h_y*(rightIndex/numGridX); 

            u[leftIndex] = sin(M_PI*x1)*sinh(M_PI*y1);
            u[rightIndex] = sin(M_PI*x2)*sinh(M_PI*y2);

            leftIndex+= numGridX;
      }
}

/*void setBCs(std::vector<double> &u, const size_t &numGridX, const size_t &numGridY)
{
        size_t size = numGridX*numGridY;
        for(size_t i=0; i < size; ++i)
        {
                double x = h*(i%numGridX);
                double y = h*(i/numGridX);
                  //cout << "x: "  << x << "y: " << y << "\t";         
                if(!isInteriorPoint(i, numGridX, numGridY))
                {
                        u[i] = sin(M_PI*x)*sinh(M_PI*y);
                }
                        
                 
        }
}*/

/*
This function displays the grid entries
*/
void displayGrid(std::vector<double> &u, const size_t &numGridX, const size_t &numGridY)
{
        //u[0] = 0;
        cout << "Grid Entries:\n ";
        for(int row=(numGridY - 1) ; row>= 0; --row)
        {
                size_t index;
                for(size_t col=0; col<numGridX; ++col)
                {
                        index = row*numGridX + col;
                        //cout << index << "\t"; 
                        cout << u[index] << "\t";
                }        
                
                cout << "\n";
        }
}

int main()
{
	cout << "Welcome to Multigrid Methods in SiWiR2\n";
	
	// Initialisation
	// n is numeber of interval x or y direction.
	size_t n_x=4;
  size_t n_y= 4;
	h_x = 1.0/n_x;
  h_y = 1.0/n_y;
	size_t numGridX = n_x+1;
	size_t numGridY = n_y+1;
	
	// Allocate memory dynamically 
	std::vector<double> u(numGridX*numGridY,0.0);
	std::vector<double> f(numGridX*numGridY,0.0);
	
	setBCs(u,numGridX,numGridY);
	
	/*for(size_t i=0; i < numGridX*numGridY ; ++i)
	{
	cout << i << " :- Is it interior point? " << isInteriorPoint(i, numGridX, numGridY) << "\n"; 
	}*/
	
	displayGrid(u,numGridX,numGridY);
	
}
