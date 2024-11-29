import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:instagram_ui_one/data/constant/constants.dart';
import 'package:gap/gap.dart';
import 'package:instagram_ui_one/data/constant/model/activity_enum.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColorB,
      body: Column(
        children: [
          Container(
            height: 80,
            color: blackColorB,
            child: TabBar(
              padding: EdgeInsets.only(top: 25),
              controller: _tabController,
              labelStyle: TextStyle(fontSize: 18, fontFamily: 'GB'),
              indicatorColor: pinkColor,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
              indicatorWeight: 3,
              dividerColor: blackColorB,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Tab(
                  child: Text(
                    'Following',
                    style: TextStyle(color: whiteColor),
                  ),
                ),
                Tab(
                  child: Text(
                    'You',
                    style: TextStyle(color: whiteColor),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _getSimpleList(),

                /// For tab one
                _getSimpleList(),

                /// For tab two
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _getSimpleList() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(
              top: 30,
              left: 30,
            ),
            child: Text(
              'New',
              style: TextStyle(
                fontFamily: 'GB',
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
              (context, index) => _getRow(ActivityState.following),
              childCount: 2),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(
              top: 30,
              left: 30,
            ),
            child: Text(
              'Today',
              style: TextStyle(
                fontFamily: 'GB',
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
              (context, index) => _getRow(ActivityState.followBack),
              childCount: 4),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(
              top: 30,
              left: 30,
            ),
            child: Text(
              'This week',
              style: TextStyle(
                fontFamily: 'GB',
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
              (context, index) => _getRow(ActivityState.like),
              childCount: 3),
        ),
      ],
    );
  }

  Widget _getRow(ActivityState state) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: pinkColor,
              shape: BoxShape.circle,
            ),
          ),
          Gap(7),
          SizedBox(
            width: 40,
            height: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset('images/profile.png'),
              ),
            ),
          ),
          Gap(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'AmirAhmadAdibi',
                    style: TextStyle(
                        fontFamily: 'GB', fontSize: 12, color: whiteColor),
                  ),
                  Gap(5),
                  Text(
                    'Start following',
                    style: TextStyle(
                        color: greyColor, fontFamily: 'GM', fontSize: 12),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'you',
                    style: TextStyle(
                        fontFamily: 'GB', fontSize: 12, color: greyColor),
                  ),
                  Gap(5),
                  Text(
                    '3min',
                    style: TextStyle(
                        color: Colors.white, fontFamily: 'GM', fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          _getActionStateRow(state)
        ],
      ),
    );
  }

  Widget _getActionStateRow(ActivityState state) {
    switch (state) {
      case ActivityState.followBack:
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            backgroundColor: Color(0xffF35383),
            foregroundColor: Colors.white,
            textStyle: TextStyle(
              fontFamily: 'GB',
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          onPressed: () {},
          child: Text('Follow'),
        );
      case ActivityState.following:
        return OutlinedButton(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
              side: BorderSide(
                strokeAlign: 3,
              ),
            ),
          ),
          onPressed: () {},
          child: Text(
            'Massage',
            style: TextStyle(
              fontSize: 12,
              fontFamily: 'GB',
              color: Colors.white,
            ),
          ),
        );
      case ActivityState.like:
        return SizedBox(
          width: 40,
          height: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset('images/pic2.png'),
            ),
          ),
        );
      default:
        return Text('');
    }
  }
}
