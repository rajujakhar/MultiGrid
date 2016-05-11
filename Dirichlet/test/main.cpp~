#include "MultiGridSolver.h"
#include "GridUtil.h"
#include "Timer.h"


int main(int argc, char **argv)
{
	assert(argc == 3);
	
	int numLevel = std::stoi(argv[1]);
	int numVcycle= std::stoi(argv[2]); 
	
	GridUtil gridUtil(numLevel);
	gridUtil.setBCs();
	real timeStart=0., timeEnd=0.;
	//gridUtil.displayGrid();
	
	// Creates a object of MultiGridSolver class and compute the solution using Multigrid solver
	try
	{
	        MultiGridSolver m= MultiGridSolver(numLevel,numVcycle,gridUtil.getVec());
	        
	        // Compute the time taken in the execution of main kernel of the code
                timeStart = SiWiR2::getTimeStamp();
                m.computeSolution();
                timeEnd = SiWiR2::getTimeStamp();
                
                //std::cout << "Solution computed after MultiGrid Solver computation: \n";
	        //gridUtil.displayGrid(m.getSolVec());
                gridUtil.writeSol(m.getSolVec());
                gridUtil.measureError(m.getSolVec());
        }

        catch (...)
        {
                std::cout << "Some Exception occured " << "\n";
        }
        
        
        std::cout << "Time taken in computing solution of Multigrid Solver is " << (timeEnd - timeStart) <<  "seconds.\n "; 
        
}
