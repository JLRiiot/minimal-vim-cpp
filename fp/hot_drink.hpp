#pragma once
#include <iostream>
#include <memory>
using namespace std;

struct HotDrink {
  virtual ~HotDrink()           = default;
  virtual void brew(int volume) = 0;
};

struct Coffee : HotDrink {
  void brew(int volume) {
    cout << "Brewing " << volume << "ml of Coffee" << endl;
  }
};

struct Tea : HotDrink {
  void brew(int volume) { cout << "Brewing " << volume << "ml of Tea" << endl; }
};

