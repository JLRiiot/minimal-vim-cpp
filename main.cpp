#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <boost/lexical_cast.hpp>
using namespace std;

struct Journal {
	string title;
  vector<string> entries;
 
 	explicit Journal(const string& title)
  	: title{title}
	{
	};
};

int main() {
	cout << "CMake working 😃\n";
	return 0;
}
