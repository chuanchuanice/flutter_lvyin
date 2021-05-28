import 'package:flutter/material.dart';

class MinePage extends StatelessWidget {
  const MinePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的', style: TextStyle(fontSize: 15, color: Colors.black)),
      ),
      body: Container(
        child: Text('我的'),
      ),
    );
  }
}
