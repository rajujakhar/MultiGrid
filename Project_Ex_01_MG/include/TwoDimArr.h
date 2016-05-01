#ifndef TWODIMARR_H
#define TWODIMARR_H

#include <vector>
#include <iostream>

class TwoDimArr{

public:
        const double& operator() (const size_t & i, const size_t&, const size_t&) const;
       /* {
        std::cout << "const version\n";
        return data_[i];
        }*/
        
        double& operator() (const size_t &i, const size_t&, const size_t&);
        /*{
        std::cout << "Non const version\n";
        return data_[i];
        }*/
        
        //TwoDimArr(const size_t &length, const double);
        std::vector<double> data_; 
        
};
#endif
