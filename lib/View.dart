import 'package:flutter/material.dart';
import 'package:mvc_example/Controller.dart';
import 'package:mvc_example/ExampleObserver.dart';

import 'ExampleSubject.dart';

void main() {
  runApp(const View());
}

class View extends StatelessWidget {
  const View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mvc_example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ViewStateful(title: 'mvc_example'),
    );
  }
}

class ViewStateful extends StatefulWidget {
  ViewStateful({Key? key, required this.title}) : super(key: key);
  final String title;
  final Controller controller = Controller();
  @override
  State<ViewStateful> createState() => controller.getViewStatefulState();
}


class ViewStatefulState extends State<ViewStateful> implements ExampleSubject {
  int _counter = 0;

  @override
  List<ExampleObserver> observerCollection = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    register(widget.controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: notifyAll,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void notifyAll() {
    for(ExampleObserver exampleObserver in observerCollection) {
      exampleObserver.update();
    }
  }

  @override
  void register(ExampleObserver exampleObserver) {
    observerCollection.add(exampleObserver);
  }

  @override
  void remove(ExampleObserver exampleObserver) {
    observerCollection.remove(exampleObserver);
  }

  void setCounter(int counter) {
    setState(() {
      _counter = counter;
    });
  }
}