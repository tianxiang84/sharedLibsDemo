#cmake_minimum_required(VERSION 3.17.0)
#project (hello)

#Bring the headers, such as Student.h into the project
#include_directories(include)

#Can manually add the sources using the set command as follows:
#set(SOURCES src/mainapp.cpp src/Student.cpp) 
#However, the file(GLOB...) allows for wildcard additions:
#file(GLOB SOURCES "src/testCMake/testCMake.cpp")

#set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
#set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
#set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

#add_executable(hello helloworld.cpp) 
#add_executable(testCMake ${SOURCES})


cmake_minimum_required(VERSION 3.17.0)

project(sharedLibsDemo)                 # create a project with the given name

#Bring the headers, such as Student.h into the project
include_directories(include)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

set(LIB_SOURCES src/shared/shared.cpp) 
add_library(shared SHARED ${LIB_SOURCES})   # compile "shared.cpp" and create a SHARED library called "shared"

set(SOURCES src/main/main.cpp) 
add_executable(main ${SOURCES})           # compile "main.cpp" the the executable called "main"

#include (GenerateExportHeader)          
#GENERATE_EXPORT_HEADER(shared           # generates the export header shared_EXPORTS.h automatically
#    BASE_NAME shared
#    EXPORT_MACRO_NAME shared_EXPORTS
#    EXPORT_FILE_NAME shared_EXPORTS.h
#    STATIC_DEFINE SHARED_EXPORTS_BUILT_AS_STATIC)

target_link_libraries(main shared)      # link our previously created shared library "shared" to the exectable "main"