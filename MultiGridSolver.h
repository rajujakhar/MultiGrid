#ifndef MG_SOLVER
#define MG_SOLVER
#include "Grid.h"

struct Stencil {
private:
        const int center_ = 4;
        const int north_=-1;
        const int south_=-1;
        const int west_ = -1;
        const int east_ = -1;
};

class MultiGridSolver {
private: 
        std::vector<Grid*> gridVec_;
        size_t numLevel_; 
       // size_t currLevel_;
        size_t coarseGridInd_;
        const size_t numVcycle_;
        const size_t neu1_;
        const size_t neu2_;
        
public:
        MultiGridSolver(const size_t &, const size_t &);
        ~MultiGridSolver();
        void applyRBGS_Iter();
        inline size_t getMap(const size_t&, const size_t&) const;
        
};

#endif
