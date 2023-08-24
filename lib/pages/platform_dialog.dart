import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class PlatformDialog extends StatelessWidget {
  List<String> platforms = [
    'All',
    'Browser',
    'PC',
  ];

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
        title: Text('Platform'),
        centerTitle: true,
        backgroundColor: Color(0xff272b30),
      ),
      backgroundColor: Color(0xff32383e),
      body: listData(platforms),
    );
  }
}
