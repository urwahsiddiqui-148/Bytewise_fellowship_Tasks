// Define a class named 'Student'
class Student {
  String name;
  int age;
  String major;

  // Default Constructor with initializers
  Student()
      : name = 'Unknown',
        age = 18,
        major = 'Undeclared';

  // Parameterized Constructor
  Student.withDetails(this.name, this.age, this.major);

  // Named Constructor
  Student.withName(String name)
      : name = name,
        age = 20, // default age
        major = 'General Studies'; // default major

  // Method to display student details
  void displayInfo() {
    print("Name: $name, Age: $age, Major: $major");
  }
}

void main() {
  // Using the default constructor
  Student student1 = Student();
  student1.displayInfo(); // Output: Name: Unknown, Age: 18, Major: Undeclared

  // Using the parameterized constructor
  Student student2 = Student.withDetails('urwah', 22, 'Computer Science');
  student2
      .displayInfo(); // Output: Name: Alice, Age: 22, Major: Computer Science

  // Using the named constructor
  Student student3 = Student.withName('shafiq');
  student3.displayInfo(); // Output: Name: Bob, Age: 20, Major: General Studies
}
