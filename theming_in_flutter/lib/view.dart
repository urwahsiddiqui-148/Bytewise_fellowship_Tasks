// view.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theming_in_flutter/modleview.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CounterViewModel>(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Counter: ${viewModel.counter}'),
          ElevatedButton(
            onPressed: viewModel.incrementCounter,
            child: const Text('Increment'),
          ),
        ],
      ),
    );
  }
}
