import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lvyindemo/vendor/Preferences/mobile_preferences.dart';
import 'package:flutter_lvyindemo/vendor/WebHTTP/http_config.dart';
import 'package:flutter_lvyindemo/vendor/WebHTTP/http_request.dart';
import 'package:flutter_lvyindemo/widget/Login/bc_login_model.dart';
// import 'package:flutter_lvyindemo/widget/HomePage/vc/home_content.dart';
// import 'package:flutter_lvyindemo/vendor/BaseView/BCBaseAppBar.dart';

class BCLogin extends StatefulWidget {
  const BCLogin({Key key}) : super(key: key);

  @override
  _BCLogin createState() => _BCLogin();
}

class _BCLogin extends State<BCLogin> {
  //0:个人用户登录 1:单位用户登录
  int selecttype = 0;
  //是否选择同意了协议
  bool isselectxy = false;
  //是否隐藏密码
  bool issecretpw = true;
  //验证码图片记录
  int _yzmindex = 0;
  //是否达到了可以点击登录的条件
  bool isdataTrueLogin = false;

  TextEditingController accountController =
      new TextEditingController(); //声明controller
  TextEditingController passwordController =
      new TextEditingController(); //声明controller
  TextEditingController codeController =
      new TextEditingController(); //声明controller

  @override
  Widget build(BuildContext context) {
    void checkdataOk() {
      if ((accountController.text != null || accountController.text != '') &&
          (passwordController.text.length >= 6) &&
          (codeController.text.length >= 4)) {
        setState(() {
          isdataTrueLogin = true;
        });
      } else {
        setState(() {
          isdataTrueLogin = false;
        });
      }
    }

    return Scaffold(
      appBar: null,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            child: Image(image: AssetImage('images/login/denglu_bg.png')),
            height: 332,
          ),
          SafeArea(
              child: Stack(
            textDirection: TextDirection.ltr,
            fit: StackFit.loose,
            clipBehavior: Clip.hardEdge,
            children: <Widget>[
              ListView(
                children: [
                  //logo
                  SizedBox(
                    height: 51,
                  ),
                  Container(
                    height: 64,
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('images/login/logo_1.png'),
                      radius: 32,
                    ),
                  ),

                  //切换按钮
                  SizedBox(
                    height: 41,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildTitleTextButton('个人用户登录', selecttype == 0, () {
                        setState(() {
                          selecttype = 0;
                        });
                        print('个人用户登录点击');
                      }),
                      Container(
                        width: 1,
                        height: 17,
                        color: Color(0xffB9BECC),
                      ),
                      buildTitleTextButton('单位用户登录', selecttype == 1, () {
                        setState(() {
                          selecttype = 1;
                        });
                        print('单位用户登录点击');
                      }),
                    ],
                  ),

                  //中央区
                  SizedBox(
                    height: 20,
                  ),
                  //账号
                  Container(
                    height: 78,
                    padding: EdgeInsets.fromLTRB(37, 8, 37, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          '账号',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xff333336)),
                        ),
                        TextField(
                          onChanged: (text) {
                            checkdataOk();
                          },
                          controller: accountController,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xff333336)),
                          decoration: InputDecoration(
                            hintText: '请输入您的账号',
                            hintStyle: TextStyle(
                              fontSize: 12,
                              color: Color(0xffB9BECC),
                            ),
                            enabledBorder: new UnderlineInputBorder(
                              // 不是焦点的时候颜色
                              borderSide: BorderSide(color: Color(0x19000000)),
                            ),
                            focusedBorder: new UnderlineInputBorder(
                              // 焦点集中的时候颜色
                              borderSide: BorderSide(color: Color(0x19000000)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //密码
                  Container(
                    height: 78,
                    padding: EdgeInsets.fromLTRB(37, 8, 37, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          '密码',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xff333336)),
                        ),
                        TextField(
                          onChanged: (text) {
                            checkdataOk();
                          },
                          controller: passwordController,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xff333336)),
                          decoration: InputDecoration(
                            hintText: '请输入您的密码',
                            hintStyle: TextStyle(
                              fontSize: 12,
                              color: Color(0xffB9BECC),
                            ),
                            enabledBorder: new UnderlineInputBorder(
                              // 不是焦点的时候颜色
                              borderSide: BorderSide(color: Color(0x19000000)),
                            ),
                            focusedBorder: new UnderlineInputBorder(
                              // 焦点集中的时候颜色
                              borderSide: BorderSide(color: Color(0x19000000)),
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  issecretpw = !issecretpw;
                                });
                              },
                              child: Image(
                                image: AssetImage(
                                  issecretpw
                                      ? 'images/login/denglu_mima_bukejian.png'
                                      : 'images/login/denglu_mima_kejian.png', // myIcon is a 48px-wide widget.
                                ),
                              ),
                            ),
                            suffixIconConstraints: BoxConstraints(
                              minHeight: 32,
                              minWidth: 32,
                            ),
                          ),
                          obscureText: issecretpw,
                        ),
                      ],
                    ),
                  ),

                  //图形验证
                  Container(
                    height: 78,
                    padding: EdgeInsets.fromLTRB(37, 8, 37, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          '图形验证',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xff333336)),
                        ),
                        TextField(
                          onChanged: (text) {
                            checkdataOk();
                          },
                          controller: codeController,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xff333336)),
                          decoration: InputDecoration(
                            hintText: '请输入您的密码',
                            hintStyle: TextStyle(
                              fontSize: 12,
                              color: Color(0xffB9BECC),
                            ),
                            enabledBorder: new UnderlineInputBorder(
                              // 不是焦点的时候颜色
                              borderSide: BorderSide(color: Color(0x19000000)),
                            ),
                            focusedBorder: new UnderlineInputBorder(
                              // 焦点集中的时候颜色
                              borderSide: BorderSide(color: Color(0x19000000)),
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _yzmindex++;
                                });
                              },
                              child: Image(
                                image: NetworkImage(
                                  '${HTTPConfig.baseURL}/captcha?' +
                                      _yzmindex.toString(),
                                ),
                                fit: BoxFit.cover,
                                width: 76,
                                height: 24,
                              ),
                            ),
                            suffixIconConstraints: BoxConstraints(
                              minHeight: 24,
                              minWidth: 76,
                            ),
                          ),
                          obscureText: issecretpw,
                        ),
                      ],
                    ),
                  ),

                  //忘记密码
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 35,
                    padding: EdgeInsets.fromLTRB(37, 0, 37, 0),
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        print('忘记密码点击');
                      },
                      child: Text(
                        '忘记密码',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff99999C),
                        ),
                      ),
                    ),
                  ),

                  //登录按钮
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 44,
                    padding: EdgeInsets.only(left: 37, right: 37),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: TextButton(
                        onPressed: isdataTrueLogin
                            ? () {
                                print('登录点击');
                                postLogin();
                              }
                            : null,
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith((state) {
                            return isdataTrueLogin
                                ? Color(0xff049875)
                                : Color(0xff99999C);
                          }),
                        ),
                        child: Text(
                          '登录',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),

                  //协议富文本
                  SizedBox(
                    height: 21,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Image(
                            image: AssetImage(
                              isselectxy
                                  ? 'images/login/icon_fuxuan_1.png'
                                  : 'images/login/icon_fuxuan.png',
                            ),
                            width: 16,
                            height: 16,
                          ),
                          onPressed: () {
                            setState(() {
                              isselectxy = !isselectxy;
                            });
                          },
                        ),
                        Expanded(
                          child: Text.rich(
                            TextSpan(
                                text: '已阅读并同意以下协议：',
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xff333336)),
                                children: [
                                  TextSpan(
                                    text: '《用户协议》',
                                    style: TextStyle(
                                        fontSize: 12, color: Color(0xff049875)),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        print('用户协议点击');
                                      },
                                  ),
                                  TextSpan(
                                    text: '《隐私政策》',
                                    style: TextStyle(
                                        fontSize: 12, color: Color(0xff049875)),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        print('隐私政策点击');
                                      },
                                  ),
                                ]),
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                child: Container(
                  padding: EdgeInsets.only(right: 16),
                  height: 55,
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    style: ButtonStyle(
                      //设置边框
                      side: MaterialStateProperty.all(
                          BorderSide(color: Color(0xff049875), width: 1)),
                      //外边框装饰 会覆盖 side 配置的样式
                      // shape: MaterialStateProperty.all(StadiumBorder()),
                      //设置按钮的大小
                      minimumSize: MaterialStateProperty.all(Size(75, 32)),
                    ),
                    child: Text(
                      '回到首页',
                      style: TextStyle(
                        color: Color(0xff049875),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }

  //登录
  void postLogin() async {
    String user_name = accountController.text;
    String password = passwordController.text;
    String code = codeController.text;
    //type 1个人 2单位
    var url = '${HTTPConfig.baseURL}/login';
    BCHttpRequest.request(url,
            params: {
              'device_type': '2',
              'user_name': user_name,
              'pwd': password,
              'code': code,
              'type': selecttype == 0 ? '1' : '2'
            },
            method: 'post',
            isShowHub: true)
        .then((res) {
      //登录只需要记录一个token
      BCLoginModel loginModel = BCLoginModel.fromJson(res['data']);
      MobilePreferences().setToken(loginModel.token);
      MobilePreferences().setUserName(loginModel.user_name);
      if (loginModel.account_type == 'company') {
        //200
        MobilePreferences().setUserType('200');
      } else {
        //100
        MobilePreferences().setUserType('100');
      }
      Navigator.pop(context);
      //用户类型
//100：个人
//200：公司
// 个人在公司的权限根据角色区分：
//0：  没有任何权限
//1：  系统管理员-拥有所有权限
//2：  超级管理员-拥有除了权限账号设置之外所有权限
//3：  办公操作员-拥有除了权限账号设置之外的，所有办公，及办公辅助的权限
//4：  生产操作员-拥有单位生产版块的所有权限
    }).catchError((error) {});
  }

  Padding buildTitleTextButton(
      String title, bool isselet, Function clickmethod) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: TextButton(
        // style: ButtonStyle(
        // foregroundColor: MaterialStateProperty.resolveWith(
        //   (states) {
        //     if (states.contains(MaterialState.focused) &&
        //         !states.contains(MaterialState.pressed)) {
        //       //获取焦点时的颜色
        //       return Color(0xff333336);
        //     } else if (states.contains(MaterialState.pressed)) {
        //       //按下时的颜色
        //       return Color(0xff333336);
        //     }
        //     //默认状态使用灰色
        //     return Color(0xffB9BECC);
        //   },
        // ),
        // ),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: isselet ? Color(0xff333336) : Color(0xffB9BECC),
          ),
        ),
        onPressed: clickmethod,
      ),
    );
  }
}
