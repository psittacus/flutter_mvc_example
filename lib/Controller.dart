import 'package:mvc_example/ExampleObserver.dart';
import 'package:mvc_example/Model.dart';
import 'package:mvc_example/View.dart';

class Controller implements ExampleObserver {

  final Model _model = Model();
  @override
  ViewStatefulState exampleSubject = ViewStatefulState();

  @override
  void update() {
    _model.calculateCounter().then((value) => exampleSubject.setCounter(value));
  }

  ViewStatefulState getViewStatefulState() {
    return exampleSubject;
  }

}