import 'package:json_annotation/json_annotation.dart';

part 'hd_homenews_model.g.dart';

@JsonSerializable()
class HDhomenewmodel {
  int news_id;
  int company_id;
  int author_id;
  int author_type;
  String news_title;
  int news_cateid;
  String news_img;
  String news_content;
  int news_status;
  int is_top;
  int is_upper;
  int past_time;
  int news_sort;
  String news_enclosure;
  String info;
  int user_id;
  String province_name;
  String city_name;
  String area_name;
  String address;
  String create_time;


  HDhomenewmodel(
      {this.news_id,
      this.company_id,
      this.author_id,
      this.author_type,
      this.news_title,
      this.news_cateid,
      this.news_img,
      this.news_content,
      this.news_status,
      this.is_top,
      this.is_upper,
      this.past_time,
      this.news_sort,
      this.news_enclosure,
      this.info,
      this.user_id,
      this.province_name,
      this.city_name,
      this.area_name,
      this.address,
      this.create_time,
      });

  factory HDhomenewmodel.fromJson(Map<String, dynamic> json) =>
      _$HDhomenewmodelFromJson(json);
  Map<String, dynamic> toJson() => _$HDhomenewmodelToJson(this);
}
