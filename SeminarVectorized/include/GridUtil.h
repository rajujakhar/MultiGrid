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
#include "Precision.h"

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
        void writeFinalSol(const TwoDimArr &) const;
        void writeInitSol() const;
        static real measureError(const TwoDimArr&, const size_t&, const real& );
        static real measureError(const TwoDimArr&, const size_t& );
        static real calR(const real&, const real&);
        static real cal_phi(const real&, const real&); 
        static real g(const real&, const real&);
        static real getMap(const size_t&, const size_t&, const size_t&);
       
};

#endif
