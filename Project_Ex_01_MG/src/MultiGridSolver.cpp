#include "MultiGridSolver.h"

MultiGridSolver::MultiGridSolver(const size_t &numLevel, const size_t &numVcycle, const TwoDimArr &u ): numLevel_(numLevel), cgInd_(0), numVcycle_(numVcycle), neu1_(2), neu2_(1)
{
        // Set the u_ to be vector u which is passed by main after setting appropriate boundary conditions
        this->u_ = u;
        
        // Create a Grid object and fill the gridVec
        for(size_t i=numLevel_; i>0; --i)
        {
                
                // Construct the Grid at ith level on heap and assign the ptr to gridPtr
                Grid* gridPtr= new Grid(i);
               
                // Push back the ptr location gridPtr                       
                this->gridVec_.push_back(gridPtr);
                
                std::cout << "In the constructor of multigridsolver, Size of gridVec: " << gridVec_.size() << std::endl;
                 //std::cout << "Size of gridVec: " << gridVec.size() << std::endl;
               // std::cout << this->gridVec_[numLevel_ - i]->numGrid_ <<  "\t";
        }
        
        // Set full weighting restriction stencil
        //r_.sw = r_.se = r_.nw = r_.ne = 0.0625;  // the weight is 1/16 
        //r_.s = r_.w = r_.e = r_.n = 0.125;          // the weight is 2/16
        //r_.c = 0.25;
}

// Compute The solution by applying numVcycle_  
void MultiGridSolver::computeSolution()
{
        std::cout << "Coarse Grid Index: " << cgInd_ << " computeSolution() \n ";
        for(size_t count=0; count< numVcycle_; ++count)
	mgmSolve();
}	
	
MultiGridSolver::~MultiGridSolver()
{
        //std::cout << "In the destructor of MultigridSolver\n";
        //Deallocate the memory allocated on heap
        std::cout << "Coarse Grid Index: " << cgInd_ << " MultiGrid Destructor\n ";
        for(size_t i=0 ; i< numLevel_; ++i)
                {
                delete gridVec_[i];
                }
}

// This function smoothens the solution by applying RBGS Guass Seidel neu1_ times
void MultiGridSolver::applyPreSmoothing()
{
        std::cout << "Coarse Grid Index: " << cgInd_ << " applyPreSmoothing() \n ";
        for(size_t i=0; i<neu1_; ++i)
        {
                applyRBGS_Iter();       
        }
        
        //displayGrid();     
}

// This function smoothens the solution by applying RBGS Guass Seidel neu2_ times
void MultiGridSolver::applyPostSmoothing()
{
        std::cout << "Coarse Grid Index: " << cgInd_ << " applyPostSmoothing() \n ";
        for(size_t i=0; i<neu2_; ++i)
        {
                applyRBGS_Iter();       
        }
}

// The following function contanis logic in which error information is passed from current grid to coarser grid by pulling information from 8 neighbours.
void MultiGridSolver::applyRestriction()
{
        std::cout << "Coarse Grid Index: " << cgInd_ << " applyRestriction() \n ";
        size_t numGrid = gridVec_[cgInd_]->numGrid_;
        size_t numGridCoarser = gridVec_[cgInd_+1]->numGrid_;
        
        for(size_t i=2; i<numGrid-2; i+=2)     
                {
                        for(size_t j=2; j<numGrid-2; j+=2)
                                {
                                        gridVec_[cgInd_+1]->f_(i/2,j/2,numGridCoarser) = 
                                        (r_.sw*gridVec_[cgInd_]->err_(i-1,j-1,numGrid)) + (r_.s*gridVec_[cgInd_]->err_(i-1,j,numGrid)) + (r_.se*gridVec_[cgInd_]->err_(i-1,j+1,numGrid)) +
                                        (r_.w*gridVec_[cgInd_]->err_(i,j-1,numGrid))    + (r_.c*gridVec_[cgInd_]->err_(i,j,numGrid)) + (r_.e*gridVec_[cgInd_]->err_(i,j+1,numGrid)) +
                                        (r_.nw*gridVec_[cgInd_]->err_(i+1,j-1,numGrid)) + (r_.n*gridVec_[cgInd_]->err_(i+1,j,numGrid)) + (r_.ne*gridVec_[cgInd_]->err_(i+1,j+1,numGrid));
                                }
                }
                
       // displayGrid();  
        //displayGridf();      
}

