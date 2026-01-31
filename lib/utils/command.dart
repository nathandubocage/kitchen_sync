import 'package:flutter/foundation.dart';

import 'package:kitchen_sync/utils/result.dart';

typedef CommandAction0<T> = Future<Result<T>> Function();
typedef CommandAction1<T, A> = Future<Result<T>> Function(A);
typedef CommandAction2<T, A, B> = Future<Result<T>> Function(A, B);
typedef CommandAction3<T, A, B, C> = Future<Result<T>> Function(A, B, C);
typedef CommandAction4<T, A, B, C, D> = Future<Result<T>> Function(A, B, C, D);
typedef CommandAction5<T, A, B, C, D, E> =
    Future<Result<T>> Function(A, B, C, D, E);
typedef CommandAction6<T, A, B, C, D, E, F> =
    Future<Result<T>> Function(A, B, C, D, E, F);

/// Facilitates interaction with a ViewModel.
///
/// Encapsulates an action,
/// exposes its running and error states,
/// and ensures that it can't be launched again until it finishes.
///
/// Use [Command0] for actions without arguments.
/// Use [Command1] for actions with one argument.
///
/// Actions must return a [Result].
///
/// Consume the action result by listening to changes,
/// then call to [clearResult] when the state is consumed.
abstract class Command<T> extends ChangeNotifier {
  Command();

  bool _running = false;

  /// True when the action is running.
  bool get running => _running;

  Result<T>? _result;

  /// true if action completed with error
  bool get error => _result is Error;

  /// true if action completed successfully
  bool get completed => _result is Ok;

  /// Get last action result
  Result? get result => _result;

  /// Clear last action result
  void clearResult() {
    _result = null;
    notifyListeners();
  }

  void clearRunning() {
    _running = false;
    notifyListeners();
  }

  /// Internal execute implementation
  Future<void> _execute(CommandAction0<T> action) async {
    // Ensure the action can't launch multiple times.
    // e.g. avoid multiple taps on button
    if (_running) return;

    // Notify listeners.
    // e.g. button shows loading state
    _running = true;
    _result = null;
    notifyListeners();

    try {
      _result = await action();
    } finally {
      _running = false;
      notifyListeners();
    }
  }
}

/// [Command] without arguments.
/// Takes a [CommandAction0] as action.
class Command0<T> extends Command<T> {
  Command0(this._action);

  final CommandAction0<T> _action;

  /// Executes the action.
  Future<void> execute() async {
    await _execute(_action);
  }
}

/// [Command] with one argument.
/// Takes a [CommandAction1] as action.
class Command1<T, A> extends Command<T> {
  Command1(this._action);

  final CommandAction1<T, A> _action;

  /// Executes the action with the argument.
  Future<void> execute(A argument) async {
    await _execute(() => _action(argument));
  }
}

class Command2<T, A, B> extends Command<T> {
  Command2(this._action);

  final CommandAction2<T, A, B> _action;

  /// Executes the action with the argument.
  Future<void> execute(A argument1, B argument2) async {
    await _execute(() => _action(argument1, argument2));
  }
}

class Command3<T, A, B, C> extends Command<T> {
  Command3(this._action);

  final CommandAction3<T, A, B, C> _action;

  /// Executes the action with the argument.
  Future<void> execute(A argument1, B argument2, C argument3) async {
    await _execute(() => _action(argument1, argument2, argument3));
  }
}

class Command4<T, A, B, C, D> extends Command<T> {
  Command4(this._action);

  final CommandAction4<T, A, B, C, D> _action;

  /// Executes the action with the argument.
  Future<void> execute(
    A argument1,
    B argument2,
    C argument3,
    D argument4,
  ) async {
    await _execute(() => _action(argument1, argument2, argument3, argument4));
  }
}

class Command5<T, A, B, C, D, E> extends Command<T> {
  Command5(this._action);

  final CommandAction5<T, A, B, C, D, E> _action;

  /// Executes the action with the argument.
  Future<void> execute(
    A argument1,
    B argument2,
    C argument3,
    D argument4,
    E argument5,
  ) async {
    await _execute(
      () => _action(argument1, argument2, argument3, argument4, argument5),
    );
  }
}

class Command6<T, A, B, C, D, E, F> extends Command<T> {
  Command6(this._action);

  final CommandAction6<T, A, B, C, D, E, F> _action;

  /// Executes the action with the argument.
  Future<void> execute(
    A argument1,
    B argument2,
    C argument3,
    D argument4,
    E argument5,
    F argument6,
  ) async {
    await _execute(
      () => _action(
        argument1,
        argument2,
        argument3,
        argument4,
        argument5,
        argument6,
      ),
    );
  }
}
