#include <sys/time.h>
#include <cmath>

namespace SiWiR2
{
        double getTimeStamp()
        {
                /**timeval has two data memebers: 
                tv_sec -->      (time elapsed in seconds from 1 Jan 1970, )
                tv_usec -->      (time elapsed in microseconds, This is used to measure the precision which cannot be saved in tv_sec)
                */
        
                struct timeval t;
                gettimeofday(&t, NULL);  // Defined in sys/time.h which sets t params
                double micro= 1e-6;
                return (double)(t.tv_sec + micro*t.tv_usec);  // returns time in seconds
             
        } 
}
/*
int main()
{
       
        double timeStart = getTimeStamp();
       
        //------------    Do Some Work  ------------------------------------------------------------------------------
        //------------------------------------------------------------------------------------------
        double sum=0.;
        int i=0, numIter=100000000;
        while (i< numIter)
        {
              sum += 0.001*sqrt(i);  
              ++i;  
        }
        
         //------------------------------------------------------------------------------------------
        //------------------------------------------------------------------------------------------
       double timeEnd = getTimeStamp();
       printf("Time elapsed is %f seconds\n", timeEnd-timeStart);
       
}
*/
