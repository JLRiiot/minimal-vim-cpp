cmake_minimum_required(VERSION 3.10)
project(design-patterns)


set(Boost_USE_STATIC_LIBS ON)
set(Boost_USE_MULTITHREADED ON)
set(Boost_USE_STATIC_RUNTIME OFF)
find_package(Boost 1.72.0 COMPONENTS)
set(CMAKE_CXX_STANDARD 17)

include(ExternalProject)

ExternalProject_Add(termcolor_project
  GIT_REPOSITORY git://github.com/ikalnytskyi/termcolor.git
  GIT_TAG origin/master

  # Termcolor is a header-only library which means we need to
  # neither configure nor build nor install it. Thus, noop
  # the hooks.
  CONFIGURE_COMMAND "" BUILD_COMMAND "" INSTALL_COMMAND "")
ExternalProject_Get_Property(termcolor_project SOURCE_DIR)
include_directories(${SOURCE_DIR}/include)
add_library(termcolor INTERFACE IMPORTED)
add_dependencies(termcolor termcolor_project)

message(STATUS "Source dir:  ${SOURCE_DIR}")
#if(Boost_FOUND)
	#include_directories(${Boost_INCLUDE_DIRS})
	## add the executable
	#add_executable(${CMAKE_PROJECT_NAME} main.cpp)
	#add_executable(${CMAKE_PROJECT_NAME} open_close.cpp)
	#add_executable(${CMAKE_PROJECT_NAME} interface_segregation.cpp)
	#add_executable(${CMAKE_PROJECT_NAME} fp.cpp)
	#add_executable(${CMAKE_PROJECT_NAME} afp.cpp)
	#add_executable(${CMAKE_PROJECT_NAME} prototype.cpp)

	#target_link_libraries(${CMAKE_PROJECT_NAME} ${Boost_LIBRARIES})
#elseif()
	#message("Boost not found")
#endif()

add_subdirectory(srp)
add_subdirectory(pp)

#target_link_libraries(${CMAKE_PROJECT_NAME} PRIVATE termcolor)

