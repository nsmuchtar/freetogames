import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/detail_games_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DetailGamesView extends GetView<DetailGamesController> {
  @override
  Widget build(BuildContext context) {
    final DetailGamesController _controller = Get.put(DetailGamesController());

    Widget imageHeader() {
      return Container(
        width: double.infinity,
        child: _controller.details.thumbnail!.isURL
            ? Image.network(
                '${_controller.details.thumbnail}',
                fit: BoxFit.fitWidth,
              )
            : Image.asset(
                'lib/app/assets/images/nophoto.jpg',
              ),
      );
    }

    Widget carouselImage() {
      return CarouselSlider(
        options: CarouselOptions(
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          initialPage: 0,
          autoPlay: true,
          scrollDirection: Axis.horizontal,
        ),
        items: _controller.details.screenshots!.map(
          (e) {
            return Container(
              child: Image.network('${e!.image}'),
            );
          },
        ).toList(),
      );
    }

    Widget detailGames() {
      return Column(
        children: [
          Container(
            child: _controller.details.title!.isNotEmpty
                ? Text(
                    '${_controller.details.title!}',
                    style: TextStyle(
                      color: Color(0xffaaaaaa),
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  )
                : Text('No Title'),
          ),
          SizedBox(
            height: 15.h,
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Container(
                  width: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _controller.details.genre!.isNotEmpty
                          ? AutoSizeText(
                              'Genre : ${_controller.details.genre}',
                              style: TextStyle(
                                color: Color(0xffaaaaaa),
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          : AutoSizeText('No Genre'),
                      SizedBox(
                        height: 5,
                      ),
                      AutoSizeText(
                          _controller.details.platform!.isNotEmpty
                              ? 'Platform : ${_controller.details.platform}'
                              : 'No Platform',
                          style: TextStyle(
                            color: Color(0xffaaaaaa),
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 3),
                      SizedBox(
                        height: 5,
                      ),
                      AutoSizeText(
                          _controller.details.publisher!.isNotEmpty
                              ? 'Publisher : ${_controller.details.publisher}'
                              : 'No Publisher',
                          style: TextStyle(
                            color: Color(0xffaaaaaa),
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 3),
                      SizedBox(
                        height: 5,
                      ),
                      AutoSizeText(
                          _controller.details.developer!.isNotEmpty
                              ? 'Developer : ${_controller.details.developer}'
                              : 'No Developer',
                          style: TextStyle(
                            color: Color(0xffaaaaaa),
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 3),
                      SizedBox(
                        height: 5,
                      ),
                      AutoSizeText(
                        _controller.details.releaseDate!.toString().isNotEmpty
                            ? 'Release Date : ' +
                                DateFormat('d MMMM yyyy')
                                    .format(_controller.details.releaseDate!)
                            : 'No Release Date',
                        style: TextStyle(
                          color: Color(0xffaaaaaa),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 3,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 70.w,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Colors.grey),
                  ),
                  onPressed: () async {
                    final Uri url = Uri.parse(
                        '${_controller.details.freetogameProfileUrl}');
                    if (!await launchUrl(url)) {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Text(
                    'Open on \n Browser',
                    style: TextStyle(
                      color: Color(0xff32383e),
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          )
        ],
      );
    }

    Widget description() {
      return Column(
        children: [
          Text(
            'Description',
            style: TextStyle(
                color: Color(0xffaaaaaa),
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15.h,
          ),
          Container(
            height: 300,
            margin: EdgeInsets.all(
              10,
            ),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Text(
                '${_controller.details.description}',
                style: TextStyle(
                  color: Color(0xffaaaaaa),
                ),
              ),
            ),
          ),
        ],
      );
    }

    Widget systemRequirement() {
      return Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              'Minimum System Requirements',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(width: 200, child: Text('Operating System')),
                SizedBox(width: 20.w),
                Expanded(
                    child: Text(
                        '${_controller.details.minimumSystemRequirements!.os}')),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(width: 200, child: Text('Processor')),
                SizedBox(width: 20.w),
                Expanded(
                  child: AutoSizeText(
                    '${_controller.details.minimumSystemRequirements!.processor}',
                    maxLines: 3,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(width: 200, child: Text('Graphics')),
                SizedBox(width: 20.w),
                Flexible(
                  child: Text(
                      '${_controller.details.minimumSystemRequirements!.graphics}'),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(width: 200, child: Text('Memory')),
                SizedBox(width: 20.w),
                Flexible(
                  child: Text(
                      '${_controller.details.minimumSystemRequirements!.memory}'),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 200,
                  child: Text('Storage'),
                ),
                SizedBox(width: 20.w),
                Flexible(
                  child: Text(
                      '${_controller.details.minimumSystemRequirements!.storage}'),
                ),
              ],
            )
          ],
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff32383e),
        body: Obx(
          () {
            if (_controller.isLoading.value)
              return Center(
                child: CircularProgressIndicator(),
              );
            else if (_controller.isError.value)
              return Center(
                child: Text("Error: ${_controller.errmsg.value.capitalize}"),
              );
            else
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  child: Column(
                    children: [
                      imageHeader(),
                      SizedBox(
                        height: 15,
                      ),
                      detailGames(),
                      _controller.details.screenshots != null
                          ? carouselImage()
                          : SizedBox(),
                      SizedBox(
                        height: 15.h,
                      ),
                      controller.details.minimumSystemRequirements != null
                          ? systemRequirement()
                          : SizedBox(),
                      description(),
                    ],
                  ),
                ),
              );
          },
        ),
      ),
    );
  }
}
