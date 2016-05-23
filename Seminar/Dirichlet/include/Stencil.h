#ifndef STENCIL_H
#define STENCIL_H

#include "Precision.h"

class Stencil{

public:
        real sw_;//=0.0625;   // weightage is 1/16
        real s_;//=0.125;     // weightage is 1/8
        real se_;//=0.0625;  
        real w_;//=0.125;
        real c_;//=0.250;     // weightage is 1/4
        real e_;//=0.125;
        real nw_;//=0.0625;
        real n_;//=0.125;
        real ne_;//=0.0625;

        // This functions works only for symmetric matrixes
        void setStencilParams(const real& center, const real& right, const real& up, const real& corner);        
        
};

#endif



