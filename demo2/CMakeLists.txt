cmake_minimum_required(VERSION 3.8 FATAL_ERROR)
project(SquareElementsExample)

find_package(CUDA REQUIRED)
include_directories(${CUDA_INCLUDE_DIRS})

#add_executable(main main.cpp vector_operations.cpp vector_operations.h)
add_executable(main main.cpp vector_operations.cu vector_operations.h)
target_link_libraries(main ${CUDA_LIBRARIES})