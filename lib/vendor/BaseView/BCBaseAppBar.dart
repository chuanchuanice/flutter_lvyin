import 'package:flutter/material.dart';
import 'package:flutter_lvyindemo/vendor/BaseView/BCTranRouterAnima.dart';
import 'package:flutter_lvyindemo/vendor/Preferences/mobile_preferences.dart';
import 'package:flutter_lvyindemo/widget/Login/BCLogin.dart';

enum BCBaseAppBarType {
  BCBaseAppBarTypeNomal, //普通
  BCBaseAppBarTypeHome, //首页
  BCBaseAppBarTypeWorkEdit, //工作台 + 数据录入
}

// ignore: must_be_immutable
class BCBaseAppBar {
  AppBar appBar;
  BCBaseAppBarType bcbartype = BCBaseAppBarType.BCBaseAppBarTypeNomal;
  String titleStr = '';
  BuildContext childcontext;

  GestureDetector seartchBtn() {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset('images/home/top_icon_sousuo.png'),
            Text(
              '搜索',
              style: TextStyle(fontSize: 10),
            )
          ],
        ),
      ),
      onTap: () {
        searchBtnClick();
      },
    );
  }

  void searchBtnClick() {
    Navigator.pushNamed(childcontext, '/BCHomeSearch');
  }

  GestureDetector scancodeBtn() {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset('images/home/top_icon_saoma.png'),
            Text(
              '扫码',
              style: TextStyle(fontSize: 10),
            )
          ],
        ),
      ),
      onTap: () {
        scancodeBtnClick();
      },
    );
  }

  void scancodeBtnClick() {
    Navigator.pushNamed(childcontext, '/BCHomeScan');
  }

  PopupMenuButton<Choice> poppupmenubtn(BCBaseAppBarType bcbartype) {
    return PopupMenuButton<Choice>(
      offset: Offset(0, 40),
      icon: Column(
        children: [
          Image.asset('images/home/top_icon_gengduo.png'),
          Text(
            '更多',
            style: TextStyle(fontSize: 10),
          )
        ],
      ),
      itemBuilder: (BuildContext context) {
        return (bcbartype == BCBaseAppBarType.BCBaseAppBarTypeNomal
                ? choices
                : choices2)
            .map<PopupMenuItem<Choice>>((Choice choice) {
          return PopupMenuItem<Choice>(
            value: choice,
            child: PopupMenuItemCard(
              choice: Choice(title: choice.title, icon: choice.icon),
            ),
          );
        }).toList();
      },
      onSelected: (Choice choice) {
        switch (choice.title) {
          case '返回主页':
            Navigator.popUntil(childcontext, ModalRoute.withName('/rootvc'));
            break;
          case '消息':
            break;
          case '反馈':
            break;
          default:
            break;
        }
      },
    );
  }

  AppBar mybarbuild(BCBaseAppBarType bcbartype, BuildContext childcontext) {
    this.bcbartype = bcbartype;
    this.childcontext = childcontext;
    this.appBar = AppBar(
      title: ValueListenableBuilder(
        builder: (context, value, child) {
          return bcbartype == BCBaseAppBarType.BCBaseAppBarTypeNomal
            ? Text(titleStr)
            : bcbartype == BCBaseAppBarType.BCBaseAppBarTypeHome
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            child: Container(
                              child: Text(
                                value['username'] == null ?'登录' : value['username'],
                                style: TextStyle(fontSize: 20),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              width: 200,
                            ),
                            onTap: () {
                              Navigator.push(childcontext,
                                  Bottom2TopRouter(child: BCLogin()));
                            },
                          ),
                        ],
                      ),
                      // Expanded(child: Text(titleStr)),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          value['username'] == null ?'' : value['username'],
                          style: TextStyle(fontSize: 20),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        width: 250,
                      ),
                    ],
                  );
        },

        ///监听的数据
        valueListenable: UserNotifierSingleton.instance.bcuserNotifier,

      ),
      actions: bcbartype == BCBaseAppBarType.BCBaseAppBarTypeNomal
          ? [
              poppupmenubtn(bcbartype),
            ]
          : bcbartype == BCBaseAppBarType.BCBaseAppBarTypeHome
              ? [
                  seartchBtn(),
                  SizedBox(
                    width: 10,
                  ),
                  scancodeBtn(),
                  poppupmenubtn(bcbartype),
                ]
              : [
                  scancodeBtn(),
                  poppupmenubtn(bcbartype),
                ],
    );
    return this.appBar;
  }
}

class Choice {
  const Choice({this.title, this.icon});
  final String title;
  final IconData icon;
}

List<Choice> choices = <Choice>[
  Choice(title: '返回主页', icon: Icons.chat),
  Choice(title: '消息', icon: Icons.add_call),
  Choice(title: '反馈', icon: Icons.scanner),
];

List<Choice> choices2 = <Choice>[
  Choice(title: '消息', icon: Icons.add_call),
  Choice(title: '反馈', icon: Icons.scanner),
];

class PopupMenuItemCard extends StatelessWidget {
  const PopupMenuItemCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final TextStyle textStyle = Theme.of(context).textTheme.headline;

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Icon(choice.icon, size: 20.0, color: textStyle.color),
        Container(
          padding: EdgeInsets.only(left: 15),
          child: Text(choice.title, style: TextStyle(fontSize: 18)),
        )
      ],
    );
  }
}

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.headline;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              choice.icon,
              size: 128.0,
              color: textStyle.color,
            ),
            Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}
