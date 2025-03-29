import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'package:flutter/material.dart';

class NumberProvider extends ChangeNotifier {
  List<int> numbers = [1, 2, 3, 4]; // Initial list

  // Method to add a new number
  void addNumber() {
    numbers.add(numbers.last + 1);
    notifyListeners(); // Notify UI to update
  }
}
