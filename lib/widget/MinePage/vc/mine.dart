import 'package:flutter/material.dart';
import 'package:flutter_lvyindemo/vendor/Preferences/mobile_preferences.dart';

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
      floatingActionButton: new Builder(builder: (BuildContext context) {
        return new FloatingActionButton(
          child: Text(
            '退出登录',
            style: TextStyle(fontSize: 10),
          ),
          tooltip: "",
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
          heroTag: null,
          elevation: 7.0,
          highlightElevation: 14.0,
          onPressed: () {
            MobilePreferences().removeToken();
            MobilePreferences().removeUserName();
            MobilePreferences().removeUserType();
          },
          mini: false,
          shape: new CircleBorder(),
          isExtended: false,
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
