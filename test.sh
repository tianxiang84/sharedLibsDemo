g++ -c -Wall -fPIC -o obj/shared.o src/shared/shared.cpp
g++ -shared -Wl,-soname,libshared.so -o lib/libshared.so obj/shared.o
g++ -c -Wall -o obj/main.o src/main/main.cpp

g++ -o bin/main src/main/main.cpp lib/libshared.so -Wl,-rpath=lib
g++ -o bin/main src/main/main.cpp -Llib -lshared -Wl,-rpath=lib

g++ -o -Llib -lshared bin/main src/main/main.cpp -Wl,-rpath=lib
./bin/main






rm *.so || true &&
rm main || true &&
g++ -fPIC -shared shared.cpp -o libshared.so &&
g++ -o main main.cpp -L. -lshared -Wl,-rpath,. &&
./main
