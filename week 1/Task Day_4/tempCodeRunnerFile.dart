class Job {
  final String designation;
  final double salary;
  final int id;

  Job(this.designation, this.salary, this.id);

  // Getters (optional)
  String get designationProperty => designation;
  double get salaryProperty => salary;
  int get idProperty => id;
}

class Employee {
  final String name;
  final String address;
  final String phoneNumber;
  final String emailAddress;
  final Job job;

  Employee(
      this.name, this.address, this.phoneNumber, this.emailAddress, this.job);

  // Getters (optional)
  String get nameProperty => name;
  String get addressProperty => address;
  String get phoneNumberProperty => phoneNumber;
  String get emailAddressProperty => emailAddress;
  Job get jobProperty => job;

  // Display function (enhanced)
  void display() {
    print('Employee Information:');
    print('Name: $name');
    print('Address: $address');
    print('Phone Number: $phoneNumber');
    print('Email Address: $emailAddress');
    print('Job Details:');
    print(
        'Designation: ${job.designationProperty}'); // Use getters for Job properties
    print('Salary: ${job.salaryProperty}');
    print('Job ID: ${job.idProperty}');
  }

  // Check salary method
  bool isHighSalary() =>
      job.salaryProperty > 50000; // Use getter for job salary
}

void main() {
  // Create Job objects
  Job job1 = Job('Software Engineer', 75000.0, 1234);
  Job job2 = Job('Marketing Manager', 60000.0, 5678);

  // Create Employee objects with Job references
  Employee employee1 = Employee(
      'Alice', '123 Main St', '(555) 555-1212', 'alice@example.com', job1);
  Employee employee2 =
      Employee('Bob', '456 Elm St', '(555) 555-3434', 'bob@example.com', job2);

  // Display employee information
  employee1.display();
  print('\n');
  employee2.display();

  // Check salary using the new method
  print(
      '\n${employee1.nameProperty} has a high salary: ${employee1.isHighSalary()}');
  print(
      '${employee2.nameProperty} has a high salary: ${employee2.isHighSalary()}');
}
