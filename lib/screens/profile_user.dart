import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:instagram_ui_one/data/constant/constants.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProfileUser extends StatelessWidget {
  const ProfileUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColorB,
      body: Center(
        child: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder: (context, isScrill) {
              return [
                SliverAppBar(
                  surfaceTintColor: blackColorB,
                  toolbarHeight: 40,
                  actions: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 18,
                        right: 18,
                      ),
                      child: Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    )
                  ],
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(10),
                    child: Container(
                      height: 14,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15),
                        ),
                        color: blackColorB,
                      ),
                    ),
                  ),
                  backgroundColor: blackColorB,
                  expandedHeight: 170,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.asset(
                      'images/item1.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: _getHeaderProfile(),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 17, vertical: 12),
                  sliver: SliverToBoxAdapter(
                    child: Container(
                      height: 90,
                      child: Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return index == 0
                                ? _getAddStoryIcon()
                                : _getHightLight(index);
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  floating: true,
                  delegate: TabBarViewDelegate(
                    TabBar(
                      dividerColor: blackColorB,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorPadding: EdgeInsets.symmetric(
                        horizontal: 17,
                      ),
                      indicatorColor: pinkColor,
                      indicatorWeight: 3,
                      tabs: [
                        Tab(
                          icon: Image.asset(
                            'images/icon_tab_posts.png',
                            width: 20,
                            height: 20,
                          ),
                        ),
                        Tab(
                          icon: Image.asset(
                            'images/icon_save.png',
                            width: 17,
                            height: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: [
                CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 20),
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
                                      child:
                                          Image.asset('images/item$index.png'),
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
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(2, 2),
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(1, 1),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 20),
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
                                      child:
                                          Image.asset('images/item$index.png'),
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
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(2, 2),
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(1, 1),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _getHightLight(int index) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(right: 20),
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'images/cart${index + 1}.png',
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 20, top: 5),
          child: Text(
            'highlith',
            style: TextStyle(fontSize: 12, color: greyColor, fontFamily: 'GB'),
          ),
        )
      ],
    );
  }

  Widget _getHeaderProfile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 17, vertical: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  border: Border.all(color: pinkColor, width: 2),
                  borderRadius: BorderRadius.circular(17),
                ),
                child: Padding(
                  padding: EdgeInsets.all(2),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset('images/profile.png'),
                    ),
                  ),
                ),
              ),
              Gap(10),
              Container(
                height: 70,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'امیراحمد ادیبی',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'SM',
                          color: greyColor,
                        ),
                      ),
                      Gap(5),
                      Text(
                        'amirahmadAdibi',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'GB',
                          color: greyColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Spacer(),
              Image.asset('images/icon_profile_edit.png'),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 17),
          width: 200,
          child: Text(
            'برنامه نویس فلاتر و اندرویدو مدرس محبوب ترین دوره مکتب خونه و برنامه نویس سابق زرین پال',
            style: TextStyle(fontSize: 14, fontFamily: 'SM', color: whiteColor),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 17, vertical: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'images/icon_link.png',
              ),
              Gap(5),
              Text(
                'yek.link/Ahmirahmad',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'GB',
                  color: Color(0xff55B9F7),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 17,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'images/icon_bag.png',
              ),
              Gap(5),
              Text(
                'Developer',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'GB',
                  color: greyColor,
                ),
              ),
              Gap(30),
              Image.asset(
                'images/icon_location.png',
              ),
              Gap(5),
              Text(
                'IRAN',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'GB',
                  color: greyColor,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 17, vertical: 12),
          child: Row(
            children: [
              Text(
                '23',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'GB',
                  color: Colors.white,
                ),
              ),
              Gap(5),
              Text(
                'Post',
                style:
                    TextStyle(fontSize: 12, fontFamily: 'GM', color: greyColor),
              ),
              Gap(15),
              Text(
                '16.k',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'GB',
                  color: Colors.white,
                ),
              ),
              Gap(5),
              Text(
                'Folower',
                style:
                    TextStyle(fontSize: 12, fontFamily: 'GM', color: greyColor),
              ),
              Gap(15),
              Text(
                '280',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'GB',
                  color: Colors.white,
                ),
              ),
              Gap(5),
              Text(
                'Folowing',
                style:
                    TextStyle(fontSize: 12, fontFamily: 'GM', color: greyColor),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 17),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Follow',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              Gap(10),
              Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(
                        color: whiteColor,
                        width: 2,
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Massage',
                    style: TextStyle(
                        fontSize: 16, fontFamily: 'GB', color: whiteColor),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class TabBarViewDelegate extends SliverPersistentHeaderDelegate {
  TabBarViewDelegate(this._tabBar);
  final TabBar _tabBar;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return Container(
      color: blackColorB,
      child: _tabBar,
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  // TODO: implement minExtent
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return false;
  }
}

Widget _getAddStoryIcon() {
  return Container(
    margin: EdgeInsets.only(right: 20),
    child: Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            color: whiteColor,
          ),
          child: Padding(
            padding: EdgeInsets.all(2),
            child: Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    15,
                  ),
                  color: blackColorB),
              child: Image.asset('images/icon_plus.png'),
            ),
          ),
        ),
        Gap(4),
        Text(
          'your story',
          style: TextStyle(color: greyColor, fontFamily: 'GB', fontSize: 12),
        ),
      ],
    ),
  );
}
