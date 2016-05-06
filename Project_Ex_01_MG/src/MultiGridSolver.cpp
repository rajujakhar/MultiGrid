#include "MultiGridSolver.h"


//Initialise the counter of global objects by 0;
size_t MultiGridSolver::numObjects=0;

MultiGridSolver::MultiGridSolver(const size_t &numLevel, const size_t &numVcycle, const TwoDimArr &u ): numLevel_(numLevel), numVcycle_(numVcycle), neu1_(4), neu2_(1)
{
        
      //  std::cout << this->gridVec_[0];
        // Create a Grid object and fill the gridVec
        for(size_t i=numLevel_; i>0; --i)
        {
                
                // Construct the Grid at ith level on heap and assign the ptr to gridPtr
                Grid* gridPtr= new Grid(i);
               
                // Push back the ptr location gridPtr                       
                this->gridVec_.push_back(gridPtr);
                
                //std::cout << "In the constructor of multigridsolver, Size of gridVec: " << gridVec_.size() << std::endl;
                 //std::cout << "Size of gridVec: " << gridVec.size() << std::endl;
        }
        
        // Set the u_ to be vector u which is passed by main after setting appropriate boundary conditions
       this->gridVec_[0]->u_ = u; 
       
       // Initialise the stencils
       this->r_.setStencilParams(0.25, 0.125, 0.125, 0.0625);   // Weightage is 1/4, 1/8, 1/8, 1/16 resp for restriction matrix
       this->s_.setStencilParams(4, -1, -1, 0);
       this->p_.setStencilParams(1, 0.5, 0.5, 0.25);
       
       std::cout << " MultiGridSolver constructed for " << numLevel_ << "  levels and " << numVcycle_ << " v-cycles \n";  
}


//This function restricts the MultiGridSolver class to create one object.
MultiGridSolver MultiGridSolver::createInstance(const size_t &numLevel, const size_t &num_Vcycle, const TwoDimArr &arr)
{
        
        if(numObjects ==0)
        {
                MultiGridSolver mgsolver(numLevel, num_Vcycle,arr);
                numObjects++;
                return mgsolver;
        }
        else
        {
                throw std::string("More than one object creation NOT allowed in the Singelton class\n");
                //return nullptr;
        }
        
}

// Compute The solution by applying numVcycle_  
void MultiGridSolver::computeSolution()
{
        real resNormNew, resNormOld=0, dummyVar=0, convRate;
        
        if(numLevel_ ==1)
        {
                applyRBGS_Iter(1);
                return;
        }        
        
        for(size_t count=0; count< numVcycle_; ++count)
	{
	        mgmSolve(numLevel_);
	     
	        resNormNew = calResNorm();
	        //std::cout << "Discrete L2 residum norm after " <<  count+1 << " V-Cycle is " << resNormNew << std::endl;	
	        
	        if(count >0)
	        {
	                convRate = resNormNew/resNormOld;
                        //std::cout << "Convergence rate after " << count+1 << " V-Cycle is " << convRate << std::endl;	        
	        }
	        
	        resNormOld = resNormNew;
        }
        
        //Comment this for the production code
        dummyVar += convRate;
}

