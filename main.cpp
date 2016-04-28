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
<<<<<<< HEAD
	catch (std::string &str) {
	        std::cout << "An Exception occured: " << str << "\n";
	}
=======
        catch (const std::string &s){
                std::cout << "An Exception occured: " << s << "\n";
        }

        catch (const char* s){
                std::cout << "An Exception occured: " << *s << "\n";
        }

>>>>>>> 8710698e095939bd7c78be3423ec5e48fff1a50a
        catch (...){
                std::cout << "An Exception occured: "  << "\n";
        }
	//Grid* grid1 = Grid::createInstance(n);
	
	MultiGridSolver m(3,2);
	
	/*for(size_t i=0; i < numGridX_*numGridY_ ; ++i)
	{
	cout << i << " :- Is it interior point? " << isInteriorPoint(i, numGridX_, numGridY_) << "\n"; 
	}*/
	
	
	
}
