#include "MultiGridSolver.h"
#include "GridUtil.h"


//Initialise the counter of global objects by 0;
//size_t MultiGridSolver::numObjects=0;
//MultiGridSolver::MultiGridSolver(const size_t &numLevel, const TwoDimArr &u ):
MultiGridSolver::MultiGridSolver(const size_t &numLevel, const size_t &numVcycle, const TwoDimArr &u ): numLevel_(numLevel), numVcycle_(numVcycle) , neu1_(1), neu2_(1),currVCycle_(1),errLimit_(0.0000918)
    //    numLevel_(numLevel),neu1_(1), neu2_(1),currVCycle_(1),errLimit_(0.0000918)
{
        
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
       this->p_.setStencilParams(1, 0.5, 0.5, 0.25);            // Prolongation stencil
       
       //std::cout << " MultiGridSolver constructed for " << numLevel_ << "  levels and " << numVcycle_ << " v-cycles \n";  
}


//This function restricts the MultiGridSolver class to create one object.
/*MultiGridSolver MultiGridSolver::createInstance(const size_t &numLevel, const size_t &num_Vcycle, const TwoDimArr &arr)
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
*/

// Compute The solution by applying numVcycle_  
void MultiGridSolver::computeSolution()
{
        real resNormNew, resNormOld=0, convRate;
        real e = 0.;
        real time;
        struct timeval t0, t;
        
        if(numLevel_ ==1)
        {
                //applyRBGS_Iter(1);
                return;
        }        
        
        for(size_t count=0; count< numVcycle_; ++count)
        {
//            std::cout<<" \n";
//            std::cout<< "Error at the entry of loop is : " << e << std::endl;
            
                gettimeofday(&t0, NULL);   
                mgmSolve(numLevel_);    //  1 v cycle
	    
	     
            /*resNormNew = calResNorm();
            std::cout << "Discrete L2 residum norm after " <<  currVCycle_ << " V-Cycle is:  " << resNormNew << std::endl;
//            std::cout<< "Error Limit is : " << errLimit_ << std::endl;
	       
            if(currVCycle_ !=1)
	        {
	                convRate = resNormNew/resNormOld;
                        std::cout << "Convergence rate after " << currVCycle_ << " V-Cycle  is:  " << convRate << std::endl;
	        }

	        
	        resNormOld = resNormNew;

	        
	        // Increment the curr v cycle
              
//            std::cout<< "V cycle counter increased to " << currVCycle_  << std::endl;

//            std::cout<< "******************************* " << std::endl;

              e = GridUtil::measureError(gridVec_[0]->u_, gridVec_[0]->numGrid_, gridVec_[0]->h_);
              std::cout << "Error error after " << currVCycle_ << "  " << e << std::endl; */
//            std::cout<< "Error at the exit of loop is : " << e << std::endl;

//            std::cout<< "############################### " << std::endl;


	        // Set the u_ vector to zeros at each level other than finest level after each V Cycles -> At these levels u_'s represents error 
                for(size_t i=1; i< numLevel_; ++i)
	        std::fill(gridVec_[i]->u_.data_.begin(), gridVec_[i]->u_.data_.end(), 0.0);
	        
	   
	        gettimeofday(&t, NULL);
	        
	        time = ((int64_t)(t.tv_sec - t0.tv_sec) * (int64_t)1000000 + (int64_t)t.tv_usec - (int64_t)t0.tv_usec) * 1e-3 ;
	        //std::cout << "Wall clock time of MGMSolve() in " << currVCycle_  << " v-cycle is " << time << " seconds\n"; 
	        
	        currVCycle_++;
          }
         
        
}

// This function is written to compute norm of the residual after each V Cycle 
real MultiGridSolver::calResNorm() 
{        
        size_t cgInd =0; 
        //std::cout << "Level : " << numLevel_ << " computeResNorm() \n "; 
        const size_t numGrid = gridVec_[cgInd]->numGrid_;    
        const real hSqInv = 1.0/(gridVec_[cgInd]->h_ * gridVec_[cgInd]->h_);
        const real numInnerPoints = (numGrid-2)*(numGrid-2);
        real sum=0.0, temp, l2Norm=0.;
        const size_t midValue = 0.5*(numGrid -1);
        
      
       // std::cout << "REsidual display: " ;
        //displayGrid(numLevel_);
        
        #pragma omp parallel for schedule(static)
        for(size_t i=1; i<numGrid-1; ++i)
        {
                for(size_t j=1; j<numGrid-1; ++j)
                {       
                        if ((i != midValue) || (j<midValue))  // Skip the middle slit
                         {temp = gridVec_[cgInd]->f_(i,j,numGrid) - (hSqInv*(s_.s_*gridVec_[cgInd]->u_(i-1,j,numGrid) + s_.w_*gridVec_[cgInd]->u_(i,j-1,numGrid)  + 
                        s_.c_*gridVec_[cgInd]->u_(i,j,numGrid) + s_.e_*gridVec_[cgInd]->u_(i,j+1,numGrid) + s_.n_*gridVec_[cgInd]->u_(i+1,j,numGrid)) );   
                         
                        // temp = gridVec_[cgInd]->res_(i,j,numGrid);
                         sum += (temp*temp);
                         }
                }
        }
        
        l2Norm = std::sqrt(sum/numInnerPoints);
        

        return l2Norm;
        
           
}

	
MultiGridSolver::~MultiGridSolver()
{
        //Deallocate the memory allocated on heap
        //std::cout << " MultiGrid Destructor\n ";
        for(size_t i=0 ; i< numLevel_; ++i)
        {
                delete gridVec_[i];
        }
                
}