// This function is written to compute norm of the residual after each V Cycle 
real MultiGridSolver::calResNorm()
{        
        size_t cgInd =0; 
        //std::cout << "Level : " << numLevel_ << " computeResNorm() \n "; 
        const size_t numGrid = gridVec_[cgInd]->numGrid_;    
        const real hSqInv = 1.0/(gridVec_[cgInd]->h_ * gridVec_[cgInd]->h_);
        const real numInnerPoints = (numGrid-1)*(numGrid-1);
        real sum=0.0,temp;
        
        //Temp try include boundary points
        for(size_t i=1; i<numGrid-1; ++i)
        {
                for(size_t j=1; j<numGrid-1; ++j)
                {       
                         temp = gridVec_[cgInd]->f_(i,j,numGrid) - (hSqInv*(s_.s_*gridVec_[cgInd]->u_(i-1,j,numGrid) + s_.w_*gridVec_[cgInd]->u_(i,j-1,numGrid)  + 
                         s_.c_*gridVec_[cgInd]->u_(i,j,numGrid) + s_.e_*gridVec_[cgInd]->u_(i,j+1,numGrid) + s_.n_*gridVec_[cgInd]->u_(i+1,j,numGrid)) );   
                         
                         sum += temp*temp;
                }
        }
        
        return std::sqrt(sum/numInnerPoints);      
}	

	
MultiGridSolver::~MultiGridSolver()
{
        //Deallocate the memory allocated on heap
        // Need to deallocate the memory. It is causing problems now, so commented below. Need to be fixed as heap memory has to be freed
        //std::cout << "Coarse Grid Index: " << cgInd << " MultiGrid Destructor\n ";
        /*for(size_t i=0 ; i< numLevel_; ++i)
                {
                delete gridVec_[i];
                }
          */      
                
       // std::cout << "Done with destruction of objects\n";       
}

// This function smoothens the solution by applying RBGS Guass Seidel neu1_ times
void MultiGridSolver::applyPreSmoothing(const size_t& level)
{
        //std::cout << "Level : " << level << " applyPreSmoothing() \n ";
        for(size_t i=0; i<neu1_; ++i)
        {
                applyRBGS_Iter(level);       
        }
        
        //displayGrid();     
}

// This function smoothens the solution by applying RBGS Guass Seidel neu2_ times
void MultiGridSolver::applyPostSmoothing(const size_t& level)
{
        //std::cout << "Level : " << level  << " applyPostSmoothing() \n ";
        for(size_t i=0; i<neu2_; ++i)
        {
                applyRBGS_Iter(level);       
        }
}

// The following function contanis logic in which error information is passed from current grid to coarser grid by pulling information from 8 neighbours.
void MultiGridSolver::applyRestriction(const size_t& level)
{
        assert(level>1);
        //std::cout << "Level : " << level << " applyRestriction() \n ";
        const int cgInd = numLevel_- level;         
        
        const size_t numGrid = gridVec_[cgInd]->numGrid_;
        const size_t numGridCoarser = gridVec_[cgInd+1]->numGrid_;
         
        
        for(size_t i=2; i<numGrid-2; i+=2)     
                {
                        for(size_t j=2; j<numGrid-2; j+=2)
                                {
                                        gridVec_[cgInd+1]->f_(0.5*i,0.5*j,numGridCoarser) = 
                                        (r_.sw_*gridVec_[cgInd]->res_(i-1,j-1,numGrid)) + (r_.s_*gridVec_[cgInd]->res_(i-1,j,numGrid)) + (r_.se_*gridVec_[cgInd]->res_(i-1,j+1,numGrid)) +
                                        (r_.w_*gridVec_[cgInd]->res_(i,j-1,numGrid))    + (r_.c_*gridVec_[cgInd]->res_(i,j,numGrid)) + (r_.e_*gridVec_[cgInd]->res_(i,j+1,numGrid)) +
                                        (r_.nw_*gridVec_[cgInd]->res_(i+1,j-1,numGrid)) + (r_.n_*gridVec_[cgInd]->res_(i+1,j,numGrid)) + (r_.ne_*gridVec_[cgInd]->res_(i+1,j+1,numGrid));
                                }
                }
                     
}

