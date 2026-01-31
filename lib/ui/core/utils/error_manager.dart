import 'package:flutter/foundation.dart';

class ErrorManager extends ChangeNotifier {
  String? _currentError;

  String? get currentError => _currentError;

  void setError(String error) {
    _currentError = error;
    notifyListeners();
  }

  void clear() {
    _currentError = null;
    notifyListeners();
  }
}
