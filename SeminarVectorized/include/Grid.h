#ifndef GRID_H
#define GRID_H

//#include "TwoDimArr.h"
#include "Precision.h"

//#define _USE_MATH_DEFINES
#define M_PI  3.141592653589793
#include <vector>
#include <algorithm>
#include <cmath>
#include <iostream>
#include <exception>
#include <cstring>
#include <cassert>

class Grid {
public:       
        Grid(const size_t&);
        ~Grid(){};
        //static Grid createInstance(const size_t &n);
        real h_;
        size_t numGrid_;
        std::vector<real> f_red_;
        std::vector<real> f_black_;
        std::vector<real> res_red_;
        std::vector<real> res_black_;
        std::vector<real> u_red_;
        std::vector<real> u_black_;

};

#endif