// This function smoothens the solution by applying RBGS Guass Seidel neu1_ times
void MultiGridSolver::applyPreSmoothing(const size_t& level)
{
        //std::cout << "Level : " << level << " applyPreSmoothing() \n ";
        for(size_t i=0; i<neu1_; ++i)
        {
                applyRBGS_Iter(level);       
        }
        
        //std::cout << "After PreSmoothing\n";
//        displayGrid(level,currVCycle_, std::string("u"));
        //displayGrid(level,currVCycle_, std::string("f"));        
}

// This function smoothens the solution by applying RBGS Guass Seidel neu2_ times
void MultiGridSolver::applyPostSmoothing(const size_t& level)
{
        //std::cout << "Level : " << level  << " applyPostSmoothing() \n ";
        for(size_t i=0; i<neu2_; ++i)
        {
                applyRBGS_Iter(level);       
        }
        
        //std::cout << "After PostSmoothing\n";
        //displayGrid(level,currVCycle_, std::string("u")); 
}

// The following function contanis logic in which error information is passed from current grid to coarser grid by pulling information from 8 neighbours.
void MultiGridSolver::applyRestriction(const size_t& level)
{
        assert(level>1);
        //std::cout << "Level : " << level << " applyRestriction() \n ";
        const int cgInd = numLevel_- level;         
        
        const size_t numGrid = gridVec_[cgInd]->numGrid_;
        const size_t numGridCoarser = gridVec_[cgInd+1]->numGrid_;
         
        #pragma omp parallel for schedule(static)
        for(size_t i=2; i<numGrid-2; i+=2)     
                {
                        for(size_t j=2; j<numGrid-2; j+=2)
                                {
                                        gridVec_[cgInd+1]->f_(0.5*i,0.5*j,numGridCoarser) = 
                                        
                                                                                        (r_.sw_*gridVec_[cgInd]->res_(i-1,j-1,numGrid))         +
                                                                                        (r_.s_*gridVec_[cgInd]->res_(i-1,j,numGrid))            + 
                                                                                        (r_.se_*gridVec_[cgInd]->res_(i-1,j+1,numGrid))         +
                                                                                        (r_.w_*gridVec_[cgInd]->res_(i,j-1,numGrid))            +
                                                                                        (r_.c_*gridVec_[cgInd]->res_(i,j,numGrid))              +
                                                                                        (r_.e_*gridVec_[cgInd]->res_(i,j+1,numGrid))            +
                                                                                        (r_.nw_*gridVec_[cgInd]->res_(i+1,j-1,numGrid))         +
                                                                                        (r_.n_*gridVec_[cgInd]->res_(i+1,j,numGrid))            + 
                                                                                        (r_.ne_*gridVec_[cgInd]->res_(i+1,j+1,numGrid));
                                }
                }
         
         //displayGrid(level-1,currVCycle_, std::string("f"));         
                     
}

// The following function contanis logic in which error information is passed from current grid to finer grid by pushing information from 8 neighbours.

