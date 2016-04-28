#include "MultiGridSolver.h"

MultiGridSolver::MultiGridSolver(const size_t &numLevel, const size_t &numVcycle ): numLevel_(numLevel), coarseGridInd_(0), numVcycle_(numVcycle), neu1_(2), neu2_(1)
{
// Create a Grid object and fill the gridVec
        for(size_t i=numLevel_; i>0; --i)
                {
                Grid* gridPtr= new Grid(i);
                //std::cout << "Size of gridVec: " << gridVec.size() << std::endl;
                this->gridVec_.push_back(gridPtr);
                 //std::cout << "Size of gridVec: " << gridVec.size() << std::endl;
               // std::cout << this->gridVec_[numLevel_ - i]->numGridX_ <<  "\t";
                }
                
}

MultiGridSolver::~MultiGridSolver()
{
        //std::cout << "In the destructor of MultigridSolver\n";
        //Deallocate the memory allocated on heap
        for(size_t i=0 ; i< numLevel_; ++i)
                {
                delete gridVec_[i];
                }
}

inline size_t MultiGridSolver::getMap(const size_t& i, const size_t& j) const
{
        return (i*gridVec_[coarseGridInd_]->numGridX_) +j;
}

void MultiGridSolver::applyRBGS_Iter()
{
        size_t numGridX = gridVec_[coarseGridInd_]->numGridX_;
        size_t numGridY = gridVec_[coarseGridInd_]->numGridY_;
        // Assuming h_x equal to h_y. The code needs to be modified later
        // This is normal Guass Seidel Iteration 
        const double hx = gridVec_[coarseGridInd_]->hx_;
        for(size_t i=1; i<numGridX-1; ++i)
        {
                for(size_t j=1; j<numGridY -1 ; ++j)
                        {
                        gridVec_[coarseGridInd_]->u_[getMap(i,j)] = 0.25*( hx*hx*(gridVec_[coarseGridInd_]->f_[getMap(i,j)]) +  gridVec_[coarseGridInd_]->u_[getMap(i+1,j)] + gridVec_[coarseGridInd_]->u_[getMap(i-1,j)] + gridVec_[coarseGridInd_]->u_[getMap(i,j+1)] + gridVec_[coarseGridInd_]->u_[getMap(i,j-1)] ) ;
                        }
        }
        
        for(size_t i=1; i<numGridX-1; ++i)
        {
                for(size_t j=1; j<numGridY -1 ; ++j)
                        {
                        gridVec_[coarseGridInd_]->u_[getMap(i,j)] = 0.25*( hx*hx*(gridVec_[coarseGridInd_]->f_[getMap(i,j)]) +  gridVec_[coarseGridInd_]->u_[getMap(i+1,j)] + gridVec_[coarseGridInd_]->u_[getMap(i-1,j)] + gridVec_[coarseGridInd_]->u_[getMap(i,j+1)] + gridVec_[coarseGridInd_]->u_[getMap(i,j-1)] ) ;
                        }
        }
        
        
        
        
        
}
