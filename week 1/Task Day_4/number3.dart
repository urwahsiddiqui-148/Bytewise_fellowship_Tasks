// Movie class with ID, title, rental days, and accessor/mutator methods
class Movie {
  late int _id; // Private ID for encapsulation
  String title;
  int rentalDays;

  Movie(this.title, this.rentalDays);

  void setId(int id) {
    _id = id;
  }

  int getId() => _id;

  bool equals(Object other) {
    if (identical(this, other)) return true;
    return other is Movie &&
        other.title == title &&
        other.rentalDays == rentalDays;
  }

  // Abstract method to be overridden in subclasses
  double calcLateFees(int lateDays) => throw UnimplementedError();
}

// Action movie class with overridden calcLateFees
class Action extends Movie {
  Action(String title, int rentalDays) : super(title, rentalDays);

  @override
  double calcLateFees(int lateDays) => lateDays * 3.0;
}

// Comedy movie class with overridden calcLateFees
class Comedy extends Movie {
  Comedy(String title, int rentalDays) : super(title, rentalDays);

  @override
  double calcLateFees(int lateDays) => lateDays * 2.5;
}

// Drama movie class with overridden calcLateFees
class Drama extends Movie {
  Drama(String title, int rentalDays) : super(title, rentalDays);

  @override
  double calcLateFees(int lateDays) => lateDays * 2.0;
}

// Abstract Person class with name and abstract isOutstanding() method
abstract class Person {
  late String name;

  void setName(String name) {
    this.name = name;
  }

  String getName() => name;

  bool isOutstanding();
}

// Student class derived from Person with CGPA and isOutstanding() implementation
class Student extends Person {
  late double cgpa;

  void setCgpa(double cgpa) {
    this.cgpa = cgpa;
  }

  double getCgpa() => cgpa;

  @override
  bool isOutstanding() => cgpa > 3.5;
}

// Professor class derived from Person with numberOfPublications and isOutstanding() implementation
class Professor extends Person {
  late int numberOfPublications;

  void setNumberOfPublications(int number) {
    this.numberOfPublications = number;
  }

  int getNumberOfPublications() => numberOfPublications;

  @override
  bool isOutstanding() => numberOfPublications > 50;
}

void main() {
  //...

  // Person objects and isOutstanding() calls
  List<Person> people = [
    Student()
      ..setName("Alice")
      ..setCgpa(3.8), // Set name and cgpa
    Professor()
      ..setName("Bob")
      ..setNumberOfPublications(10), // Set name and publications
  ];

  for (Person person in people) {
    print("${person.getName()}: ${person.isOutstanding()}");
  }

  // Set Professor publications and call isOutstanding() again
  (people[1] as Professor).setNumberOfPublications(100);
  print("${people[1].getName()}: ${people[1].isOutstanding()}"); // Now true
}