void MultiGridSolver::applyInterpolation(const size_t& level)
{
        //std::cout << "Level : " << level << " applyInterpolation() \n "; 
        assert(level > 0 && level< numLevel_);                      // Level 0 is not permitted
        
        const int cgInd = numLevel_- level;       
                                
        
        //Get the number of grid points in current and finer grid
        size_t numGrid = gridVec_[cgInd]->numGrid_;
        size_t numGridFiner = gridVec_[cgInd-1]->numGrid_;
        size_t midValue = 0.5*(numGrid-1);
        
        //std::cout << "u before interpolation\n";
        //displayGrid(level+1,currVCycle_, std::string("u")); 
        
        #pragma omp parallel for schedule(static)
        for(size_t i=0; i<numGrid-1; ++i)
        {
                for(size_t j=0; j<numGrid-1; ++j)
                {      
                        
                        if ((i != midValue) || (j<midValue))  // Skip the middle slit
                        {   
                                //if(i!=0)      // This check insures that we are not updating y=0 line points
                                {
                                        //if(j!=0)
                                        gridVec_[cgInd-1]->u_(2*i,2*j,numGridFiner)     +=  (p_.c_*gridVec_[cgInd]->u_(i,j,numGrid));  // CENTER
                                        
                                        gridVec_[cgInd-1]->u_(2*i,2*j+1,numGridFiner)   +=  (p_.e_*(gridVec_[cgInd]->u_(i,j,numGrid) + gridVec_[cgInd]->u_(i,j+1,numGrid) )); // RIGHT
                                        
                                }
                        }        
                        
                        //if(j!=0)       // This check insures that we are not updating x=0 line points 
                        gridVec_[cgInd-1]->u_(2*i+1,2*j,numGridFiner)   +=  (p_.n_*(gridVec_[cgInd]->u_(i,j,numGrid) + gridVec_[cgInd]->u_(i+1,j,numGrid) ));  // UP
                                
                        gridVec_[cgInd-1]->u_(2*i+1,2*j+1,numGridFiner) +=  (p_.ne_*( gridVec_[cgInd]->u_(i,j,numGrid) +  gridVec_[cgInd]->u_(i,j+1,numGrid) + 
                                                                                       gridVec_[cgInd]->u_(i+1,j,numGrid) + gridVec_[cgInd]->u_(i+1,j+1,numGrid))  );  // CORNER
                                                                                   
                }
        }
         //displayGrid(level+1,currVCycle_, std::string("u")); 
        
        
}

// This function computes the residual on current grid

void MultiGridSolver::computeResidual(const size_t& level)
{
        const int cgInd = numLevel_- level;         
        assert(cgInd>=0); 
       // std::cout << "Level : " << level << " computeResidual() \n "; 
        const size_t numGrid = gridVec_[cgInd]->numGrid_;    
        const real hSqInv = 1.0/(gridVec_[cgInd]->h_ * gridVec_[cgInd]->h_);
        
        #pragma omp parallel for schedule(static)
        for(size_t i=1; i<numGrid-1; ++i)
        {
                for(size_t j=1; j<numGrid-1; ++j)
                {       
                        gridVec_[cgInd]->res_(i,j,numGrid) =  gridVec_[cgInd]->f_(i,j,numGrid) - (hSqInv*(s_.s_*gridVec_[cgInd]->u_(i-1,j,numGrid) + s_.w_*gridVec_[cgInd]->u_(i,j-1,numGrid)  + 
                                                               s_.c_*gridVec_[cgInd]->u_(i,j,numGrid) + s_.e_*gridVec_[cgInd]->u_(i,j+1,numGrid) + s_.n_*gridVec_[cgInd]->u_(i+1,j,numGrid)) );   
                }
        } 
        
         //displayGrid(level,currVCycle_, std::string("res")); 
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
       
       // if(level!=1)
       // {       
                applyPreSmoothing(level);         // Before going to coaser level lets smoothen the solution by applying RBGS Guass Seidel neu1_ times  
              
                computeResidual(level);          // Before going to the coaser level, let us compute the error at the current level
                 
                if(level!=1)                    // We can get any further coarse if level is one
                applyRestriction(level);        // Restrict the error term and assign it to f_
       // }                                     // Its time to go to the coaser level :)
                                           
        if(level == 1)
                                                  // This is the end of recursion, Compute Solution
                {      
                        //std::cout << "Exact solution\n";
                        applyRBGS_Iter(level);    // Apply Red Black Guass Seidel to compute the exact solution at coarsest level
                }
        else
        {
                mgmSolve(level-1);                // If we have not reached at the coarsest level keep going down
                
                applyInterpolation(level-1);      // Lets see how much we have improved the error by going to the Coaser level, Lets come back to finer level and add the effect;     
        }
        
       // if(level!=1)
        applyPostSmoothing(level);                // Lets smotthen the solution a bit
        
}


//This function displays the grid entries err at coarse grid index cgInd

void MultiGridSolver::displayGrid(const size_t& level, const size_t& curV_cycle, const std::string& str)
{
        const int cgInd = numLevel_- level;         
        assert(cgInd>=0); 
        std::cout << "\nDisplay of " << str <<"_ at level " << level << " during " << curV_cycle <<  " v cycles\n"; 
        const size_t numGrid = gridVec_[cgInd]->numGrid_;
        real temp;       
         
        std::cout << "\n\n\n";       
        for(int row=(numGrid - 1) ; row>= 0; --row)
        {
               
                for(size_t col=0; col<numGrid; ++col)
                {
                        //cout << index << "\t"; 
                        if(str.compare("res") ==0)
                                temp = gridVec_[cgInd]->res_(row,col,numGrid);
                        else if(str.compare("f") ==0)
                                temp = gridVec_[cgInd]->f_(row,col,numGrid);
                        else if(str.compare("u") ==0)
                                temp = gridVec_[cgInd]->u_(row,col,numGrid);
                        else 
                                std::cout << "Please enter the correct string literal in the display function\n";
                        std::cout.width(5);         
                        std::cout << std::left << temp << "\t\t";
                }        
                
                std::cout << "\n";
        }
        
         std::cout << "\n\n";   
}