// The following function contanis logic in which error information is passed from current grid to finer grid by pushing information from 8 neighbours.
void MultiGridSolver::applyInterpolation()
{
        std::cout << "Coarse Grid Index: " << cgInd_ << " applyInterpolation() \n ";        
        assert(cgInd_ >0);
        
        // Get the number of grid points in current and finer grid
        size_t numGrid = gridVec_[cgInd_]->numGrid_;
        size_t numGridFiner = gridVec_[cgInd_-1]->numGrid_;
        
        for(size_t i=0; i<numGrid-1; ++i)
        {
                for(size_t j=0; j<numGrid-1; ++j)
                {       
                        if(cgInd_ ==1)              // This means we need to improve the final solution u_ 
                        {
                                u_(2*i,2*j,numGridFiner)     +=  p_.center*gridVec_[cgInd_]->err_(i,j,numGrid);
                                u_(2*i,2*j+1,numGridFiner)   +=  p_.right*(gridVec_[cgInd_]->err_(i,j,numGrid) + gridVec_[cgInd_]->err_(i,j+1,numGrid) );
                                u_(2*i+1,2*j,numGridFiner)   +=  p_.up*(gridVec_[cgInd_]->err_(i,j,numGrid) + gridVec_[cgInd_]->err_(i+1,j,numGrid) );
                                u_(2*i+1,2*j+1,numGridFiner) +=  p_.corner*( gridVec_[cgInd_]->err_(i,j,numGrid) +  gridVec_[cgInd_]->err_(i,j+1,numGrid) + 
                                                                 gridVec_[cgInd_]->err_(i+1,j,numGrid) + gridVec_[cgInd_]->err_(i+1,j+1,numGrid) );  
                        }
                        else                       // It means we are not reaching to finest grid level, so we cannot improve solution we can improve error   
                        {
                                gridVec_[cgInd_-1]->err_(2*i,2*j,numGridFiner)     +=  p_.center*gridVec_[cgInd_]->err_(i,j,numGrid);
                                gridVec_[cgInd_-1]->err_(2*i,2*j+1,numGridFiner)   +=  p_.right*(gridVec_[cgInd_]->err_(i,j,numGrid) + gridVec_[cgInd_]->err_(i,j+1,numGrid) );
                                gridVec_[cgInd_-1]->err_(2*i+1,2*j,numGridFiner)   +=  p_.up*(gridVec_[cgInd_]->err_(i,j,numGrid) + gridVec_[cgInd_]->err_(i+1,j,numGrid) );
                                gridVec_[cgInd_-1]->err_(2*i+1,2*j+1,numGridFiner) +=  p_.corner*( gridVec_[cgInd_]->err_(i,j,numGrid) +  gridVec_[cgInd_]->err_(i,j+1,numGrid) + 
                                                                                       gridVec_[cgInd_]->err_(i+1,j,numGrid) + gridVec_[cgInd_]->err_(i+1,j+1,numGrid) ); 
                        }                                                           
                }
        }
        
       // displayGrid();
}

