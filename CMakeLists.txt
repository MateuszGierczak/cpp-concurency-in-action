if(DEFINED ENV{VCPKG_ROOT} AND NOT DEFINED CMAKE_TOOLCHAIN_FILE)
  set(CMAKE_TOOLCHAIN_FILE "$ENV{VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake"
      CACHE STRING "")
endif()

message(STATUS "Vcpkg integration script found : " ${CMAKE_TOOLCHAIN_FILE})

cmake_minimum_required(VERSION 3.26)
get_filename_component(PROJECT_NAME_STR ${CMAKE_CURRENT_SOURCE_DIR} NAME)
project(${PROJECT_NAME_STR})

message(STATUS "Parsing CMake for ${PROJECT_NAME}")

find_package(GTest CONFIG REQUIRED)

enable_testing()
