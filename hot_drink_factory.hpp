#pragma once

#include "hot_drink.hpp"

struct HotDrinkFactory {
  virtual ~HotDrinkFactory()                = default;
  virtual unique_ptr<HotDrink> make() const = 0;
};

struct CoffeeFactory : HotDrinkFactory {
  unique_ptr<HotDrink> make() const override { return make_unique<Coffee>(); }
};

struct TeaFactory : HotDrinkFactory {
  unique_ptr<HotDrink> make() const override { return make_unique<Tea>(); }
};

