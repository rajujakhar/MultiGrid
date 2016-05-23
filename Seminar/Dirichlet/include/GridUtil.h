#ifndef GRID_UTIL
#define GRID_UTIL

#include <vector>
#include <cmath>
#include <string>
#include <iostream>
#include "TwoDimArr.h"
#include <fstream>
#include <math.h>       /* atan */
#include <iomanip>

#define PI 3.14159265

class GridUtil {

private:
        size_t numGrid_;
        real h_;
        TwoDimArr u_;
public: 
        
        GridUtil(const size_t &level);
        ~GridUtil();
        void setBCs();
        void displayGrid(const TwoDimArr &) const;
        void displayGrid() const;
        TwoDimArr& getVec();
        void writeSol(const TwoDimArr &) const;
//        static void measureError(const TwoDimArr &);
       
};

#endif
