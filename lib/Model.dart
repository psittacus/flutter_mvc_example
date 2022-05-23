import 'package:mvc_example/ExampleObserver.dart';
import 'package:mvc_example/ExampleSubject.dart';

class Model {
  int counter = 0;

  //same crazy backend action
  Future<int> calculateCounter() {
    final Future<int> _calculation = Future.delayed(const Duration(seconds: 4), () => ++counter);
    return _calculation;
  }

}