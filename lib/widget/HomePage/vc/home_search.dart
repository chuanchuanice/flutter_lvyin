import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_lvyindemo/vendor/BaseView/SearchBar/search_textfield_bar.dart';

class HomeSearch extends StatefulWidget {
  const HomeSearch({Key key}) : super(key: key);

  @override
  _HomeSearch createState() => _HomeSearch();
}

class _HomeSearch extends State<HomeSearch>
    with SingleTickerProviderStateMixin {
  List tabs = ['新闻', '环保验收公示', '信息公示', '政策法规'];
  TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController =
        TabController(initialIndex: 0, length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: SearchTextFieldBar(
          hint: '请输入关键词',
          defaultBorderRadius: 8,
          height: 38,
          onSubmitted: (String searchstring) {
            print('搜索了$searchstring');
          },
        ),
        actions: [
          FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                '取消',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              )),
        ],
        elevation: 0.0,
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs.map((e) => Tab(text: e)).toList(),
          isScrollable: true,
          indicatorColor: Colors.green,
          indicatorWeight: 2,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorPadding: EdgeInsets.only(left: 5, right: 5),
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          labelStyle: TextStyle(fontSize: 16, color: Colors.black),
          unselectedLabelStyle: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) {
          return Container(
            alignment: Alignment.center,
            child: Text(e, style: TextStyle(fontSize: 50)),
          );
        }).toList(),
      ),
    );
  }
}
