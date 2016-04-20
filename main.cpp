#define _USE_MATH_DEFINES
#include <iostream>
#include <vector>
#include <string>
#include <cmath>

using std::cin;
using std::cout;

double h;

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
}

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
	size_t n=4;
	h = 1.0/n;
	size_t numGridX = n+1;
	size_t numGridY = n+1;
	
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
