#ifndef TWODIMARR_H
#define TWODIMARR_H

#include <vector>
#include <iostream>
#include "Precision.h"

class TwoDimArr{

public:
        const real& operator() (const size_t & i, const size_t&, const size_t&) const;
       /* {
        std::cout << "const version\n";
        return data_[i];
        }*/
        
        real& operator() (const size_t &i, const size_t&, const size_t&);
        /*{
        std::cout << "Non const version\n";
        return data_[i];
        }*/
        
        //TwoDimArr(const size_t &length, const real);
        std::vector<real> data_; 
        
};
#endif
