#include "Stencil.h"

void Stencil::setStencilParams(const real& center, const real& right, const real& up, const real& corner)
{
        this->c_= center;
        this->e_= right;
        this->w_ = e_;
        this->n_ = up;
        this->s_ = n_;
        this->ne_ = corner;
        this->nw_ = ne_;     
        this->se_ = ne_;
        this->sw_ = ne_;
}       
