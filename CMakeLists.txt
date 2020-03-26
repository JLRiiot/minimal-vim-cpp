cmake_minimum_required(VERSION 3.10)

# set the project name
project(single_responsibility_principle)

set(Boost_USE_STATIC_LIBS ON)
set(Boost_USE_MULTITHREADED ON)
set(Boost_USE_STATIC_RUNTIME OFF)
find_package(Boost 1.72.0 COMPONENTS)
set(CMAKE_CXX_STANDARD 17)

if(Boost_FOUND)
	include_directories(${Boost_INCLUDE_DIRS})
	# add the executable
	add_executable(single_responsibility_principle main.cpp)
	target_link_libraries(single_responsibility_principle ${Boost_LIBRARIES})
elseif()
	message("Boost not found")
endif()
