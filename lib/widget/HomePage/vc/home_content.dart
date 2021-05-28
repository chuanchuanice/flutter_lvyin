import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_lvyindemo/vendor/BaseView/BCBaseAppBar.dart';
import 'package:flutter_lvyindemo/vendor/WebHTTP/http_config.dart';
import 'package:flutter_lvyindemo/vendor/WebHTTP/http_request.dart';
import 'package:flutter_lvyindemo/widget/HomePage/model/hd_homenews_model.dart';

import 'package:flutter_lvyindemo/widget/HomePage/model/hdbrowsepicmodel.dart';
import 'package:flutter_lvyindemo/widget/HomePage/view/IconTextButton.dart';

import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  List<HDbrowsepicmodel> arrOfbanner = [];
  List<HDhomenewmodel> arrOfNews = [];
  List arrOfHB = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBannerData();
    getNewsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BCBaseAppBar()
          .mybarbuild(BCBaseAppBarType.BCBaseAppBarTypeHome, context),
      backgroundColor: Color(0xfff5f5f6),
      body: ListView(
        children: [
          buildSwiper(),
          SizedBox(
            height: 10,
          ),
          buildNewsTabe(),
          SizedBox(
            height: 10,
          ),
          buildHuanbaoTabel(),
        ],
      ),
    );
  }

  //轮播图UI
  Widget buildSwiper() {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 10, 16, 16),
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: 200.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Swiper(
          itemBuilder: _swiperBuilder,
          itemCount: arrOfbanner.length,
          pagination: SwiperPagination(
              builder: DotSwiperPaginationBuilder(
            color: Color(0xb3858585),
            activeColor: Color(0xff049875),
          )),
          // control: SwiperControl(),
          scrollDirection: Axis.horizontal,
          autoplay: true,
          onTap: (index) => print('点击了第$index个'),
          loop: true,
        ),
      ),
    );
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    return Container(
      child: (Image.network(
        arrOfbanner[index].adPreviewImage,
        fit: BoxFit.cover,
      )),
    );
  }

  //新闻UI
  Widget buildNewsTabe() {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildSectionTitleRow(() {
            print('新闻更多点击');
          }, "新闻"),
          Container(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Container(
              child: Column(
                children: arrOfNews
                    .map((e) => Container(
                          height: 104,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 14),
                                child: Row(
                                  //标题+说明+图
                                  children: [
                                    Expanded(
                                      flex: 219,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            e.news_title,
                                            maxLines: 1,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(right: 16),
                                            child: Text(
                                              e.info,
                                              maxLines: 2,
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff666669),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 100,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image(
                                          image: e.news_img == null ||
                                                  e.news_img == ''
                                              ? AssetImage('images/expic.png')
                                              : NetworkImage(
                                                  e.news_img,
                                                ),
                                          width: 100,
                                          height: 76,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Divider(
                                color: Color(0xffffeeeef1),
                                height: 1,
                              ),
                            ],
                          ),
                        ))
                    .toList(),
              ),
            ),
          )
        ],
      ),
    );
  }

  //环保验收公示
  Widget buildHuanbaoTabel() {
    return Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildSectionTitleRow(() {
              print('环保验收公示更多点击');
            }, "环保验收公示"),
            Container(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: arrOfHB.map((e) => 
                Container(
                  
                )).toList(),
            ),
            ),

          ],
        ));
  }

  //创建sectionTitle
  Widget buildSectionTitleRow(Function() moreaction, String titleStr) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                color: Color(0xff049875),
                width: 1,
                height: 16,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                titleStr,
                style: TextStyle(
                  color: Color(0xff333336),
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          FlatButton(
              onPressed: moreaction,
              child: Row(
                children: [
                  Text(
                    '更多',
                    style: TextStyle(
                      color: Color(0xff99999c),
                      fontSize: 14,
                    ),
                  ),
                  Image.asset('images/home/icon_jiantou.png'),
                ],
              ))
        ],
      ),
    );
  }

  //请求轮播图数据
  void getBannerData() async {
    var url = '${HTTPConfig.baseURL}/getBannerList';
    BCHttpRequest.request(url, method: 'get', isShowHub: true).then((res) {
      List datalist = res['data'];
      arrOfbanner = datalist.map((e) => HDbrowsepicmodel.fromJson(e)).toList();
      if (this.mounted) {
        /** 判断一下内存是否泄露 再刷新build*/
        setState(() {});
      }
    }).catchError((error) {});
  }

  //请求新闻数据
  void getNewsData() async {
    var url = '${HTTPConfig.baseURL}/getNewsListHome';
    BCHttpRequest.request(url,
            params: {'limit': '5', 'page': '1'}, method: 'get', isShowHub: true)
        .then((res) {
      List datalist = res['data']['data'];
      arrOfNews = datalist.map((e) => HDhomenewmodel.fromJson(e)).toList();
      this.mounted ? setState(() {}) : null;
    }).catchError((error) {});
  }
}
