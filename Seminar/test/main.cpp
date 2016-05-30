#include "MultiGridSolver.h"
#include "GridUtil.h"
#include "Timer.h"


int main(int argc, char **argv)
{
        assert(argc == 2);
	
	int numLevel = std::stoi(argv[1]);
        size_t numVcycle= 18;
	
	GridUtil gridUtil(numLevel);
	gridUtil.setBCs();
	gridUtil.writeInitSol();
	//gridUtil.displayGrid();
	
	// Creates a object of MultiGridSolver class and compute the solution using Multigrid solver
	try
	{
                MultiGridSolver m= MultiGridSolver(numLevel,numVcycle,gridUtil.getVec());
                //MultiGridSolver m= MultiGridSolver(numLevel,gridUtil.getVec());
	        
                std::cout<<"Your Alias: "<<"BleedBlue"<<std::endl;
                struct timeval t0, t;
                gettimeofday(&t0, NULL);
                m.computeSolution();
                gettimeofday(&t, NULL);
                std::cout << "Wall clock time of MG execution: " <<
                ((int64_t)(t.tv_sec - t0.tv_sec) * (int64_t)1000000 +
                (int64_t)t.tv_usec - (int64_t)t0.tv_usec) * 1e-3
                << " ms" << std::endl;
                
                //std::cout << "Solution computed after MultiGrid Solver computation: \n";
//             gridUtil.displayGrid(m.getSolVec());
                 gridUtil.writeFinalSol(m.getSolVec());
                //GridUtil::measureError(m.getSolVec(), numLevel);
        }

        catch (...)
        {
                std::cout << "Some Exception occured " << "\n";
        }
       
        
}
