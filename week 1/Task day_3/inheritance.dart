// Base class 'Animal'
class Animal {
  String name;

  // Constructor for the base class
  Animal(this.name);

  // Method in the base class
  void displayInfo() {
    print("Animal: $name");
  }
}

// Derived class 'Dog' extends 'Animal'
class Dog extends Animal {
  String breed;

  // Constructor for the derived class
  Dog(String name, this.breed) : super(name);

  // Method in the derived class
  void displayBreed() {
    print("Dog Breed: $breed");
  }
}

void main() {
  // Creating an instance of the derived class
  Dog myDog = Dog('tony', 'Golden Retriever');

  // Accessing method from the base class
  myDog.displayInfo(); // Output: Animal: tony

  // Accessing method from the derived class
  myDog.displayBreed(); // Output: Dog Breed: Golden Retriever
}
