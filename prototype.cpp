#include <fstream>
#include <iostream>
#include <sstream>
#include <termcolor/termcolor.hpp>

using namespace std;

struct Address {
  string street, city;
  int    suite;

  Address(const string &street, const string &city, int suite)
      : street(street), city(city), suite(suite) {}

  Address(const Address &other)
      : street(other.street), city(other.city), suite(other.suite) {}

  friend ostream &operator<<(ostream &os, const Address &address) {
    os << "Street: " << address.street << " City: " << address.city
       << " suite: " << address.suite;

    return os;
  }
};

struct Contact {
  string   name;
  Address *address;

  Contact(const string &name, Address *address)
      : name(name), address(address) {};

  Contact(const Contact &other)
      : name {other.name}, address {new Address {*other.address}} {}

  ~Contact( ) {
    delete address;
  }

  friend ostream &operator<<(ostream &os, const Contact &contact) {
    os << termcolor::yellow << "Name: " << termcolor::reset << contact.name
       << termcolor::green << " Address: " << termcolor::reset
       << *contact.address;

    return os;
  }
};

struct AtletFactory {
  static unique_ptr<Contact> new_local_atlet(
      const string &name,
      const int     suite) {

    static Contact prototype {
        "", new Address {"Km 2 Bogota Chia, CoolSunset building", "Bogota", 0}};

    return new_atlet(name, suite, prototype);
  }

 private:
  static unique_ptr<Contact>
  new_atlet(const string &name, const int suite, const Contact &prototype) {
    auto result            = make_unique<Contact>(prototype);
    result->name           = name;
    result->address->suite = suite;

    return result;
  }
};

int
main( ) {
  auto john = AtletFactory::new_local_atlet("John Doe", 102);
  auto jane = AtletFactory::new_local_atlet("Jane Walls", 104);

  cout << *john << endl << *jane << endl;
}
