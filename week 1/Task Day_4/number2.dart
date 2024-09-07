class Student {
  // Encapsulated data member
  final String name;
  final List<int> resultArray; // Use List<int> for mutability

  // Default constructor (assigns empty name and result array)
  Student()
      : name = '',
        resultArray = List.filled(5, 0);

  // One-argument constructor (initializes name)
  Student.withName(this.name) : resultArray = List.filled(5, 0);

  // Two-argument constructor (initializes name and result array)
  Student.full(this.name, this.resultArray);

  // Method to calculate average
  double average() {
    if (resultArray.isEmpty) {
      return 0.0; // Handle empty array case
    }
    return resultArray.reduce((a, b) => a + b) / resultArray.length;
  }

  // Method to compare average with another Student object
  bool compareAverage(Student otherStudent) {
    double thisAverage = average();
    double otherAverage = otherStudent.average();
    return thisAverage > otherAverage;
  }
}

void main() {
  // Create student objects using different constructors
  Student student1 = Student();
  Student student2 = Student.withName('urwah');
  Student student3 = Student.full('shafiq', [80, 75, 90, 85, 95]);

  // Example usage of methods
  print(student1.name); // Output: (empty string from default constructor)
  print(student2.name); // Output: Alice
  student3.resultArray[0] = 70; // Modify marks (mutable List)
  print(student3.average()); // Output: 81.0 (average of modified marks)

  bool student1HasHigherAverage = student1.compareAverage(student3);
  print(
      student1HasHigherAverage); // Output: false (assuming student3's average is higher)
}