// This function computes the residual on current grid
void MultiGridSolver::computeResidual()
{
        std::cout << "Coarse Grid Index: " << cgInd_ << " computeResidual() \n ";      
        const size_t numGrid = gridVec_[cgInd_]->numGrid_;    
        const double hSqInv = 1.0/(gridVec_[cgInd_]->h_ * gridVec_[cgInd_]->h_);
        //std::cout << "Before Compute residual() Display()\n\n";
        //std::cout << "hSqInv " << hSqInv << std::endl;
          
        //displayGrid();
        
        
        for(size_t i=1; i<numGrid-1; ++i)
        {
                for(size_t j=1; j<numGrid-1; ++j)
                {       
                        // Residual computation by Stencil update
                        if(cgInd_ ==0)
                                gridVec_[cgInd_]->err_(i,j,numGrid) =   gridVec_[cgInd_]->f_(i,j,numGrid) - hSqInv*(s_.s*u_(i-1,j,numGrid) + s_.w*u_(i,j-1,numGrid)  + 
                                                               s_.c*u_(i,j,numGrid) + s_.e*u_(i,j+1,numGrid) + s_.n*u_(i+1,j,numGrid) ); 
                        else 
                                gridVec_[cgInd_]->err_(i,j,numGrid) =  gridVec_[cgInd_]->f_(i,j,numGrid) - (hSqInv*(s_.s*gridVec_[cgInd_]->err_(i-1,j,numGrid) + s_.w*gridVec_[cgInd_]->err_(i,j-1,numGrid)  + 
                                                               s_.c*gridVec_[cgInd_]->err_(i,j,numGrid) + s_.e*gridVec_[cgInd_]->err_(i,j+1,numGrid) + s_.n*gridVec_[cgInd_]->err_(i+1,j,numGrid)) );   
                }
        } 
        
        
       /*  if(cgInd_ == 1) 
        {   
        int i = 3, j = 3;               
        std::cout << " ff at (3,3) " << gridVec_[cgInd_]->err_(i-1,j,numGrid) << std::endl;
        std::cout << " ff at (3,3) " << gridVec_[cgInd_]->err_(i,j-1,numGrid) << std::endl;
        std::cout << " ff at (3,3) " << gridVec_[cgInd_]->err_(i,j,numGrid) << std::endl;
        std::cout << " ff at (3,3) " << gridVec_[cgInd_]->err_(i,j+1,numGrid) << std::endl;
        std::cout << " ff at (3,3) " << gridVec_[cgInd_]->err_(i+1,j,numGrid) << std::endl;
        std::cout << s_.s << "\n";
        std::cout << s_.w <<  "\n";
        std::cout << s_.c << "\n";
        std::cout <<s_.e << "\n";
        std::cout << s_.n << "\n";
        }*/
       
       // displayGrid();
}

// Getter function which returns u_ vector
TwoDimArr& MultiGridSolver::getSolVec()
{
        return this->u_;                
}

// This is a recursive function which calls itselfs and sub routines of MultiGridSolver 
void MultiGridSolver::mgmSolve()
{
        std::cout << "Coarse Grid Index: " << cgInd_ << " mgmSolve() \n ";       
        if(numLevel_ ==1)
        // We can apply RBGS_Iter here also let us ask Retingger
        return;
        
        applyPreSmoothing();     // Before going to coaser level lets smoothen the solution by applying RBGS Guass Seidel neu1_ times  
                
        computeResidual();       // Before going to the coaser level, let us compute the error at the current level
        
        applyRestriction();      // Restrict the error term and assign it to f_
        cgInd_ +=1;               // Its time to go to the coaser level :)
                
        if(numLevel_ == cgInd_+1)  // This is the end of recursion
                applyRBGS_Iter();  // Apply Red Black Guass Seidel to compute the exact solution at coasest level
        else
                mgmSolve();        // If we have not reached at the coarsest level keep going down
                
        applyInterpolation();      // Lets see how much we have improved the error by going to the Coaser level, Lets come back to finer level and add the effect;     
        cgInd_ -=1;
        
        applyPostSmoothing();      // Lets smotthen the solution a bit
       
}

/*
This function displays the grid entries err at coarse grid index cgInd_
*/
void MultiGridSolver::displayGrid()
{
        std::cout << "Coarse Grid Index: " << cgInd_ << " displayGrid() \n ";       
        const size_t numGrid = gridVec_[cgInd_]->numGrid_;       
        
        std::cout << "\n\n\n";       
        for(int row=(numGrid - 1) ; row>= 0; --row)
        {
               
                for(size_t col=0; col<numGrid; ++col)
                {
                        //cout << index << "\t"; 
                        std::cout << gridVec_[cgInd_]->err_(row,col,numGrid) << "\t";
                }        
                
                std::cout << "\n";
        }
        
         std::cout << "\n\n\n";   
}

