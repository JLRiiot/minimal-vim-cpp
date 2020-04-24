if(Boost_FOUND)
	include_directories(${Boost_INCLUDE_DIRS})

	add_executable(pp src/pp/prototype.cpp)
	target_link_libraries(pp ${Boost_LIBRARIES})
endif()

