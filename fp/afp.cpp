#define _USE_MATH_DEFINES
#include <cmath>
#include <fstream>
#include <iostream>
#include <sstream>

#include "drink_factory.hpp"

using namespace std;

int main() {
  DrinkFactory           coffee_factory;
  DrinkFunctionalFactory functional_factory;

  auto coffee = coffee_factory.make_drink("coffee");
  auto tea    = functional_factory.make_drink("tea");

  coffee->brew(100);
  tea->brew(100);

  return 0;
}
