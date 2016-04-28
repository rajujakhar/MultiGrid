#include "MultiGridSolver.h"

int main(int argc, char **argv)
{
	std::cout << "Welcome to Multigrid Methods in SiWiR2\n";
	
	// Initialisation
	// n is numeber of interval x or y direction.
	std::cout << "Number of arguments are: " << argc <<  std::endl;
	assert(argc == 3);
	
	int numLevel = std::stoi(argv[1]);
	int numVcycle= std::stoi(argv[2]);
	
        std::cout << "No of level: "<< numLevel << " Number  of  V cycles:  " << numVcycle << std::endl; 
	
	// Creates an instance of Grid class
	try{
	       Grid grid= Grid::createInstance(numLevel);
	      // Grid grid1= Grid::createInstance(n);
	       grid.setBCs();
	       grid.displayGrid();
	}

	catch (std::string &str) {
	        std::cout << "An Exception occured: " << str << "\n";
	}

       
	
	MultiGridSolver m(3,2);
	
	/*for(size_t i=0; i < numGridX_*numGridY_ ; ++i)
	{
	cout << i << " :- Is it interior point? " << isInteriorPoint(i, numGridX_, numGridY_) << "\n"; 
	}*/
	
	
	
}
