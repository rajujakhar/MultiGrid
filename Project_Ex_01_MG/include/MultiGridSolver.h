#ifndef MG_SOLVER
#define MG_SOLVER
#include "Grid.h"
#include "Stencil.h"
//#include <omp.h>
/*
// The following Stencil stores information about matrix A which is used to multiply A with u
struct Stencil4Point {
        const real c = 4.0;
        const real n =-1.0;
        const real s =-1.0;
        const real w = -1.0;
        const real e = -1.0;
};

// The following stencil is used for full weighting restriction
struct StencilRestrict {
        const real sw=0.0625;   // weightage is 1/16
        const real s=0.125;     // weightage is 1/8
        const real se=0.0625;  
        const real w=0.125;
        const real c=0.250;     // weightage is 1/4
        const real e=0.125;
        const real nw=0.0625;
        const real n=0.125;
        const real ne=0.0625;
};

// The following stencil is used for bilinear interpolation
struct StencilProlong {
        const real center=1.0;
        const real right = 0.5;
        const real up=0.5;
        const real corner = 0.25; 
};                
        
  */      

class MultiGridSolver {
private: 
        std::vector<Grid*> gridVec_;    // gridVec_ is the imporant data structure of this assignment which stores pointer to various Grid Object formed at each level 
        TwoDimArr u_;                   // This is used to save the u. It also has operator overloading features  
        size_t numLevel_;               // Number of levels 
        const size_t numVcycle_;
        const size_t neu1_;
        const size_t neu2_;
        
        Stencil r_;                     // r stands for restriction
        Stencil s_;                     // s_ stands for stencil update
        Stencil p_;                     // p stands for prolongation
        
        void applyRBGS_Iter(const size_t&);
        void applyRestriction(const size_t&);
        void applyInterpolation(const size_t&);
        void applyPreSmoothing(const size_t&);
        void applyPostSmoothing(const size_t&);
        void mgmSolve(const size_t&);
        void computeResidual(const size_t&);
        void displayGrid(const size_t&);
        MultiGridSolver(const size_t &, const size_t &, const TwoDimArr &);
        
public:
        
        ~MultiGridSolver();
        void computeSolution();
        TwoDimArr& getSolVec();
        static MultiGridSolver createInstance(const size_t &, const size_t &, const TwoDimArr& );
        static size_t numObjects;               // This variable is used to restict the user to create only one instance of MultiGridSolver      
        
};

#endif
