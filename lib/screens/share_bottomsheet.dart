import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:instagram_ui_one/data/constant/constants.dart';

class ShareBottonsheet extends StatelessWidget {
  const ShareBottonsheet({this.controller, super.key});
  final ScrollController? controller;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 40.0, sigmaY: 40.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: 300,
          color: Color.fromRGBO(255, 255, 255, 0.09),
          child: _getGridContent(context),
        ),
      ),
    );
  }

  Widget _getGridContent(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CustomScrollView(
          controller: controller,
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    height: 5,
                    width: 67,
                    margin: EdgeInsets.only(top: 10, bottom: 22),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Share',
                        style: TextStyle(
                            fontSize: 20, fontFamily: 'GB', color: whiteColor),
                      ),
                      Image.asset('images/icon_share_bottomsheet.png'),
                    ],
                  ),
                  Gap(25),
                  Container(
                    height: 46,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.5),
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Image.asset('images/icon_search.png'),
                          Gap(8),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search User',
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Gap(32),
                ],
              ),
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => _getItemGride(),
                  childCount: 30),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  mainAxisExtent: 110),
            ),
            SliverPadding(
              padding: EdgeInsets.only(bottom: 80),
            ),
          ],
        ),
        Positioned(
          bottom: 40,
          child: ElevatedButton(
            style: Theme.of(context).elevatedButtonTheme.style,
            onPressed: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 13, horizontal: 45),
              child: Text('Share'),
            ),
          ),
        ),
      ],
    );
  }

  Widget _getItemGride() {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            image: DecorationImage(
              image: AssetImage('images/profile.png'),
            ),
          ),
        ),
        Text(
          ' Amirahmad Adibi',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, fontFamily: 'GB', color: whiteColor),
        ),
      ],
    );
  }
}
