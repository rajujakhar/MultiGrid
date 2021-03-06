#ifndef MG_SOLVER
#define MG_SOLVER
#include "Grid.h"
#include "Stencil.h"
#include <iostream>
#include <sys/time.h>


class MultiGridSolver {
private: 
        std::vector<Grid*> gridVec_;    // gridVec_ is the imporant data structure of this assignment which stores pointer to various Grid Object formed at each level 
        std::vector<real> u_red_;                   // This is used to save the u. It also has operator overloading features
        std::vector<real> u_black_;
        size_t numLevel_;               // Number of levels 
        const size_t numVcycle_;
        const size_t neu1_;
        const size_t neu2_;
        size_t currVCycle_;
        real errLimit_;
        size_t numGrid_;
        real h_;
        
        Stencil r_;                     // r stands for restriction
        Stencil s_;                     // s_ stands for stencil update
        Stencil p_;                     // p stands for prolongation
        
        void applyRBGS_Iter(const size_t&);
        void applyRedSweep(const size_t&, const int& );
        void applyBlackSweep(const size_t&, const int& );
        void applyRestriction(const size_t&);
        void applyInterpolation(const size_t&);
        void applyPreSmoothing(const size_t&);
        void applyPostSmoothing(const size_t&);
        void mgmSolve(const size_t&);
        void computeResidual(const size_t&);
        void displayGrid(const size_t&, const size_t&, const std::string&);
        size_t getRedInd(const size_t &i, const size_t &j, const size_t &);
        size_t getBlackInd(const size_t &i, const size_t &j, const size_t &);
       // void displayGridf(const size_t&);
        real calResNorm();
        
public:
//        MultiGridSolver(const size_t &, const std::vector<real> &);
        MultiGridSolver(const size_t &, const size_t &, const std::vector<real> &, const std::vector<real> &);

        ~MultiGridSolver();
        void computeSolution();
        std::vector<real>& getRedVec();
        std::vector<real>& getBlackVec();
        //size_t measureError(const std::vector<real> & a);
        //static MultiGridSolver createInstance(const size_t &, const size_t &, const std::vector<real>& );
        //static size_t numObjects;               // This variable is used to restict the user to create only one instance of MultiGridSolver      
        
};

#endif