void MultiGridSolver::displayGridf()
{
        std::cout << "Coarse Grid Index: " << cgInd_ << " displayGridf() \n ";       
        const size_t numGrid = gridVec_[cgInd_]->numGrid_;       
        
        std::cout << "\n\n\n";       
        for(int row=(numGrid - 1) ; row>= 0; --row)
        {
               
                for(size_t col=0; col<numGrid; ++col)
                {
                        //cout << index << "\t"; 
                        std::cout << gridVec_[cgInd_]->f_(row,col,numGrid) << "\t";
                }        
                
                std::cout << "\n";
        }
        
         std::cout << "\n\n\n";   
}


// This function applies the RBGS iter
void MultiGridSolver::applyRBGS_Iter()
{
        std::cout << "Coarse Grid Index: " << cgInd_ << " applyRBGS_Iter() \n ";      
        size_t numGrid = gridVec_[cgInd_]->numGrid_;
        const double hSq = gridVec_[cgInd_]->h_*gridVec_[cgInd_]->h_;
        size_t loopMax = numGrid-1,j;
        bool isFirstCol=true; 
     
      // Apply the guass seidel iteration on red interior points
        for(size_t i=1; i< loopMax; ++i)
        {
             // this check determines wheather to start from 1st OR 2nd column 
             j= ((isFirstCol ==true)?  1:2);
             
                while(j < loopMax)
                        {
                                if(cgInd_ ==0)
                                {
                                        u_(i,j,numGrid) = 0.25*( hSq*(gridVec_[cgInd_]->f_(i,j,numGrid)) +  u_(i-1,j,numGrid) + u_(i+1,j,numGrid) + u_(i,j-1,numGrid) + u_(i,j+1,numGrid) ) ;
                                }
                                else
                                {
                                        gridVec_[cgInd_]->err_(i,j,numGrid) = 0.25*( hSq*(gridVec_[cgInd_]->f_(i,j,numGrid)) +  gridVec_[cgInd_]->err_(i+1,j,numGrid) + 
                                        gridVec_[cgInd_]->err_(i-1,j,numGrid) + gridVec_[cgInd_]->err_(i,j+1,numGrid) + gridVec_[cgInd_]->err_(i,j-1,numGrid) ) ;
                                }
                                
                                j+= 2;
                        }
           
           isFirstCol = !isFirstCol;             
        }
        
        
        isFirstCol = false;
        
        // Apply the guass seidel iteration on black interior points
        
        for(size_t i=1; i< loopMax; ++i)
        {
             // this check determines wheather to start from 1st OR 2nd column 
             j= ((isFirstCol ==true)?  1:2);
             
                while(j < loopMax)
                        {
                                if(cgInd_ ==0)
                                {
                                        u_(i,j,numGrid) = 0.25*( hSq*(gridVec_[cgInd_]->f_(i,j,numGrid)) +  u_(i-1,j,numGrid) + u_(i+1,j,numGrid) + u_(i,j-1,numGrid) + u_(i,j+1,numGrid) ) ;
                                }
                                else
                                {
                                        gridVec_[cgInd_]->err_(i,j,numGrid) = 0.25*( hSq*(gridVec_[cgInd_]->f_(i,j,numGrid)) +  gridVec_[cgInd_]->err_(i+1,j,numGrid) + 
                                        gridVec_[cgInd_]->err_(i-1,j,numGrid) +  gridVec_[cgInd_]->err_(i,j+1,numGrid) + gridVec_[cgInd_]->err_(i,j-1,numGrid) ) ;
                                }
                                
                                j+= 2;
                        }
           
           isFirstCol = !isFirstCol;             
        }
       
        
}
