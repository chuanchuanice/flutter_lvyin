/**https://javiercbk.github.io/json_to_dart/  一个快速转化的网站*/

class HDbrowsepicmodel {
  int adId;
  String adName;
  int adType;
  String adTitle;
  String adDesc;
  String adTitleUrl;
  int adStartTime;
  int adEndTime;
  int adPriority;
  int adPosition;
  int adClickNum;
  int createTime;
  String endTime;
  String deleteTime;
  int updateTime;
  String adPreviewImage;
  String isStop;
  int adDumpType;
  String adPreviewImageApp;
  String createTimeString;

  HDbrowsepicmodel(
      {this.adId,
      this.adName,
      this.adType,
      this.adTitle,
      this.adDesc,
      this.adTitleUrl,
      this.adStartTime,
      this.adEndTime,
      this.adPriority,
      this.adPosition,
      this.adClickNum,
      this.createTime,
      this.endTime,
      this.deleteTime,
      this.updateTime,
      this.adPreviewImage,
      this.isStop,
      this.adDumpType,
      this.adPreviewImageApp,
      this.createTimeString});

  HDbrowsepicmodel.fromJson(Map<String, dynamic> json) {
    adId = json['ad_id'];
    adName = json['ad_name'];
    adType = json['ad_type'];
    adTitle = json['ad_title'];
    adDesc = json['ad_desc'];
    adTitleUrl = json['ad_title_url'];
    adStartTime = json['ad_start_time'];
    adEndTime = json['ad_end_time'];
    adPriority = json['ad_priority'];
    adPosition = json['ad_position'];
    adClickNum = json['ad_click_num'];
    createTime = json['create_time'];
    endTime = json['end_time'];
    deleteTime = json['delete_time'];
    updateTime = json['update_time'];
    adPreviewImage = json['ad_preview_image'];
    isStop = json['is_stop'];
    adDumpType = json['ad_dump_type'];
    adPreviewImageApp = json['ad_preview_image_app'];
    createTimeString = json['create_time_string'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ad_id'] = this.adId;
    data['ad_name'] = this.adName;
    data['ad_type'] = this.adType;
    data['ad_title'] = this.adTitle;
    data['ad_desc'] = this.adDesc;
    data['ad_title_url'] = this.adTitleUrl;
    data['ad_start_time'] = this.adStartTime;
    data['ad_end_time'] = this.adEndTime;
    data['ad_priority'] = this.adPriority;
    data['ad_position'] = this.adPosition;
    data['ad_click_num'] = this.adClickNum;
    data['create_time'] = this.createTime;
    data['end_time'] = this.endTime;
    data['delete_time'] = this.deleteTime;
    data['update_time'] = this.updateTime;
    data['ad_preview_image'] = this.adPreviewImage;
    data['is_stop'] = this.isStop;
    data['ad_dump_type'] = this.adDumpType;
    data['ad_preview_image_app'] = this.adPreviewImageApp;
    data['create_time_string'] = this.createTimeString;
    return data;
  }
}
