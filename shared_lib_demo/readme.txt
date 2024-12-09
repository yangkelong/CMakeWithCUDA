windows下创建cuda dll库供普通c++代码调用 - 知乎

cd build

nvcc -m64 -arch=sm_89 -o  addgpu.dll -Xcompiler "/LD /D_USRDLL /D_WINDLL" ../add.cu

// 需要配置 cl.exe 环境, 或者直接打开 x64 Native Tools Command Prompt for VS 2022
cl /c ../maingpu.cpp
link maingpu.obj addgpu.lib
