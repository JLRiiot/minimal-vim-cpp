#pragma once

#include "hot_drink.hpp"
#include "hot_drink_factory.hpp"
#include <map>

using namespace std;

class DrinkFactory {
  map<string, unique_ptr<HotDrinkFactory>> factories;

public:
  DrinkFactory() {
    factories["coffee"] = make_unique<CoffeeFactory>();
    factories["tea"]    = make_unique<TeaFactory>();
  }

  unique_ptr<HotDrink> make_drink(const string &name) {
    auto drink = factories[name]->make();
    return drink;
  }
};

class DrinkFunctionalFactory {
  map<string, function<unique_ptr<HotDrink>()>> factories;

public:
  DrinkFunctionalFactory() {
    factories["tea"] = [] {
      auto tea = make_unique<Tea>();
      return tea;
    };
  }

  unique_ptr<HotDrink> make_drink(const string &name) {
    return factories[name]();
  }
};

