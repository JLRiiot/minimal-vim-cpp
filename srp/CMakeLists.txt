if(Boost_FOUND)
	include_directories(${Boost_INCLUDE_DIRS})

	add_executable(srp src/srp/main.cpp)
	target_link_libraries(srp ${Boost_LIBRARIES})
endif()

