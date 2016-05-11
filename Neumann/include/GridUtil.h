#ifndef GRID_UTIL
#define GRID_UTIL

#include <vector>
#include <cmath>
#include <string>
#include <iostream>
#include "TwoDimArr.h"
#include <fstream>

class GridUtil {

private:
        size_t numGrid_;
        real h_;
        TwoDimArr u_;
        TwoDimArr f_;
public: 
        
        GridUtil(const size_t &level);
        ~GridUtil();
        void setBCs(bool);
        void displayGrid(const TwoDimArr &) const;
        void displayGrid() const;
        TwoDimArr& getVec();
        void writeSol(const TwoDimArr &) const;
	void measureError(const TwoDimArr &, const bool&);
       
};

#endif
