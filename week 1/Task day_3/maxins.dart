// Define a mixin 'Flyer' with a method
mixin Flyer {
  void fly() {
    print("I can fly!");
  }
}

// Define a base class 'Animal'
class Animal {
  String name;

  Animal(this.name);

  void displayInfo() {
    print("Animal: $name");
  }
}

// Define a class 'Bird' that extends 'Animal' and uses the 'Flyer' mixin
class Bird extends Animal with Flyer {
  Bird(String name) : super(name);

  // Additional method specific to Bird
  void chirp() {
    print("Chirp chirp!");
  }
}

void main() {
  // Create an instance of the Bird class
  Bird sparrow = Bird('Sparrow');

  // Call methods from the Animal class, the Flyer mixin, and the Bird class
  sparrow.displayInfo(); // Output: Animal: Sparrow
  sparrow.fly(); // Output: I can fly!
  sparrow.chirp(); // Output: Chirp chirp!
}
