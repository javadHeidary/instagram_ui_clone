import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:instagram_ui_one/data/constant/constants.dart';
import 'package:gap/gap.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColorB,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  _getSearchBox(),
                  _getStoryName(),
                ],
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                    (context, index) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Image.asset('images/item$index.png'),
                            ),
                          ),
                        ),
                    childCount: 10),
                gridDelegate: SliverQuiltedGridDelegate(
                  crossAxisCount: 3,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  repeatPattern: QuiltedGridRepeatPattern.inverted,
                  pattern: [
                    QuiltedGridTile(2, 1),
                    QuiltedGridTile(2, 2),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _getSearchBox() {
    return Column(
      children: [
        Container(
          height: 46,
          width: 390,
          margin: EdgeInsets.only(top: 12, right: 18, left: 18),
          decoration: BoxDecoration(
            color: Color(0xff272B40),
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
                      hintStyle: TextStyle(
                          fontSize: 15, fontFamily: 'GB', color: whiteColor),
                      hintText: 'Search User',
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                Image(
                  image: AssetImage('images/icon_scan.png'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Container _getStoryName() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20, right: 16),
      height: 25,
      child: Expanded(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(right: 10, left: 10),
              decoration: BoxDecoration(
                color: Color(0xff272B40),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 18),
                child: Text(
                  'AmirAhmad $index',
                  style: TextStyle(color: whiteColor),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
