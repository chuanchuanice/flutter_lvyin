import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_lvyindemo/widget/EditPage/vc/editpage_content.dart';
import 'package:flutter_lvyindemo/widget/HomePage/vc/home_content.dart';
import 'package:flutter_lvyindemo/widget/MinePage/vc/mine.dart';
import 'package:flutter_lvyindemo/widget/WorkPage/vc/workpage_content.dart';

class MainWidget extends StatefulWidget {
  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: <Widget>[
          HomePage(),
          WorkPage(),
          EditPage(),
          MinePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 13,
        unselectedFontSize: 13,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          TabBarItem(Image.asset('images/tabbar/tabbar_icon_hom.png'),
              Image.asset('images/tabbar/tabbar_icon_hom_sel.png'), "首页"),
          TabBarItem(
            Image.asset('images/tabbar/tabbar_icon_zuotai.png'),
            Image.asset('images/tabbar/tabbar_icon_zuotai_sel.png'),
            '工作台',
          ),
          TabBarItem(
            Image.asset('images/tabbar/tabbar_icon_lu.png'),
            Image.asset('images/tabbar/tabbar_icon_lu_sel.png'),
            '数据录入',
          ),
          TabBarItem(
            Image.asset('images/tabbar/tabbar_icon_wo.png'),
            Image.asset('images/tabbar/tabbar_icon_wo_sel.png'),
            '我的',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class TabBarItem extends BottomNavigationBarItem {
  TabBarItem(Widget icon, Widget selectIcon, String title)
      : super(title: Text(title), icon: icon, activeIcon: selectIcon);
}
