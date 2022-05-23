import 'package:mvc_example/ExampleObserver.dart';

class ExampleSubject {
  List<ExampleObserver> observerCollection = new List.empty(growable: true);
  void register(ExampleObserver exampleObserver){}
  void remove(ExampleObserver exampleObserver){}
  void notifyAll(){}
}