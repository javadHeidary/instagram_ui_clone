import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:instagram_ui_one/data/constant/constants.dart';
import 'package:gap/gap.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColorB,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 20, right: 15, left: 15, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Post',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'GB',
                                color: whiteColor,
                              ),
                            ),
                            Gap(15),
                            Image.asset(
                              'images/icon_arrow_down.png',
                              color: whiteColor,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Next',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'GB',
                                color: whiteColor,
                              ),
                            ),
                            Gap(15),
                            Image.asset('images/icon_arrow_right_box.png'),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  sliver: SliverToBoxAdapter(
                    child: Container(
                      width: 394,
                      height: 370,
                      child: Image(
                        image: AssetImage('images/picBig.png'),
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(
                    right: 15,
                    left: 15,
                  ),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => Container(
                        width: 128,
                        height: 128,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: Image(
                          image: AssetImage('images/pic$index.png'),
                        ),
                      ),
                      childCount: 9,
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 8,
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(bottom: 100),
                ),
              ],
            ),
            Container(
              width: 428,
              height: 83,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                color: Color(0xff272B40),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Draft',
                          style: TextStyle(
                              color: pinkColor, fontSize: 16, fontFamily: 'GB'),
                        ),
                        Text(
                          'Gallary',
                          style: TextStyle(
                              color: whiteColor,
                              fontSize: 16,
                              fontFamily: 'GB'),
                        ),
                        Text(
                          'Take',
                          style: TextStyle(
                              color: whiteColor,
                              fontSize: 16,
                              fontFamily: 'GB'),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 134,
                    height: 5,
                    margin: EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      color: Color(0xff555555),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
