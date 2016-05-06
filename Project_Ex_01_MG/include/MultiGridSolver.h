#ifndef MG_SOLVER
#define MG_SOLVER
#include "Grid.h"
#include "Stencil.h"


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
        void displayGridf(const size_t&);
        real calResNorm();
        MultiGridSolver(const size_t &, const size_t &, const TwoDimArr &);
        
public:
        
        ~MultiGridSolver();
        void computeSolution();
        TwoDimArr& getSolVec();
        static MultiGridSolver createInstance(const size_t &, const size_t &, const TwoDimArr& );
        static size_t numObjects;               // This variable is used to restict the user to create only one instance of MultiGridSolver      
        
};

#endif
