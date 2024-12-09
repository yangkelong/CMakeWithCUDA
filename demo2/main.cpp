// main.cpp
#include <iostream>
#include "vector_operations.h"

int main() {
    const int numElements = 1024;
    float* h_input = new float[numElements];
    float* h_output = new float[numElements];

    // 初始化输入数据
    for (int i = 0; i < numElements; ++i) {
        h_input[i] = static_cast<float>(i);
    }

    // 计算每个元素的平方
    squareElements(h_input, h_output, numElements);

    // 打印结果
    for (int i = 0; i < numElements; ++i) {
        std::cout << "Element " << i << " squared is " << h_output[i] << std::endl;
    }

    delete[] h_input;
    delete[] h_output;

    return 0;
}