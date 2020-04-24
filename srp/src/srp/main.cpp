#include <boost/lexical_cast.hpp>
#include <fstream>
#include <iostream>
#include <string>
#include <vector>

using namespace std;
using namespace boost;

struct Journal {
  string         title;
  vector<string> entries;

  explicit Journal(const string &title) : title {title} {};

  void add_entry(const string &entry) {
    static int count = 1;
    entries.push_back(lexical_cast<string>(count++) + ": " + entry);
  }
};

struct PersistanceManager {
  static void save(const Journal &j, const string &filename) {
    ofstream ofs(filename);
    for (auto &e : j.entries)
      ofs << e << endl;
  }
};

int
main( ) {
  Journal journal {"Dear Diary"};
  journal.add_entry("I ate a nice lunch");

  PersistanceManager pm;
  pm.save(journal, "output.txt");

  getchar( );
  return 0;
}
