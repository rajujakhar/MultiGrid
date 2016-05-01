#ifndef GRID_UTIL
#define GRID_UTIL

#include <vector>
#include <cmath>
#include <string>
#include <iostream>
#include "TwoDimArr.h"

class GridUtil {

private:
        size_t numGrid_;
        double h_;
        TwoDimArr u_;
public: 
        
        GridUtil(const size_t &level);
        ~GridUtil();
        void setBCs();
        void displayGrid() const;
        TwoDimArr& getVec();
       
};


#endif
