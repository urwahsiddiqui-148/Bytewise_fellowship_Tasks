// Base class 'Animal'
class Animal {
  void makeSound() {
    print("Animal makes a sound");
  }
}

// Derived class 'Dog' extends 'Animal'
class Dog extends Animal {
  @override
  void makeSound() {
    print("Dog barks");
  }
}

// Derived class 'Cat' extends 'Animal'
class Cat extends Animal {
  @override
  void makeSound() {
    print("Cat meows");
  }
}

void main() {
  // List of Animal objects, each holding different derived class instances
  List<Animal> animals = [Dog(), Cat(), Animal()];

  // Loop through the list and call makeSound method
  for (var animal in animals) {
    animal
        .makeSound(); // Outputs: "Dog barks", "Cat meows", "Animal makes a sound"
  }
}