// The following function contanis logic in which error information is passed from current grid to finer grid by pushing information from 8 neighbours.
void MultiGridSolver::applyInterpolation(const size_t& level)
{
        //std::cout << "Level : " << level << " applyInterpolation() \n "; 
        assert(level > 0 && level< numLevel_ );                      // Level 0 is not permitted
        
        const int cgInd = numLevel_- level;       
                                
        
        //Get the number of grid points in current and finer grid
        size_t numGrid = gridVec_[cgInd]->numGrid_;
        size_t numGridFiner = gridVec_[cgInd-1]->numGrid_;
        
        for(size_t i=0; i<numGrid-1; ++i)
        {
                for(size_t j=0; j<numGrid-1; ++j)
                {       
                        if(i!=0)      // This check insures that we are not updating y=0 line points
                        {
                                if(j!=0)
                                gridVec_[cgInd-1]->u_(2*i,2*j,numGridFiner)     +=  (p_.c_*gridVec_[cgInd]->u_(i,j,numGrid));
                                
                                gridVec_[cgInd-1]->u_(2*i,2*j+1,numGridFiner)   +=  (p_.e_*(gridVec_[cgInd]->u_(i,j,numGrid) + gridVec_[cgInd]->u_(i,j+1,numGrid) ));
                                
                        }
                        
                        if(j!=0)       // This check insures that we are not updating x=0 line points 
                        gridVec_[cgInd-1]->u_(2*i+1,2*j,numGridFiner)   +=  (p_.n_*(gridVec_[cgInd]->u_(i,j,numGrid) + gridVec_[cgInd]->u_(i+1,j,numGrid) ));
                                
                        gridVec_[cgInd-1]->u_(2*i+1,2*j+1,numGridFiner) +=  (p_.ne_*( gridVec_[cgInd]->u_(i,j,numGrid) +  gridVec_[cgInd]->u_(i,j+1,numGrid) + 
                                                                                       gridVec_[cgInd]->u_(i+1,j,numGrid) + gridVec_[cgInd]->u_(i+1,j+1,numGrid))  ); 
                                                                                   
                }
        }
        
}

// This function computes the residual on current grid
void MultiGridSolver::computeResidual(const size_t& level)
{
        const int cgInd = numLevel_- level;         
        assert(cgInd>=0); 
       // std::cout << "Level : " << level << " computeResidual() \n "; 
        const size_t numGrid = gridVec_[cgInd]->numGrid_;    
        const real hSqInv = 1.0/(gridVec_[cgInd]->h_ * gridVec_[cgInd]->h_);
        
        for(size_t i=1; i<numGrid-1; ++i)
        {
                for(size_t j=1; j<numGrid-1; ++j)
                {       
                        gridVec_[cgInd]->res_(i,j,numGrid) =  gridVec_[cgInd]->f_(i,j,numGrid) - (hSqInv*(s_.s_*gridVec_[cgInd]->u_(i-1,j,numGrid) + s_.w_*gridVec_[cgInd]->u_(i,j-1,numGrid)  + 
                                                               s_.c_*gridVec_[cgInd]->u_(i,j,numGrid) + s_.e_*gridVec_[cgInd]->u_(i,j+1,numGrid) + s_.n_*gridVec_[cgInd]->u_(i+1,j,numGrid)) );   
                }
        } 
        
}

// Getter function which returns first u_ of getVec_
TwoDimArr& MultiGridSolver::getSolVec()
{
        return this-> gridVec_[0 ]->u_;                
}

// This is a recursive function which calls itselfs and sub routines of MultiGridSolver 
void MultiGridSolver::mgmSolve(const size_t& level)
{
        //std::cout << " Level : " << level << " mgmSolve() \n ";  
        assert(level >0 && level <= numLevel_) ;    
       
        if(level!=1)
        {       
                applyPreSmoothing(level);     // Before going to coaser level lets smoothen the solution by applying RBGS Guass Seidel neu1_ times  
              
                computeResidual(level);       // Before going to the coaser level, let us compute the error at the current level
                                        // We can get any further coarse if level is one
                applyRestriction(level);      // Restrict the error term and assign it to f_
        }                              // Its time to go to the coaser level :)
                                           
        if(level == 1)                   // This is the end of recursion, Compute Solution
                applyRBGS_Iter(level);  // Apply Red Black Guass Seidel to compute the exact solution at coarsest level
               
        else
        {
                mgmSolve(level-1);        // If we have not reached at the coarsest level keep going down
                
                applyInterpolation(level-1);      // Lets see how much we have improved the error by going to the Coaser level, Lets come back to finer level and add the effect;     
        }
        
        if(level!=1)
        applyPostSmoothing(level);      // Lets smotthen the solution a bit
        
}

