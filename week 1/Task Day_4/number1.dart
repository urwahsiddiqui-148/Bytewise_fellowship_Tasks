class Address {
  String street;
  String city;
  String state;
  String zipCode;

  Address(
      {required this.street,
      required this.city,
      required this.state,
      required this.zipCode});
}

class Person {
  final String name;
  final Address address;
  final String phoneNumber;
  final String emailAddress;

  Person(this.name, this.address, this.phoneNumber, this.emailAddress);
}

class Student extends Person {
  final String status;

  Student(super.name, super.address, super.phoneNumber, super.emailAddress,
      this.status);
}

class Employee extends Person {
  final String office;
  final double salary;
  final DateTime dateHired;

  Employee(super.name, super.address, super.phoneNumber, super.emailAddress,
      this.office, this.salary, this.dateHired);
}

class Faculty extends Employee {
  final String officeHours;
  final String rank;

  Faculty(super.name, super.address, super.phoneNumber, super.emailAddress,
      super.office, super.salary, super.dateHired, this.officeHours, this.rank);

  void display() {
    print('Faculty Information:');
    print('Name: $name');
    print('Office Hours: $officeHours');
    print('Rank: $rank');
  }
}

class Staff extends Employee {
  final String title;

  Staff(super.name, super.address, super.phoneNumber, super.emailAddress,
      super.office, super.salary, super.dateHired, this.title);

  void display() {
    print('Staff Information:');
    print('Name: $name');
    print('Title: $title');
  }
}

void main() {
  // Create sample objects
  Faculty faculty = Faculty(
      'urwah shafiq',
      Address(
          street: '456 Elm St',
          city: 'multan',
          state: 'punjab',
          zipCode: '54321'),
      '(555) 555-3434',
      'urwahshafiq23@gmail.com',
      'Science Building 201',
      80000.0,
      DateTime(2023, 6, 1), // Sample date hired
      'M-W-F 10:00-12:00',
      'Professor');

  Staff staff = Staff(
      'umar sikandar',
      Address(
          street: '789 Oak St',
          city: 'mirpur',
          state: 'kashmir',
          zipCode: '98765'),
      '(555) 555-5656',
      'umarsikandar12@gmail.com',
      'Administration Building A10',
      65000.0,
      DateTime(2022, 1, 1), // Sample date hired
      'IT Specialist');

  // Call the display methods for faculty and staff
  faculty.display();
  staff.display();
}
