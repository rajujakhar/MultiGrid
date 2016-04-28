#ifndef GRID_H
#define GRID_H


#define _USE_MATH_DEFINES
#include <vector>
#include <algorithm>
#include <cmath>
#include <iostream>
#include <exception>
#include <cstring>
#include <cassert>

class Grid {
private:
        //size_t numGridX_;
        double hy_;
        //Grid(const size_t&);
        size_t static numObjects;
        
public:       
        Grid(const size_t&);
        ~Grid(){};
        static Grid createInstance(const size_t &n);
        void setBCs();
        void displayGrid() const;
        bool isInteriorPoint(const size_t&);
        size_t numGridX_;
        size_t numGridY_;
        std::vector<double> u_;
        std::vector<double> f_;
        std::vector<double> err_;
        double hx_;
        //operator+();
};

#endif