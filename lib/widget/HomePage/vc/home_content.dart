import 'package:flutter/material.dart';
import 'package:flutter_lvyindemo/vendor/BaseView/BCBaseAppBar.dart';
import 'package:flutter_lvyindemo/vendor/WebHTTP/http_config.dart';
import 'package:flutter_lvyindemo/vendor/WebHTTP/http_request.dart';
import 'package:flutter_lvyindemo/widget/HomePage/model/hd_homehb_model.dart';
import 'package:flutter_lvyindemo/widget/HomePage/model/hd_homenews_model.dart';
import 'package:flutter_lvyindemo/widget/HomePage/model/hd_homepolicie_model.dart';

import 'package:flutter_lvyindemo/widget/HomePage/model/hdbrowsepicmodel.dart';

import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  List<HDbrowsepicmodel> arrOfbanner = [];
  List<HDhomenewmodel> arrOfNews = [];
  List<HDhomehbmodel> arrOfHB = [];
  List<HDhomehbmodel> arrOfPublicity = [];
  List<BChomepoliciemodel> arrOfPolicie = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBannerData();
    getNewsData();
    getHBData();
    getPublicityData();
    getPolicieData();

    _policcontentcontroller.addListener(() {
      //更新状态
      setState(() {
        _incrementCounter(_policcontentcontroller.offset);
      });
    });
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
          SizedBox(
            height: 10,
          ),
          buildPublicityTabel(),
          SizedBox(
            height: 10,
          ),
          buildPoliciesTabel(),
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
                                              color: Color(0xff333336),
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
                                                fontSize: 12,
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
              padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: arrOfHB.map((e) => buildhbinfocell(e)).toList(),
              ),
            ),
          ],
        ));
  }

  //信息公示
  Widget buildPublicityTabel() {
    return Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildSectionTitleRow(() {
              print('信息公示更多点击');
            }, "信息公示"),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children:
                    arrOfPublicity.map((e) => buildhbinfocell(e)).toList(),
              ),
            ),
          ],
        ));
  }

  //环保+信息的cell
  Container buildhbinfocell(HDhomehbmodel e) {
    return Container(
      height: 80,
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Color(0xfff5f5f6),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(11, 0, 11, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Image(image: AssetImage('images/home/xiangmu.png')),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      e.title,
                      maxLines: 1,
                      style: TextStyle(color: Color(0xff333336), fontSize: 14),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Image(image: AssetImage('images/home/shijian.png')),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      e.turn_time,
                      maxLines: 1,
                      style: TextStyle(color: Color(0xff333336), fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //信息公示
  Widget buildPoliciesTabel() {
    return Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildSectionTitleRow(() {
              print('资料中心更多点击');
            }, "资料中心"),
            buildhbpoliciescell(),
          ],
        ));
  }

  ScrollController _policcontentcontroller = ScrollController();
  ScrollController _policiestagcontroller =
      ScrollController(initialScrollOffset: 40);
  //政策法规cell（资料中心）
  Column buildhbpoliciescell() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 208,
          child: ListView.builder(
            controller: _policcontentcontroller,
            padding: const EdgeInsets.only(left: 10, right: 10),
            scrollDirection: Axis.horizontal,
            itemCount: arrOfPolicie.length,
            itemExtent: 166,
            itemBuilder: (BuildContext context, int section) {
              List picarr = [
                'images/home/zhengce_fagui.png',
                'images/home/zhengce_falv.png',
                'images/home/zhengce_fagui.png',
                'images/home/zhengce_fagui.png',
                'images/home/zhengce_fagui.png',
              ];

              return Padding(
                padding: const EdgeInsets.only(left: 6, right: 6),
                child: Container(
                  width: 166,
                  height: 208,
                  decoration: BoxDecoration(
                    color: Color(0xfff5f5f6),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  //每个item的内容
                  child: Column(
                    children: [
                      //头
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.fromLTRB(14, 16, 6, 10),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 24,
                              child: Image(
                                image: AssetImage(
                                  picarr[section],
                                ),
                                width: 24,
                                height: 24,
                              ),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Expanded(
                              flex: 75,
                              child: Text(
                                arrOfPolicie[section].cate_name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              flex: 50,
                              child: GestureDetector(
                                child: Row(
                                  children: [
                                    Text(
                                      '更多',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff666669),
                                      ),
                                    ),
                                    Image(
                                      image: AssetImage(
                                        'images/home/icon_jiantou.png',
                                      ),
                                      width: 16,
                                      height: 16,
                                    )
                                  ],
                                ),
                                onTap: () {
                                  print('点击了更多$section');
                                },
                              ),
                            ),
                          ],
                        ),
                      ),

                      //内容
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: arrOfPolicie[section]
                            .data
                            .sublist(0, 4)
                            .map((e) => GestureDetector(
                                  onTap: () {
                                    print('点击了section内容中的内容');
                                  },
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(16, 8, 10, 8),
                                    child: Text(
                                      e.title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff333333),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: 36,
          child: Container(
            width: 60,
            height: 8,
            decoration: BoxDecoration(
              color: Color(0xfff5f5f6),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: ListView(
              //该属性禁止用户滚动new ClampingScrollPhysics(),NeverScrollableScrollPhysics(),
              // physics: NeverScrollableScrollPhysics(),
              controller: _policiestagcontroller,
              scrollDirection: Axis.horizontal,
              //false，如果内容不足，则用户无法滚动 而如果[primary]为true，它们总是可以尝试滚动。
              // primary: true,
              children: [
                SizedBox(
                  width: 40,
                ),
                Container(
                  width: 20,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Color(0xff049875),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // 40-0
  void _incrementCounter(
    double offset,
  ) {
    double width = 910 - MediaQuery.of(context).size.width;
    double needoffset = (1 - offset / width) * 40.0;
    _policiestagcontroller.animateTo(needoffset,
        duration: new Duration(microseconds: 1), curve: new ElasticOutCurve());
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

  //请求环保公示数据
  void getHBData() async {
    var url = '${HTTPConfig.baseURL}/getPublicityListHome';
    BCHttpRequest.request(url,
            params: {'limit': '5', 'page': '1', 'type': '2'},
            method: 'get',
            isShowHub: true)
        .then((res) {
      List datalist = res['data']['data'];
      arrOfHB = datalist.map((e) => HDhomehbmodel.fromJson(e)).toList();
      this.mounted ? setState(() {}) : null;
    }).catchError((error) {});
  }

  //请求信息公示数据
  void getPublicityData() async {
    var url = '${HTTPConfig.baseURL}/getPublicityListHome';
    BCHttpRequest.request(url,
            params: {'limit': '5', 'page': '1', 'type': '1'},
            method: 'get',
            isShowHub: true)
        .then((res) {
      List datalist = res['data']['data'];
      arrOfPublicity = datalist.map((e) => HDhomehbmodel.fromJson(e)).toList();
      this.mounted ? setState(() {}) : null;
    }).catchError((error) {});
  }

  //请求政策法规数组（资料中心）
  void getPolicieData() async {
    var url = '${HTTPConfig.baseURL}/rule_app';
    BCHttpRequest.request(url, method: 'get', isShowHub: true).then((res) {
      List datalist = res['data'];
      arrOfPolicie =
          datalist.map((e) => BChomepoliciemodel.fromJson(e)).toList();
      this.mounted ? setState(() {}) : null;
    }).catchError((error) {});
  }
}
