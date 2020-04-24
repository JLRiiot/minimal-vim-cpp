#define _USE_MATH_DEFINES
#include <cmath>
#include <fstream>
#include <iostream>
#include <sstream>

using namespace std;

class Point {
public:
  Point(float x, float y) : x(x), y(y) {}

  friend ostream &operator<<(ostream &os, const Point &point) {
    os << "X: " << point.x << " Y: " << point.y;
    return os;
  }

  float x, y;
};

struct PointFactory {
  static Point NewCartesian(float x, float y) { return {x, y}; }
  static Point NewPolar(float r, float theta) {
    return {r * cos(theta), r * sin(theta)};
  }
};

int main() {
  Point p = PointFactory::NewPolar(5, M_PI_4);

  cout << p << endl;
}
