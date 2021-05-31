import 'dart:convert';

import 'hd_homehb_model.dart';

class BChomepoliciemodel {
  BChomepoliciemodel({
    this.category_id,
    this.cate_name,
    this.data,
  });

  factory BChomepoliciemodel.fromJson(Map<String, dynamic> jsonRes) {
    if (jsonRes == null) {
      return null;
    }

    final List<HDPoliceModel> data =
        jsonRes['data'] is List ? <HDPoliceModel>[] : null;
    if (data != null) {
      for (final dynamic item in jsonRes['data']) {
        if (item != null) {
          data.add(HDPoliceModel.fromJson(asT<Map<String, dynamic>>(item)));
        }
      }
    }
    return BChomepoliciemodel(
      category_id: asT<int>(jsonRes['category_id']),
      cate_name: asT<String>(jsonRes['cate_name']),
      data: data,
    );
  }

  int category_id;
  String cate_name;
  List<HDPoliceModel> data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'category_id': category_id,
        'cate_name': cate_name,
        'data': data,
      };

  BChomepoliciemodel clone() => BChomepoliciemodel.fromJson(
      asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this))));
}

class HDPoliceModel {
  HDPoliceModel({
    this.rule_id,
    this.title,
    this.create_time,
    this.publish_time,
  });

  factory HDPoliceModel.fromJson(Map<String, dynamic> jsonRes) =>
      jsonRes == null
          ? null
          : HDPoliceModel(
              rule_id: asT<int>(jsonRes['rule_id']),
              title: asT<String>(jsonRes['title']),
              create_time: asT<String>(jsonRes['create_time']),
              publish_time: asT<String>(jsonRes['publish_time']),
            );

  int rule_id;
  String title;
  String create_time;
  String publish_time;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'rule_id': rule_id,
        'title': title,
        'create_time': create_time,
        'publish_time': publish_time,
      };

  HDPoliceModel clone() => HDPoliceModel.fromJson(
      asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this))));
}
