void main() {
  String name = 'urwah'; // Non-nullable string
  String? maybeName = null; // Nullable string

  print(name.length); // This is safe, 'name' cannot be null
  // print(maybeName.length); // This would cause a compilation error because 'maybeName' can be null

  // Checking nullability before accessing
  if (maybeName != null) {
    print(maybeName.length); // This is safe now
  } else {
    print('Name is null');
  }
}
