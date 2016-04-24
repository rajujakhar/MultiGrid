#include "gridUtil.h"

int main()
{
	std::cout << "Welcome to Multigrid Methods in SiWiR2\n";
	
	// Initialisation
	// n is numeber of interval x or y direction.
	size_t n=4;
	
	// Creates an instance of GridUtil class
	GridUtil grid = GridUtil::createInstance(n);
	GridUtil grid1 = GridUtil::createInstance(n);
	grid.setBCs();
	
	/*for(size_t i=0; i < numGridX_*numGridY_ ; ++i)
	{
	cout << i << " :- Is it interior point? " << isInteriorPoint(i, numGridX_, numGridY_) << "\n"; 
	}*/
	
	grid.displayGrid();
	
}