/*
This function displays the grid entries err at coarse grid index cgInd
*/
void MultiGridSolver::displayGrid(const size_t& level)
{
        const int cgInd = numLevel_- level;         
        assert(cgInd>=0); 
        //std::cout << "Coarse Grid Index: " << cgInd << " displayGrid() \n "; 
        const size_t numGrid = gridVec_[cgInd]->numGrid_;       
         
        std::cout << "\n\n\n";       
        for(int row=(numGrid - 1) ; row>= 0; --row)
        {
               
                for(size_t col=0; col<numGrid; ++col)
                {
                        //cout << index << "\t"; 
                        std::cout << gridVec_[cgInd]->u_(row,col,numGrid) << "\t";
                }        
                
                std::cout << "\n";
        }
        
         std::cout << "\n\n\n";   
}


   

/*void MultiGridSolver::displayGridf()
{
       // std::cout << "Coarse Grid Index: " << cgInd << " displayGridf() \n ";
        cgInd=0.0;       
        const size_t numGrid = gridVec_[cgInd]->numGrid_;       
        
        std::cout << "\n\n\n";       
        for(int row=(numGrid - 1) ; row>= 0; --row)
        {
               
                for(size_t col=0; col<numGrid; ++col)
                {
                        //cout << index << "\t"; 
                        std::cout << gridVec_[cgInd]->f_(row,col,numGrid) << "\t";
                }        
                
                std::cout << "\n";
        }
        
         std::cout << "\n\n\n";   
}
*/
// This function applies the RBGS iter
void MultiGridSolver::applyRBGS_Iter(const size_t& level)
{
        //std::cout << "Coarse Grid Index: " << cgInd << " applyRBGS_Iter() \n "; 
        const int cgInd = numLevel_- level;         
        assert(cgInd>=0);      
        size_t numGrid = gridVec_[cgInd]->numGrid_;
        const real hSq = gridVec_[cgInd]->h_*gridVec_[cgInd]->h_;
        size_t loopMax = numGrid-1,j;
        bool isFirstCol=true; 
     
      // Apply the guass seidel iteration on red interior points
      // #pragma omp parallel for schedule(static)
        for(size_t i=1; i< loopMax; ++i)
        {
             // this check determines wheather to start from 1st OR 2nd column 
             j= ((isFirstCol ==true)?  1:2);
             
                while(j < loopMax)
                        {  
                                gridVec_[cgInd]->u_(i,j,numGrid) = 0.25*( hSq*(gridVec_[cgInd]->f_(i,j,numGrid)) +  
                                gridVec_[cgInd]->u_(i-1,j,numGrid) + gridVec_[cgInd]->u_(i,j-1,numGrid) + gridVec_[cgInd]->u_(i,j+1,numGrid) + gridVec_[cgInd]->u_(i+1,j,numGrid) ) ;
                               
                                j+= 2;
                        }
           
           isFirstCol = !isFirstCol;             
        }
        
       // std::cout << "Grid display after red points update\n";
        //displayGrid(level);
        
        isFirstCol = false;
       
        // Apply the guass seidel iteration on black interior points
       //#pragma omp parallel for schedule(static)
        for(size_t i=1; i< loopMax; ++i)
        {
             // this check determines wheather to start from 1st OR 2nd column 
             j= ((isFirstCol ==true)?  1:2);
             
                while(j < loopMax)
                        {
                                gridVec_[cgInd]->u_(i,j,numGrid) = 0.25*( hSq*(gridVec_[cgInd]->f_(i,j,numGrid)) +  
                                gridVec_[cgInd]->u_(i-1,j,numGrid) + gridVec_[cgInd]->u_(i,j-1,numGrid) + gridVec_[cgInd]->u_(i,j+1,numGrid) + gridVec_[cgInd]->u_(i+1,j,numGrid) ) ;
                                  
                                j+= 2;
                        }
           
           isFirstCol = !isFirstCol;             
        }
        
        //std::cout << "Grid display after black points update\n";
        //displayGrid(level);
       
        
}
