cmake_minimum_required(VERSION 3.8 FATAL_ERROR)
project(AddWithGPU)

set(CUDA_ARCHITECTURES 70)

find_package(CUDA REQUIRED)
cuda_add_library(gpu_add STATIC add.cuh  add.cu)

add_executable(main maingpu.cpp add.cuh)

target_link_libraries(main gpu_add)

