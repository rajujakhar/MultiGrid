#include "GridUtil.h"

std::vector<real>& GridUtil::getRedVec()
{
        return u_red_;
}

std::vector<real>& GridUtil::getBlackVec()
{
        return u_black_;
}

GridUtil::GridUtil(const size_t &level)
{
        size_t temp = pow(2,level);
        numGrid_ = temp+1;
        h_ = 2.0/temp;
        
        const size_t numBlack = 0.5*(numGrid_*numGrid_ -1);
        u_black_.resize(numBlack,0.0);
        u_red_.resize(numBlack+1,0.0); // number of red points in one more than black
         
}

GridUtil::~GridUtil()
{
        //Empty Destructor      
}

real GridUtil::calR(const real& x, const real& y)
{
        return std::sqrt(x*x + y*y);      
}

real GridUtil::cal_phi(const real& x, const real& y)
{
        if(x==0. && y==0.)
        return 0.;
        
        return atan(y/x);      
}

real GridUtil::g(const real& r, const real& phi)
{
        return (std::sqrt(r) * sin(phi*0.5));
}

real GridUtil::getMap(const size_t& i, const size_t& j, const size_t& numGrid)
{
        return (i*numGrid +j);
}


/*
This function sets the initial boundary conditions defined by function g in the exercise sheet 
*/
void GridUtil::setBCs()
{
//      //real x1,y1,x2,y2;
//      real x, y = h_*(numGrid_-1);              // Outer boundary
      
//      size_t size = numGrid_*numGrid_;
//      //for(size_t i=0, j=(numGrid_-1)*numGrid_; (i<numGrid_) && (j<size); ++i,++j)
//      for(size_t j=(numGrid_-1)*numGrid_; j<size; ++j)
//      {
//           // x1 = h_*(i%numGrid_);
//            x = h_*(j%numGrid_);
//            //y1 = 0.0;
//           // u_[i] = sin(M_PI*x1)*sinh(M_PI*y1);
//            u_[j] = sin(M_PI*x)*sinh(M_PI*y);
//      }

         // b stands for black and r stands for red
            
          real x_b, y_b, r_b, phi_b, x_r, y_r, r_r, phi_r, startX, endX, startY, endY, midVal;
          size_t size, j, topWallOffset;
          
          startX = -1.;
          startY = -1.;
          endX = 1.;
          endY = 1.;
          
          r_r = 0.;
          phi_r = 0.;
          r_b = 0.;
          phi_b = 0.;
          size = numGrid_*numGrid_;
          midVal = 0.5*(numGrid_ -1);
          topWallOffset = (0.5*numGrid_*(numGrid_-1));
          
          //std::cout<<"numGrid_ is : " << numGrid_ << std::endl;
          //std::cout<<"size : " << size << std::endl;

         // Bottom wall
         y_r = startY;
         y_b = startY;
         
          for(size_t i=0; i<=midVal; ++i)
          {
                // x_r = startX + h_*(j%numGrid_);
                j = 2*i;
                x_r = startX + h_*j;
                x_b = startX + h_*(j+1);
                
                r_r = calR(x_r,y_r);
                phi_r = cal_phi(x_r,y_r);
               
                r_b = calR(x_b,y_b);
                phi_b = cal_phi(x_b,y_b);
                
                // Negative x_r region
                if(j < midVal)
                {
                        phi_r += M_PI;
                        phi_b += M_PI;
                }
                // Positive x_r region        
                else 
                {
                        phi_r += (2*M_PI);
                        phi_b += (2*M_PI);
                }                
                   
                u_red_[i] = g(r_r, phi_r);

                if(i!=midVal)
                u_black_[i] = g(r_b, phi_b);

          }
          
          //startLoop = getMap(midVal, midVal, numGrid_);
          //endLoop = getMap(midVal+1, 0, numGrid_);
          
          // Mid slit initialization, initalize by_r 0 since phi_r is 0.
          /*for(size_t j=startLoop; j<endLoop; ++j)
          {
                u_[j] = 0.;
          }*/
          

          // Top wall
          y_r = endY;
          y_b = endY;
          //startLoop = (numGrid_-1)*numGrid_;
         for(size_t i=0; i<=midVal; ++i)
          {
              j =  2*i;

              x_r = startX + h_*(j);
              x_b = startX + h_*(j+1);

              r_r = calR(x_r,y_r);
              phi_r = cal_phi(x_r,y_r);

              r_b = calR(x_b,y_b);
              phi_b = cal_phi(x_b,y_b);

              // Negative x_r region
              if(j < midVal)
              {
                      phi_r += M_PI;
                      phi_b += M_PI;
              }


              u_red_[topWallOffset + i] = g(r_r, phi_r);
              if(i!=midVal)
              u_black_[topWallOffset + i] = g(r_b, phi_b);
          }

         // BC on Left Vertical wall
         x_r = startX;
         x_b = startX;
         size_t iter;
         for(size_t i=1; i< (numGrid_-1); ++i)
         {

             if(i & 1)                      // black update
             {
                y_b = startY + h_*i;
                r_b = calR(x_b,y_b);
                phi_b = cal_phi(x_b,y_b) + M_PI;


                iter = 0.5*(i*numGrid_ -1);
                /*if(i==1)
                {
                   std::cout << "iter for black when i==1 : " << iter << std::endl;
                   std::cout << "x_b: " << x_b << "  y_b : " << y_b << std::endl;
                }*/

                u_black_[iter] = g(r_b, phi_b);
             }
             else
             {
                 y_r = startY + h_*i;           // red update
                 r_r = calR(x_r,y_r);
                 phi_r = cal_phi(x_r,y_r) + M_PI;

                 iter = 0.5*(i*numGrid_);
                 u_red_[iter] = g(r_r, phi_r);
             }
         }


          // BC on Right Vertical wall
         x_r = endX;
         x_b = endX;
         for(size_t i=1; i< (numGrid_-1); ++i)
         {

             if(i & 1)                      // black update
             {
                y_b = startY + h_*i;
                r_b = calR(x_b,y_b);

                phi_b = cal_phi(x_b,y_b) ;

                if(i< midVal)
                    phi_b += 2*(M_PI);

                iter = 0.5*(i*numGrid_ -1) + midVal;
                u_black_[iter] = g(r_b, phi_b);
             }
             else
             {
                 y_r = startY + h_*i;           // red update
                 r_r = calR(x_r,y_r);
                 phi_r = cal_phi(x_r,y_r) ;

                 if(i< midVal)
                     phi_r += 2*(M_PI);

                 iter = 0.5*(i*numGrid_) + midVal;
                 u_red_[iter] = g(r_r, phi_r);
             }
         }

          
}



