import 'dart:convert';
import 'dart:developer';

//增加了判空处理的model
void tryCatch(Function f) {
  try {
    f?.call();
  } catch (e, stack) {
    log('$e');
    log('$stack');
  }
}

class FFConvert {
  FFConvert._();

  static T Function<T>(dynamic value) convert = <T>(dynamic value) {
    if (value == null) {
      return null;
    }
    return json.decode(value.toString()) as T;
  };
}

T asT<T>(dynamic value, [T defaultValue]) {
  if (value is T) {
    return value;
  }
  try {
    if (value != null) {
      final String valueS = value.toString();
      if ('' is T) {
        return valueS as T;
      } else if (0 is T) {
        return int.parse(valueS) as T;
      } else if (0.0 is T) {
        return double.parse(valueS) as T;
      } else if (false is T) {
        if (valueS == '0' || valueS == '1') {
          return (valueS == '1') as T;
        }
        return (valueS == 'true') as T;
      } else {
        return FFConvert.convert<T>(value);
      }
    }
  } catch (e, stackTrace) {
    log('asT<$T>', error: e, stackTrace: stackTrace);
    return defaultValue;
  }

  return defaultValue;
}

class HDhomehbmodel {
  HDhomehbmodel({
    this.id,
    this.company_id,
    this.title,
    this.category,
    this.turn_num,
    this.province_name,
    this.city_name,
    this.area_name,
    this.address,
    this.turn_time,
    this.show_time_start,
    this.show_time_end,
    this.content,
    this.status,
    this.project_id,
    this.project_name,
    this.company,
    this.resource_ids,
    this.past_time,
    this.user_id,
    this.create_time,
    this.update_time,
    this.category_name,
    this.examine_reason,
  });

  factory HDhomehbmodel.fromJson(Map<String, dynamic> jsonRes) =>
      jsonRes == null
          ? null
          : HDhomehbmodel(
              id: asT<int>(jsonRes['id']),
              company_id: asT<int>(jsonRes['company_id']),
              title: asT<String>(jsonRes['title']),
              category: asT<int>(jsonRes['category']),
              turn_num: asT<String>(jsonRes['turn_num']),
              province_name: asT<String>(jsonRes['province_name']),
              city_name: asT<String>(jsonRes['city_name']),
              area_name: asT<String>(jsonRes['area_name']),
              address: asT<String>(jsonRes['address']),
              turn_time: asT<String>(jsonRes['turn_time']),
              show_time_start: asT<Object>(jsonRes['show_time_start']),
              show_time_end: asT<Object>(jsonRes['show_time_end']),
              content: asT<String>(jsonRes['content']),
              status: asT<int>(jsonRes['status']),
              project_id: asT<Object>(jsonRes['project_id']),
              project_name: asT<String>(jsonRes['project_name']),
              company: asT<String>(jsonRes['company']),
              resource_ids: asT<String>(jsonRes['resource_ids']),
              past_time: asT<String>(jsonRes['past_time']),
              user_id: asT<int>(jsonRes['user_id']),
              create_time: asT<String>(jsonRes['create_time']),
              update_time: asT<int>(jsonRes['update_time']),
              category_name: asT<String>(jsonRes['category_name']),
              examine_reason: asT<Object>(jsonRes['examine_reason']),
            );

  int id;
  int company_id;
  String title;
  int category;
  String turn_num;
  String province_name;
  String city_name;
  String area_name;
  String address;
  String turn_time;
  Object show_time_start;
  Object show_time_end;
  String content;
  int status;
  Object project_id;
  String project_name;
  String company;
  String resource_ids;
  String past_time;
  int user_id;
  String create_time;
  int update_time;
  String category_name;
  Object examine_reason;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'company_id': company_id,
        'title': title,
        'category': category,
        'turn_num': turn_num,
        'province_name': province_name,
        'city_name': city_name,
        'area_name': area_name,
        'address': address,
        'turn_time': turn_time,
        'show_time_start': show_time_start,
        'show_time_end': show_time_end,
        'content': content,
        'status': status,
        'project_id': project_id,
        'project_name': project_name,
        'company': company,
        'resource_ids': resource_ids,
        'past_time': past_time,
        'user_id': user_id,
        'create_time': create_time,
        'update_time': update_time,
        'category_name': category_name,
        'examine_reason': examine_reason,
      };

  HDhomehbmodel clone() => HDhomehbmodel.fromJson(
      asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this))));
}
