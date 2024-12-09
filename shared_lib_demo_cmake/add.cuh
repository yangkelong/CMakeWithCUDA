 #pragma once
 
 // 将需要暴露出的接口写在 .h 文件中
 // 在 Windows 平台上，__declspec(dllexport) 是一个 Microsoft 特定的关键字，用于在编译时告诉链接器导出函数或变量，使其能够在动态链接库（DLL）中被其他模块或应用程序访问。
 extern "C" __declspec(dllexport) void addgpu(int *a, int *b, int *c, int n);

