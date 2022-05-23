import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_example/main.dart';

class View extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }

}

class ViewStateful extends StatefulWidget {

  String title = "mvc_example";

  @override
  State<StatefulWidget> createState() {
    return ViewStatefulState();
  }
}
