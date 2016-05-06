#include "MultiGridSolver.h"
#include "GridUtil.h"
/*
This function displays the grid entries u
*/
void displayGrid(const TwoDimArr &u, const size_t &level)
{
        std::cout << "Grid Entries:\n ";
        size_t numGrid = pow(2,level)+1;
        
        for(int row=(numGrid - 1) ; row>= 0; --row)
        {
                size_t index;
                for(size_t col=0; col<numGrid; ++col)
                {
                        index = row*numGrid + col;
                        //cout << index << "\t"; 
                        std::cout << u.data_[index] << "\t";
                }        
                
                std::cout << "\n";
        }
}


int main(int argc, char **argv)
{
	//std::cout << "Welcome to Multigrid Methods in SiWiR2\n";

	//std::cout << "Number of arguments are: " << argc <<  std::endl;
	assert(argc == 3);
	
	int numLevel = std::stoi(argv[1]);
	int numVcycle= std::stoi(argv[2]);
	
        //std::cout << "No of level: "<< numLevel << " Number  of  V cycles:  " << numVcycle << std::endl; 
	
	GridUtil gridUtil(numLevel);
	gridUtil.setBCs();
	//gridUtil.displayGrid();
	
	// Creates an instance of MultiGridSolver class and compute the solution using Multigrid solver
	try{
	       MultiGridSolver m= MultiGridSolver::createInstance(numLevel,numVcycle,gridUtil.getVec());
	      // Grid grid1= Grid::createInstance(n);
	      //std::cout << "Compute Solution will be called now\n";
	      m.computeSolution();
	      // m.displayGrid();
	      //gridUtil.displayGrid(m.getSolVec());
	      gridUtil.writeSol(m.getSolVec());
		gridUtil.measureError(m.getSolVec());
	   }

        catch (const std::string &s){
                std::cout << "An Exception occured: " << s << "\n";
        }

        catch (...){
                std::cout << "Some Exception occured " << "\n";
        }
        
}
