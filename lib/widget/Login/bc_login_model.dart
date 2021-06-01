import 'dart:convert';

import 'package:flutter_lvyindemo/widget/HomePage/model/hd_homehb_model.dart';

class BCLoginModel {
  BCLoginModel({
    this.user_id,
    this.token,
    this.user_name,
    this.head,
    this.is_init,
    this.account_type,
    this.person_id,
    this.company_id,
  });

  factory BCLoginModel.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
      ? null
      : BCLoginModel(
          user_id: asT<int>(jsonRes['user_id']),
          token: asT<String>(jsonRes['token']),
          user_name: asT<String>(jsonRes['user_name']),
          head: asT<String>(jsonRes['head']),
          is_init: asT<String>(jsonRes['is_init']),
          account_type: asT<String>(jsonRes['account_type']),
          person_id: asT<int>(jsonRes['person_id']),
          company_id: asT<int>(jsonRes['company_id']),
        );

  int user_id;
  String token;
  String user_name;
  String head;
  String is_init;
  String account_type;
  int person_id;
  int company_id;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'user_id': user_id,
        'token': token,
        'user_name': user_name,
        'head': head,
        'is_init': is_init,
        'account_type': account_type,
        'person_id': person_id,
        'company_id': company_id,
      };

  BCLoginModel clone() => BCLoginModel.fromJson(
      asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this))));
}
