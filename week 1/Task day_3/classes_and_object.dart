// Define a simple class named 'Person'
class Person {
  // Properties (or fields)
  String name;
  int age;

  // Constructor to initialize the properties
  Person(this.name, this.age);

  // Method to display the person's details
  void displayInfo() {
    print("Name: $name, Age: $age");
  }
}

void main() {
  // Create an object (instance) of the Person class
  Person person1 = Person('urwah', 25);

  // Call the method using the object
  person1.displayInfo();

  // Create another object with different values
  Person person2 = Person('shafiq', 30);

  // Call the method using the second object
  person2.displayInfo();
}
