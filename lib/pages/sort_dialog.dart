import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SortDialog extends StatelessWidget {
  final List<String> sorts = [
    'Release Date',
    'Popularity',
    'Alphabetical',
    'Relevance',
  ].obs;

  List<String> genres = [
    "Shooter",
    "MMOARPG",
    "ARPG",
    "Strategy",
    "MMORPG",
    "Fighting",
    "Action RPG",
    "Battle Royale",
    "MOBA",
    "Racing",
    "Card Game",
    "Sports",
    "MMOFPS",
    "MMO",
    "Social",
    "Fantasy"
  ].obs;

  Widget listData(List all) {
    return ListView(
      children: all.map(
        (e) {
          return InkWell(
              onTap: () {
                Get.back(result: e);
              },
              child: layoutSort(e));
        },
      ).toList(),
    );
  }

  Widget layoutSort(String text) {
    return SizedBox(
      width: double.infinity,
      height: 40.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sort By'),
        centerTitle: true,
        backgroundColor: Color(0xff272b30),
      ),
      backgroundColor: Color(0xff32383e),
      body: listData(genres),
    );
  }
}
