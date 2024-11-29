import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:gap/gap.dart';
import 'package:instagram_ui_one/data/constant/constants.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:instagram_ui_one/screens/share_bottomsheet.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        surfaceTintColor: blackColorB,
        title: Container(
          width: 128,
          height: 20,
          child: Image.asset('images/moodinger_logo.png'),
        ),
        backgroundColor: blackColorB,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 18),
            child: Image.asset('images/icon_direct.png'),
          ),
        ],
      ),
      backgroundColor: blackColorB,
      body: SafeArea(        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _getStoryList(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Column(
                    children: [
                      _getHeaderPost(),
                      _getPostContent(context),
                    ],
                  );
                },
                childCount: 4,
              ),
            )
          ],
        ),
      ),
    );
  }

  // Widget _GetPostList() {
  //   return ListView.builder(
  //     itemCount: 10,
  //     shrinkWrap: true,
  //     physics: NeverScrollableScrollPhysics(),
  //     itemBuilder: (contex, index) {
  //       return _getPostFollowers();
  //     },
  //   );
  // }

  // Column _getPostFollowers() {
  //   return Column(
  //     children: [
  //       _getHeaderPost(),
  //       _getPostContent(),
  //     ],
  //   );
  // }

  Container _getStoryList() {
    return Container(
      height: 120,
      child: Expanded(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return index == 0 ? _getAddStoryIcon() : _iconFollowStoryList();
          },
        ),
      ),
    );
  }

  Column _getPostList(context) {
    return Column(
      children: [
        _getHeaderPost(),
        _getPostContent(context),
      ],
    );
  }

  Widget _getPostContent(context) {
    return Container(
      width: 394,
      height: 440,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            top: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              child: SizedBox(
                width: 360,
                height: 394,
                child: Image(
                  image: AssetImage('images/post_cover.png'),
                ),
              ),
            ),
          ),
          Positioned(
            right: 25,
            top: 35,
            child: Image.asset('images/icon_video.png'),
          ),
          Positioned(
            bottom: 30,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
                child: Container(
                  width: 320,
                  height: 46,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color.fromRGBO(255, 255, 255, 0.5),
                        Color.fromRGBO(255, 255, 255, 0.2)
                      ],
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 25,
                      ),
                      Row(
                        children: [
                          Image.asset('images/icon_hart.png'),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            '2.6k',
                            style: TextStyle(
                                fontFamily: 'GB',
                                fontSize: 14,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Row(
                        children: [
                          Image.asset('images/icon_comments.png'),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            '2.6k',
                            style: TextStyle(
                                fontFamily: 'GB',
                                fontSize: 14,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 35,
                      ),
                      GestureDetector(
                        onTap: () {
                          getShowBottom(context);
                        },
                        child: Image.asset(
                          'images/icon_share.png',
                        ),
                      ),
                      SizedBox(
                        width: 45,
                      ),
                      Image.asset('images/icon_save.png'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> getShowBottom(context) {
    return showModalBottomSheet(
      context: context,
      barrierColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext contex) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: DraggableScrollableSheet(
            initialChildSize: 0.4,
            maxChildSize: 0.7,
            minChildSize: 0.2,
            builder: (context, controller) {
              return ShareBottonsheet(
                controller: controller,
              );
            },
          ),
        );
      },
    );
  }

  Padding _getHeaderPost() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
      child: Row(
        children: [
          _iconFollowStory(),
          Padding(
            padding: EdgeInsets.only(left: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'AmirAhmadAdibi',
                  style: TextStyle(
                      fontSize: 12, fontFamily: 'GB', color: Colors.white),
                ),
                Text(
                  'امیراحمد ادیبی برنامه نویس موبایل',
                  style: TextStyle(
                      fontSize: 12, fontFamily: 'SM', color: Colors.white),
                ),
              ],
            ),
          ),
          Spacer(),
          Image.asset('images/icon_menu.png'),
        ],
      ),
    );
  }

  Widget _iconHeaderFollwerPost() {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(17),
      padding: EdgeInsets.all(4),
      color: pinkColor,
      strokeWidth: 2,
      dashPattern: [40, 10],
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          width: 38,
          height: 38,
          child: Image.asset('images/profile.png'),
        ),
      ),
    );
  }

  Widget _iconFollowStoryList() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        children: [
          Container(
            child: DottedBorder(
              borderType: BorderType.RRect,
              radius: Radius.circular(17),
              padding: EdgeInsets.all(4),
              color: pinkColor,
              strokeWidth: 2,
              dashPattern: [40, 0],
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  width: 58,
                  height: 58,
                  child: Image.asset('images/profile.png'),
                ),
              ),
            ),
          ),
          Gap(5),
          Text(
            'User',
            style: TextStyle(color: whiteColor),
          )
        ],
      ),
    );
  }

  Widget _getAddStoryIcon() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              color: whiteColor,
            ),
            child: Padding(
              padding: EdgeInsets.all(2),
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      15,
                    ),
                    color: blackColorB),
                child: Image.asset('images/icon_plus.png'),
              ),
            ),
          ),
          Gap(5),
          Text(
            'your story',
            style: TextStyle(color: whiteColor),
          ),
        ],
      ),
    );
  }

  Widget _iconFollowStory() {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(17),
      padding: EdgeInsets.all(4),
      color: pinkColor,
      strokeWidth: 2,
      dashPattern: [50, 0],
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        child: Container(
          height: 44,
          width: 44,
          child: Image.asset('images/profile.png'),
        ),
      ),
    );
  }
}