void MultiGridSolver::applyRedSweep(const size_t& level, const int& axis)
{ 
        size_t rowStart, rowEnd, colEnd;  
        const int cgInd = numLevel_- level;
        const size_t numGrid = gridVec_[cgInd]->numGrid_;
        const real hSq = gridVec_[cgInd]->h_*gridVec_[cgInd]->h_;
        const size_t midVal = 0.5*(numGrid-1);                              // Since numGrid is even so midValue is always an integer
        
        assert(cgInd>=0);
        
        if(axis==0)
        {
                rowStart  =midVal;
                rowEnd = midVal+1;
                colEnd = midVal;
        }
        else if(axis ==1)
        {
                rowStart = midVal+1;
                rowEnd = numGrid-1;
                colEnd = numGrid-1;
        }
        else                            // axis is -1 here
        {       
                rowStart = 1;
                rowEnd = midVal;
                colEnd = numGrid-1;        
        }                                                          
        
        //if(cgInd ==0)
        //std::cout << "Red sweep points: \n";
        #pragma omp parallel for schedule(static)
        for(size_t i=rowStart; i< rowEnd; ++i)
        {
                for(size_t j= ((i & 1) ? 1:2); j< colEnd; j+=2)
                {
                        
                        //if(cgInd ==0)
                        //std::cout << "(" << i << "," << j <<")\n";
                        gridVec_[cgInd]->u_(i,j,numGrid) = 0.25*( hSq*(gridVec_[cgInd]->f_(i,j,numGrid)) +
                        gridVec_[cgInd]->u_(i-1,j,numGrid) + gridVec_[cgInd]->u_(i,j-1,numGrid) + gridVec_[cgInd]->u_(i,j+1,numGrid) + gridVec_[cgInd]->u_(i+1,j,numGrid) ) ;    
                }                        

        }                 

}

void MultiGridSolver::applyBlackSweep(const size_t& level, const int& axis)
{ 
        size_t rowStart, rowEnd, colEnd;  
        const int cgInd = numLevel_- level;
        const size_t numGrid = gridVec_[cgInd]->numGrid_;
        const real hSq = gridVec_[cgInd]->h_*gridVec_[cgInd]->h_;
        const size_t midVal = 0.5*(numGrid-1);                              // Since numGrid is even so midValue is always an integer
        
        assert(cgInd>=0);
        
        if(axis==0)
        {
                rowStart  =midVal;
                rowEnd = midVal +1;
                colEnd = midVal;
        }
        else if(axis ==1)
        {
                rowStart = midVal+1;
                rowEnd = numGrid-1;
                colEnd = numGrid-1;
        }
        else                            // axis is -1 here
        {       
                rowStart = 1;
                rowEnd = midVal;
                colEnd = numGrid-1;        
        }                                                          
        
        #pragma omp parallel for schedule(static)
        for(size_t i=rowStart; i< rowEnd; ++i)
        {
                for(size_t j= ((i & 1) ? 2:1); j< colEnd; j+=2)
                {
                        gridVec_[cgInd]->u_(i,j,numGrid) = 0.25*( hSq*(gridVec_[cgInd]->f_(i,j,numGrid)) +
                        gridVec_[cgInd]->u_(i-1,j,numGrid) + gridVec_[cgInd]->u_(i,j-1,numGrid) + gridVec_[cgInd]->u_(i,j+1,numGrid) + gridVec_[cgInd]->u_(i+1,j,numGrid) ) ;    
                }                        

        }                 
          

}



// This function applies the RBGS iter
void MultiGridSolver::applyRBGS_Iter(const size_t& level)
{
      ///---------------------------------- RED UPDATE -----------------------------------------------//
      // Apply the guass seidel iteration on red interior points
      
        // update the negative y region points      
        applyRedSweep(level, -1);
        
        // update y=0 interior points
        applyRedSweep(level, 0);
        
        // update the positive y region points      
        applyRedSweep(level, 1);
        
         ///---------------------------------- BLACK UPDATE -----------------------------------------------//
      // Apply the guass seidel iteration on black interior points
      
        // update the negative y region points      
        applyBlackSweep(level, -1);
        
        // update y=0 interior points
        applyBlackSweep(level, 0);
        
        // update the positive y region points      
        applyBlackSweep(level, 1);
        
}
