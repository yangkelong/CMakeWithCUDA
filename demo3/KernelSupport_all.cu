#ifndef _KERNEL_SUPPORT_
#define _KERNEL_SUPPORT_

#include <iostream>


__global__ void TestDevice(int *deviceArray)
{
    int idx = blockIdx.x*blockDim.x + threadIdx.x;
    deviceArray[idx] = deviceArray[idx]*deviceArray[idx];
}

int main( int argc, char** argv) 
{
    int* hostArray;
    int* deviceArray;
    const int arrayLength = 16;
    const unsigned int memSize = sizeof(int) * arrayLength;

    hostArray = (int*)malloc(memSize);
    cudaMalloc((void**) &deviceArray, memSize);

    std::cout << "Before device\n";
    for(int i=0;i<arrayLength;i++)
    {
        hostArray[i] = i+1;
        std::cout << hostArray[i] << "\n";
    }
    std::cout << "\n";

    cudaMemcpy(deviceArray, hostArray, memSize, cudaMemcpyHostToDevice);
    TestDevice <<< 4, 4 >>> (deviceArray);
    cudaMemcpy(hostArray, deviceArray, memSize, cudaMemcpyDeviceToHost);

    std::cout << "After device\n";
    for(int i=0;i<arrayLength;i++)
    {
        std::cout << hostArray[i] << "\n";
    }

    cudaFree(deviceArray);
    free(hostArray);

    std::cout << "Done\n";
}

#endif