/*
This function displays the grid entries u
*/
void GridUtil::displayGrid(const std::vector<real>& arr) const
{
        std::cout << "Grid Entries:\n ";
        
        for(int row=(numGrid_ - 1) ; row>= 0; --row)
        {
                size_t index;
                for(size_t col=0; col<numGrid_; ++col)
                {
                        index = row*numGrid_ + col;
                        //cout << index << "\t";
                        std::cout.width(8);
                        std::cout<< std::left <<arr[index]<<"\t" ;
//                        std::cout << arr[index] << "\t";
                }        
                
                std::cout << "\n";
        }
}

void GridUtil::displayRedBlackGrid() const
{
        std::cout << "Red Black Grid Entries:\n ";
        size_t index, iter;

        for(int row=(numGrid_ - 1) ; row>= 0; --row)
        {
                for(size_t col=0; col<numGrid_; ++col)
                {
                        index = row*numGrid_ + col;
                        if(row & 1)    // Odd row
                        {
                            if(col&1)    // print red
                                {
                                    iter = 0.5*index;
                                    std::cout.width(8);
                                    //std::cout << iter << "\t";
                                    std::cout<< std::left << u_red_[iter]<<"\t";
                                }
                            else
                                {           // print black
                                    iter = 0.5*(index-1);
                                    std::cout.width(8);
                                    //std::cout << iter << "\t";
                                    std::cout<< std::left << u_black_[iter]<<"\t";
                                }
                        }

                        else                // Even Row
                        {
                            if(col&1)    // print black
                            {
                                 iter =  0.5*(index-1);
                                 std::cout.width(8);
                                 //std::cout << iter << "\t";
                                 std::cout<< std::left << u_black_[iter]<<"\t";
                            }
                            else
                            {    // print red
                                 iter = 0.5*index;
                                 std::cout.width(8);
                                 //std::cout << iter << "\t";
                                 std::cout<< std::left << u_red_[iter]<<"\t";
                            }
                       }
                }

                std::cout << "\n";
        }
}

/*
//This is a overloaded function of displayGrid which prints u_ entries 
void GridUtil::displayGrid() const
{
        std::cout << "Grid Entries:\n "<<std::endl;
        
        for(int row=(numGrid_ - 1) ; row>= 0; --row)
        {
                size_t index;
                for(size_t col=0; col<numGrid_; ++col)
                {
                        index = row*numGrid_ + col;
                        //cout << index << "\t"; 
                        std::cout.width(8);
                        std::cout<< std::left <<this->u_[index]<<"\t" ;
                }        
                
                std::cout << "\n";
        }
}*/

// This function writes the solution to solution.txt that can be visualized by gnuplot
void GridUtil::writeFinalSol(const std::vector<real>& u_red, const std::vector<real>& u_black) const
{
        std::ofstream f_out("solution.dat");
        //std::ofstream f_act("actualSolution.txt");
        //std::ofstream f_err("errSolution.txt");
        real x, y, comp, startX, startY; // act, phi, r,
        size_t midValue = (numGrid_-1)*0.5;
        startX= -1.;
        startY = -1.;
        size_t count_red = 0, count_black =0;
        
        for(size_t i=0; i<numGrid_ ; ++i)
        {
                for(size_t j=0; j<numGrid_ ;++j)
                {
                        x = startX + j*h_ ;
                        y = startY + i*h_;
                        
                        if( (i+j) & 1)   // black arr
                        comp = u_black[count_black++];
                        else
                        comp = u_red[count_red++];
                        //act = sin(M_PI*x)*sinh(M_PI*y);
                        /*r = calR(x,y);
                        phi = cal_phi(x,y);
                        
                        if (j<midValue)
                                phi+=M_PI;
                        
                        if(i<midValue && j>=midValue)
                                phi+= 2*M_PI;                  
                        
                        act = g(r, phi);*/
                        
                        f_out << x << "\t" << y << "\t" << comp << std::endl;
                        //f_act << x << "\t" << y << "\t" << act << std::endl;
                        //f_err << x << "\t" << y << "\t" << fabs(act-comp) << std::endl;
                }        
        }
             
        f_out.close();
        //f_act.close();
        //f_err.close();
        
        std::cout << "\nThe computed solution has been written in the solution.dat\n";
        //std::cout << "The Actual, computed solution and error solution has been written in actualSolution.txt, computedSolution.txt and errSolution.txt resp\n";        
}

