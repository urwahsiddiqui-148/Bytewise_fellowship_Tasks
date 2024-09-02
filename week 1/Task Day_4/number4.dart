import 'dart:math';

class Box<T> {
  List<T> _items = [];

  // Method to add an item to the box
  void add(T item) {
    _items.add(item);
  }

  // Method to check if the box is empty
  bool isEmpty() {
    return _items.isEmpty;
  }

  // Method to draw an item randomly from the box
  T? drawItem() {
    if (isEmpty()) {
      print('The box is empty.');
      return null;
    }

    Random random = Random();
    int index = random.nextInt(_items.length);
    return _items[index];
  }
}

void main() {
  // Create a box of strings
  Box<String> stringBox = Box<String>();

  // Adding items to the box
  stringBox.add('Apple');
  stringBox.add('Banana');
  stringBox.add('Orange');

  // Draw items from the box
  print('Drawing items from stringBox:');
  for (int i = 0; i < 5; i++) {
    String? item = stringBox.drawItem();
    if (item != null) {
      print('Drawn item: $item');
    }
  }

  // Create a box of integers
  Box<int> intBox = Box<int>();

  // Adding items to the box
  intBox.add(10);
  intBox.add(20);
  intBox.add(30);

  // Draw items from the box
  print('\nDrawing items from intBox:');
  for (int i = 0; i < 5; i++) {
    int? item = intBox.drawItem();
    if (item != null) {
      print('Drawn item: $item');
    }
  }

  // Test with an empty box
  Box<double> emptyBox = Box<double>();
  double? drawnItem = emptyBox.drawItem();
  if (drawnItem == null) {
    print('\nTrying to draw from an empty box returned: $drawnItem');
  }
}
