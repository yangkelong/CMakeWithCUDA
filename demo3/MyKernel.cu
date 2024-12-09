#ifndef _MY_KERNEL_
#define _MY_KERNEL_

__global__ void TestDevice(int *deviceArray)
{
    int idx = blockIdx.x*blockDim.x + threadIdx.x;
    deviceArray[idx] = deviceArray[idx]*deviceArray[idx];
}


#endif