import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BmiPage extends StatefulWidget {
  BmiPage({Key? key}) : super(key: key);

  @override
  _BmiPageState createState() {
    return _BmiPageState();
  }
}

class _BmiPageState extends State<BmiPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Text("Calculator Page"),
      ),
    );
  }
}
