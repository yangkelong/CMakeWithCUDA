#include "add.cuh"

 __global__ void addCUDA(int *a, int *b, int *c, const int n) {
     int i = threadIdx.x + blockIdx.x * blockDim.x;
     if (i < n) {
         c[i] = a[i] + b[i];
     }
 }
 
 void addgpu(int *a, int *b, int *c, int n) {
     int *d_a, *d_b, *d_c;
 
     // allocate device memory
     cudaMalloc(&d_a, n*sizeof(int));
     cudaMalloc(&d_b, n*sizeof(int));
     cudaMalloc(&d_c, n*sizeof(int));
 
     // copy data from host to device
     cudaMemcpy(d_a, a, n*sizeof(int), cudaMemcpyHostToDevice);
     cudaMemcpy(d_b, b, n*sizeof(int), cudaMemcpyHostToDevice);
 
     // launch addGpu kernel
     int blockSize = 256;
     int gridSize = (n + blockSize - 1) / blockSize;
     addCUDA<<<gridSize, blockSize>>>(d_a, d_b, d_c, n);
 
     // copy result from device to host
     cudaMemcpy(c, d_c, n*sizeof(int), cudaMemcpyDeviceToHost);
 
     // free device memory
     cudaFree(d_a);
     cudaFree(d_b);
     cudaFree(d_c);
 }