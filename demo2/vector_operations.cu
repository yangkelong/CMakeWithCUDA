// vector_operations.cpp
#include "vector_operations.h"
#include <cuda_runtime.h>
#include <device_launch_parameters.h>


extern "C" __global__ void squareKernel(float* input, float* output, int numElements) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < numElements) {
        output[i] = input[i] * input[i];
    }
}

extern "C" __host__ void squareElements(float* input, float* output, int numElements) {
    int threadsPerBlock = 256;
    int blocksPerGrid = (numElements + threadsPerBlock - 1) / threadsPerBlock;

    float* d_input = nullptr;
    float* d_output = nullptr;

    cudaMalloc(&d_input, numElements * sizeof(float));
    cudaMalloc(&d_output, numElements * sizeof(float));
    cudaMemcpy(d_input, input, numElements * sizeof(float), cudaMemcpyHostToDevice);

    squareKernel<<<blocksPerGrid, threadsPerBlock>>>(d_input, d_output, numElements);

    cudaMemcpy(output, d_output, numElements * sizeof(float), cudaMemcpyDeviceToHost);

    cudaFree(d_input);
    cudaFree(d_output);
}