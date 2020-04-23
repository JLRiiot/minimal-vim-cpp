#include <boost/lexical_cast.hpp>
#include <fstream>
#include <iostream>
#include <string>
#include <vector>

using namespace std;
using namespace boost;

struct Document;

struct IPrinter {
  virtual void print(Document &doc) = 0;
};

struct IScanner {
  virtual void scan(Document &doc) = 0;
};

struct IFax {
  virtual void fax(Document &doc) = 0;
};

struct IMultiFunctional : IPrinter, IScanner, IFax {};

int main() {}
