Using GNU toolchain | mingw-w64:
- On Linux, all fine. Just pay attention to the order in the final linking stage: g++ -o xx xx (-Llib -lxx)(or path to dll) -Wl,-rpath,xx
- On Windows, seems that the dll has to be in the same folder where u call the exe, or in the same folder of the exe.