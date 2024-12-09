 #pragma once
// #include <cuda_runtime.h>
// #include <device_launch_parameters.h>
 
 extern "C" __declspec(dllexport) void addgpu(int *a, int *b, int *c, int n);
// __global__ void addCUDA(int *a, int *b, int *c, const int n);