// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hd_homenews_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HDhomenewmodel _$HDhomenewmodelFromJson(Map<String, dynamic> json) {
  return HDhomenewmodel(
    news_id: json['news_id'] as int,
    company_id: json['company_id'] as int,
    author_id: json['author_id'] as int,
    author_type: json['author_type'] as int,
    news_title: json['news_title'] as String,
    news_cateid: json['news_cateid'] as int,
    news_img: json['news_img'] as String,
    news_content: json['news_content'] as String,
    news_status: json['news_status'] as int,
    is_top: json['is_top'] as int,
    is_upper: json['is_upper'] as int,
    past_time: json['past_time'] as int,
    news_sort: json['news_sort'] as int,
    news_enclosure: json['news_enclosure'] as String,
    info: json['info'] as String,
    user_id: json['user_id'] as int,
    province_name: json['province_name'] as String,
    city_name: json['city_name'] as String,
    area_name: json['area_name'] as String,
    address: json['address'] as String,
    create_time: json['create_time'] as String,
  );
}

Map<String, dynamic> _$HDhomenewmodelToJson(HDhomenewmodel instance) =>
    <String, dynamic>{
      'news_id': instance.news_id,
      'company_id': instance.company_id,
      'author_id': instance.author_id,
      'author_type': instance.author_type,
      'news_title': instance.news_title,
      'news_cateid': instance.news_cateid,
      'news_img': instance.news_img,
      'news_content': instance.news_content,
      'news_status': instance.news_status,
      'is_top': instance.is_top,
      'is_upper': instance.is_upper,
      'past_time': instance.past_time,
      'news_sort': instance.news_sort,
      'news_enclosure': instance.news_enclosure,
      'info': instance.info,
      'user_id': instance.user_id,
      'province_name': instance.province_name,
      'city_name': instance.city_name,
      'area_name': instance.area_name,
      'address': instance.address,
      'create_time': instance.create_time,
    };
