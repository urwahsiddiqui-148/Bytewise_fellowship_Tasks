// viewmodel.dart
import 'package:flutter/material.dart';
import 'package:theming_in_flutter/modle.dart';

class CounterViewModel extends ChangeNotifier {
  final CounterModel _model = CounterModel();

  int get counter => _model.counter;

  void incrementCounter() {
    _model.incrementCounter();
    notifyListeners(); // Notify view to update
  }
}
