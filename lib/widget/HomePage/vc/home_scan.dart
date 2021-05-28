import 'package:flutter/material.dart';
import 'package:flutter_lvyindemo/vendor/BaseView/BCBaseAppBar.dart';

class HomeScan extends StatefulWidget {
  const HomeScan({Key key}) : super(key: key);

  @override
  _HomeScan createState() => _HomeScan();
}

class _HomeScan extends State<HomeScan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BCBaseAppBar()
          .mybarbuild(BCBaseAppBarType.BCBaseAppBarTypeNomal, context),
      body: Container(
        child: Text('搜索'),
      ),
    );
  }
}
