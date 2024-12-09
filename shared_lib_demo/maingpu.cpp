 #include <iostream>
 
 extern "C" __declspec(dllimport) void addgpu(int *a, int *b, int *c, int n);
 
 int main() {
     int n = 100;
 
     int *a = new int[n];
     int *b = new int[n];
     int *c = new int[n];
 
     for (int i = 0; i < n; i++) {
         a[i] = i;
         b[i] = i;
     }
 
     addgpu(a, b, c, n);
 
     for (int i = 0; i < n; i++) {
         std::cout<<c[i]<<std::endl;
     }
 
     delete[] a;
     delete[] b;
     delete[] c;
 
     return 0;
 }