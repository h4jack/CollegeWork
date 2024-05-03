#include <stdio.h>
#include <stdlib.h>
#include <sys/utsname.h>

int main() {
  struct utsname kernel_info; // declare a structure to store kernel information
  int status = uname(&kernel_info); // get the kernel information and store it in the structure
  if (status == 0) { // check if the function succeeded
    printf("Kernel version: %s\n", kernel_info.release); // print the kernel version
    printf("CPU type and model: %s\n", kernel_info.machine); // print the CPU type and model
    system("cat /proc/cpuinfo | grep 'model name' | uniq"); // use a system command to print the CPU model name
  }
  else {
    printf("Error: unable to get kernel information\n"); // print an error message if the function failed
  }
  return 0;
}
