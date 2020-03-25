On Linux:
- Separated folders:
g++ -c -Wall -fPIC -o obj/shared.o src/shared/shared.cpp
g++ -shared -Wl,-soname,libshared.so -o lib/libshared.so obj/shared.o
g++ -c -Wall -o obj/main.o src/main/main.cpp
g++ -o bin/main src/main/main.cpp -Llib -lshared -Wl,-rpath=lib (OR g++ -o bin/main src/main/main.cpp lib/libshared.so -Wl,-rpath=lib)
./bin/main

- Same folder:
g++ -fPIC -shared shared.cpp -o libshared.so &&
g++ -o main main.cpp -L. -lshared -Wl,-rpath,. &&
./main 


On Windows (mingw-w64)
- Separated folders:
g++ -c -Wall -fPIC -o obj\shared.o src\shared\shared.cpp
g++ -shared -Wl,-soname,libshared.dll -o bin\libshared.dll obj\shared.o 
g++ -c -Wall -o obj\main.o src\main\main.cpp
g++ -o bin\main.exe obj\main.o -Lbin -lshared -Wl,-rpath=bin (OR g++ -o bin\main obj/main.o bin\libshared.dll -Wl,-rpath=bin)
.\bin\main.exe

- Same folder:
g++ -fPIC -shared shared.cpp -o libshared.dll
g++ -o main.exe main.cpp -L. -lshared -Wl,-rpath,.
./main.exe 