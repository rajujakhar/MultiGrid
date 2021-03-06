#include "MultiGridSolver.h"
#include "GridUtil.h"
#include <sys/time.h>
//#include "Timer.h"


int main(int argc, char **argv)
{
	real time;
	struct timeval t0, t;
	
	int numLevel = std::stoi(argv[1]);
        size_t numVcycle= 16;
	
	GridUtil gridUtil(numLevel);
	gridUtil.setBCs();
	//gridUtil.writeInitSol();
	gridUtil.displayGrid();
	
	// Creates a object of MultiGridSolver class and compute the solution using Multigrid solver
	try
	{
                MultiGridSolver m= MultiGridSolver(numLevel,numVcycle,gridUtil.getVec());
                //MultiGridSolver m= MultiGridSolver(numLevel,gridUtil.getVec());
	        
                std::cout<<"Your Alias: "<<"BleedBlue"<<std::endl;
                
                
                // =========================================  Main Work ====================================================
                
                gettimeofday(&t0, NULL);
                m.computeSolution();
                gettimeofday(&t, NULL);
                
                // ==========================================================================================================
                
                
                time = ((int64_t)(t.tv_sec - t0.tv_sec) * (int64_t)1000000 + (int64_t)t.tv_usec - (int64_t)t0.tv_usec) * 1e-3 ;
                std::cout << "Wall clock time of MG execution: " << time << " ms" << std::endl;
                           
                gridUtil.writeFinalSol(m.getSolVec());
                gridUtil.displayGrid(m.getSolVec());
                //GridUtil::measureError(m.getSolVec(), numLevel);
                real err = GridUtil::measureError(m.getSolVec(), numLevel);
                std::cout << "Error after "<< numVcycle << " is: " << err << std::endl;
        }

        catch (...)
        {
                std::cout << "Some Exception occured " << "\n";
        }
       
        
}
