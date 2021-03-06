#include "Grid.h"


Grid::Grid(const size_t &level) 
{
        const size_t temp = (1<<level);   //Equivalent to pow(2,level);
        h_ = 2.0/temp;
        numGrid_ = temp+1;


        const size_t numBlack = 0.5*(numGrid_*numGrid_ -1);
        size_t numRed = numBlack + 1;

        //std::cout << "Level " << level << " numRed is: " << numRed << " numBlack is: " << numBlack ;
        //std::cout << "  numGrid: " << numGrid_ << std::endl;
        this->f_red_.resize(numRed, 0.0);
        this->f_black_.resize(numBlack,0.0);
        this->res_red_.resize(numRed, 0.0);
        this->res_black_.resize(numBlack,0.0);
        this->u_red_.resize(numRed, 0.0);
        this->u_black_.resize(numBlack,0.0);
}




/*#include "Grid.h"


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
                        u_.insert(u_.end(), u_private.begin(), u_private.end());
                        f_.insert(f_.end(), f_private.begin(), f_private.end());
                        res_.insert(res_.end(), res_private.begin(), res_private.end());
                }
        }
        
        assert(u_.size() == (numGrid_*numGrid_));
      
         
        //std::cout << "Level " << level << " grid constructed with total grid points " << numTotPoints << std::endl;  
}
*/


            
