#include <boost/lexical_cast.hpp>
#include <fstream>
#include <iostream>
#include <string>
#include <vector>

using namespace std;
using namespace boost;

enum Sport {
  none     = 0x00,
  running  = 0x01,
  cycling  = 0x02,
  swimming = 0x04,
  bmx      = 0x08,
  footbal  = 0x10
};
enum class Category { amateur, professional, hobby };

struct Atlete {
  string   name;
  uint32_t discipline;
  Category category;
};

// This violates the Open close principle, because in order to create other kind
// of filter
//   we would need to modify this struc
struct AtleteFilter {
  typedef vector<Atlete *> Items;

  Items by_discipline(Items items, const uint32_t discipline) {
    Items result;
    for (auto &i : items) {
      /*cout << "Checking item " << i->name << endl;*/
      /*cout << "With " << i->discipline << endl;*/
      if (i->discipline & discipline) result.push_back(i);
    }
    return result;
  }
};

template <typename T> struct AndSpecification;

template <typename T> struct Specification {
  virtual ~Specification()                 = default;
  virtual bool is_satisfied(T *item) const = 0;
};

template <typename T>
AndSpecification<T>
operator&&(const Specification<T> &first, Specification<T> &second) {
  return {first, second};
};

template <typename T> struct Filter {
  virtual vector<T *> filter(vector<T *> items, Specification<T> &spec) = 0;
};

struct ExtendedFilter : Filter<Atlete> {
  vector<Atlete *>
  filter(vector<Atlete *> atlete, Specification<Atlete> &spec) override {
    vector<Atlete *> result;

    for (auto &a : atlete) {
      if (spec.is_satisfied(a)) result.push_back(a);
    }
    return result;
  }
};

struct SportSpecification : Specification<Atlete> {
  uint32_t sports;
  SportSpecification(u_int32_t sports) : sports(sports) {}

  bool is_satisfied(Atlete *atlete) const override {
    return atlete->discipline & sports;
  }
};

int main() {
  Atlete juli{.name       = "Juliana Hernandez",
              .discipline = Sport::running | Sport::cycling,
              .category   = Category::professional};
  Atlete jose{.name       = "Jose Luis Montana",
              .discipline = Sport::running | Sport::cycling,
              .category   = Category::professional};
  Atlete sangui{.name       = "Fabricio Sanguinetti",
                .discipline = Sport::cycling,
                .category   = Category::professional};

  const vector<Atlete *> items{&juli, &jose, &sangui};

  // Example of filter that violates Open close principle.
  // AtleteFilter           filter;
  // auto runners = filter.by_discipline(items, Sport::running);

  // Example of filter that is open and closed

  ExtendedFilter     open_close_filter;
  SportSpecification first_criteria{Sport::running | Sport::cycling};

  auto runners = open_close_filter.filter(items, first_criteria);

  cout << "Filter result" << endl;
  for (auto &r : runners) cout << r->name << " is a runner\n";
}