/*// This function writes the solution to solution.txt that can be visualized by gnuplot
void GridUtil::writeInitSol() const
{
        std::ofstream f_out("init.dat");
        real x, y, comp, startX, startY;
        size_t midValue = (numGrid_-1)*0.5;
        startX= -1.;
        startY = -1.;
        
        for(size_t i=0; i<numGrid_ ; ++i)
        {
                for(size_t j=0; j<numGrid_ ;++j)
                {
                        x = startX + j*h_ ;
                        y = startY + i*h_;
                        comp = u_[i*numGrid_+j];
                        f_out << x << "\t" << y << "\t" << comp << std::endl;
                        
                }        
        }
             
        f_out.close();
        
        std::cout << "\nThe init solution has been written in the init.dat\n";
        //std::cout << "The Actual, computed solution and error solution has been written in actualSolution.txt, computedSolution.txt and errSolution.txt resp\n";        
}
*/


// This function writes the error after the Multi Grid solver has been completed
real GridUtil::measureError(const std::vector<real> & a, const size_t& numGrid, const real& h )
{
        real x,y,act,comp,diff,error = 0.0, phi, r, startX, startY;
        size_t numInnerPoints = (numGrid)*(numGrid);
        size_t midValue = (numGrid-1)*0.5;
        startX= -1.;
        startY = -1.;
        
        for(size_t i=0; i<numGrid ; ++i)
        {
                for(size_t j=0; j<numGrid ;++j)
                {
                        x = startX + j*h ;
                        y = startY + i*h;
                        comp = a[i*numGrid+j];
                       
                        r = calR(x,y);
                        phi = cal_phi(x,y);
                                
                        if (j<midValue)
                                phi+=M_PI;
                        
                        if(i<midValue && j>=midValue)
                                phi+= 2*M_PI;   
                                        
                        act = g(r,phi);
////                        act = sin(M_PI*x)*sinh(M_PI*y);
                    diff = fabs(comp - act);
                    error += diff * diff;
                }
        
        }
    //std::cout <<  "Error is: " << error << std::endl;
    error = std::sqrt(error/numInnerPoints);
	
    /*std::ofstream err_out;
    err_out.open("errPlotvsGridSize.txt", std::fstream::in | std::fstream::out | std::fstream::app);
    err_out << h << "\t" << error << std::endl;
    err_out.close();*/
    return error;
    //std::cout<<"Error between the computed and analytical solution for h = 1/"<<numGrid_-1 <<" is : "<<error<<std::endl;
}

// This function writes the error after the Multi Grid solver has been completed
real GridUtil::measureError(const std::vector<real> & a, const size_t& level)
{
        real x, y, act, comp, diff, error, phi, r, h, startX, startY;
        size_t temp, numGrid, numInnerPoints, midValue;  
        
        temp = (1<<level);     //  equivalent to pow(2,level)
        numGrid = temp+1;
        h = 2.0/temp;
        numInnerPoints = (numGrid)*(numGrid);
        midValue = (numGrid-1)*0.5;
        error = 0.;
        startX= -1.;
        startY = -1.;
        
        for(size_t i=0; i<numGrid ; ++i)
        {
                for(size_t j=0; j<numGrid ;++j)
                {
                        x = startX + j*h ;
                        y = startY + i*h;
                        comp = a[i*numGrid+j];
                        
                        r = calR(x,y);
                        phi = cal_phi(x,y);
                                
                        if (j<midValue)
                                phi+=M_PI;
                        
                        if(i<midValue && j>=midValue)
                                phi+= 2*M_PI;   
                                        
                        act = g(r, phi);
////                        act = sin(M_PI*x)*sinh(M_PI*y);
                        diff = fabs(comp - act);
                        error += (diff * diff);
                }
        
        }
    //std::cout <<  "Error is: " << error << std::endl;
    error = std::sqrt(error/numInnerPoints);
	
    /*std::ofstream err_out;
    err_out.open("errPlotvsGridSize.txt", std::fstream::in | std::fstream::out | std::fstream::app);
    err_out << h << "\t" << error << std::endl;
    err_out.close();*/
    return error;
    //std::cout<<"Error between the computed and analytical solution for h = 1/"<<numGrid_-1 <<" is : "<<error<<std::endl;
}

		



	
