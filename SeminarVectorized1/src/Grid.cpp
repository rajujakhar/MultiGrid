/*#include "Grid.h"


Grid::Grid(const size_t &level) 
{
        const size_t temp = pow(2,level);
        h_ = 2.0/temp;
        numGrid_ = temp+1;
        const size_t numTotPoints=numGrid_*numGrid_;
        this->f_.data_.resize(numTotPoints,0.0);
        this->res_.data_.resize(numTotPoints,0.0);
        this->u_.data_.resize(numTotPoints); 
    
}

*/


#include "Grid.h"


Grid::Grid(const size_t &level) 
{
        const size_t temp = pow(2,level);
//        h_ = 1.0/temp;
        h_ = 2.0/temp;
        numGrid_ = temp+1;
        //const size_t numTotPoints=numGrid_*numGrid_;
        
        
        #pragma omp parallel
        {
                std::vector<real> u_private;
                std::vector<real> f_private;
                std::vector<real> res_private;
                
                #pragma omp for schedule(static) nowait //fill vec_private in parallel
                for(int i=0; i<numGrid_; ++i)
                {
                        for(int j=0; j<numGrid_; ++j)        
                        {
                                u_private.push_back(0.);
                                f_private.push_back(0.);
                                res_private.push_back(0.);
                        }
                }                        
                        
                #pragma omp critical
                {
                        u_.data_.insert(u_.data_.end(), u_private.begin(), u_private.end());
                        f_.data_.insert(f_.data_.end(), f_private.begin(), f_private.end());
                        res_.data_.insert(res_.data_.end(), res_private.begin(), res_private.end());
                }
        }
        
        assert(u_.data_.size() == (numGrid_*numGrid_));
      
         
        //std::cout << "Level " << level << " grid constructed with total grid points " << numTotPoints << std::endl;  
}



            
