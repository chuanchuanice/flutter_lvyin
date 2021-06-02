import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MobilePreferences {
  String token;
  String usertype;
  String username;

  MobilePreferences bcbuild() {
    MobilePreferences myclassmodel = MobilePreferences();
    myclassmodel.getToken().then((value) => {myclassmodel.token = value});
    myclassmodel.getUserName().then((value) => {myclassmodel.username = value});
    myclassmodel.getUserType().then((value) => {myclassmodel.usertype = value});

    return myclassmodel;
  }
  // MobilePreferences(this.token, this.usertype, this.username);

  setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
    UserNotifierSingleton().bcuserNotifier.setToken(token);
  }

  Future<String> getToken() async {
    var token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    return token;
  }

  removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token'); //删除指定键
    prefs.clear(); //清空键值对
    UserNotifierSingleton().bcuserNotifier.setToken(null);
  }

//用户类型
//100：个人
//200：公司
// 个人在公司的权限根据角色区分：
//0：  没有任何权限
//1：  系统管理员-拥有所有权限
//2：  超级管理员-拥有除了权限账号设置之外所有权限
//3：  办公操作员-拥有除了权限账号设置之外的，所有办公，及办公辅助的权限
//4：  生产操作员-拥有单位生产版块的所有权限
  setUserType(String usertype) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('usertype', usertype);
    UserNotifierSingleton().bcuserNotifier.setUserType(usertype);
  }

  Future<String> getUserType() async {
    var token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('usertype');
    return token;
  }

  removeUserType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('usertype'); //删除指定键
    prefs.clear(); //清空键值对
    UserNotifierSingleton().bcuserNotifier.setUserType(null);
  }

  //个人名称/公司名称
  removeUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('username'); //删除指定键
    prefs.clear(); //清空键值对
    UserNotifierSingleton().bcuserNotifier.setUserName(null);
  }

  setUserName(String username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', username);
    UserNotifierSingleton().bcuserNotifier.setUserName(username);
  }

  Future<String> getUserName() async {
    var token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('username');
    return token;
  }
}

//单例
class UserNotifierSingleton {
  factory UserNotifierSingleton() => _getInstance();

  static UserNotifierSingleton get instance => _getInstance();

  static UserNotifierSingleton _instance;

  UserNotifierSingleton._internal();

  static UserNotifierSingleton _getInstance() {
    if (_instance == null) {
      _instance = UserNotifierSingleton._internal();
    }
    return _instance;
  }

  UserNotifier bcuserNotifier = UserNotifier(MobilePreferences().bcbuild());
}

//dic 的格式为{'token':token,'usertype':usertype,'username':username}
class UserNotifier extends ValueNotifier {
  UserNotifier(MobilePreferences dic) : super(dic);

  void setToken(String token) {
    ///赋值
    value.token = token;

    ///通知更新
    notifyListeners();
  }

  void setUserType(String usertype) {
    ///赋值
    value.usertype = usertype;

    ///通知更新
    notifyListeners();
  }

  void setUserName(String username) {
    ///赋值
    value.username = username;

    ///通知更新
    notifyListeners();
  }
}
