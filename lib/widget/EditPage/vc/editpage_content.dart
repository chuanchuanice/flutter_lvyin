import 'package:flutter/material.dart';
import 'package:flutter_lvyindemo/vendor/BaseView/BCBaseAppBar.dart';

class EditPage extends StatelessWidget {
  const EditPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BCBaseAppBar()
          .mybarbuild(BCBaseAppBarType.BCBaseAppBarTypeWorkEdit, context),
      body: Container(
        child: Text('编辑'),
      ),
    );
  }
}
