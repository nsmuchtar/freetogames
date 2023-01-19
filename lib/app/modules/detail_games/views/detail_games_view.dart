import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/detail_games_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';
import 'package:auto_size_text/auto_size_text.dart';

class DetailGamesView extends GetView<DetailGamesController> {
  @override
  Widget build(BuildContext context) {
    final DetailGamesController _controller = Get.put(DetailGamesController());
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
                      Container(
                        width: double.infinity,
                        child: _controller.details.thumbnail!.isURL
                            ? Image.network(
                                '${_controller.details.thumbnail}',
                                fit: BoxFit.fitWidth,
                              )
                            : Image.asset(
                                'lib/app/assets/images/nophoto.jpg',
                              ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      _controller.details.title!.isNotEmpty
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
                                    _controller.details.releaseDate!
                                            .toString()
                                            .isNotEmpty
                                        ? 'Release Date : ' +
                                            DateFormat('d MMMM yyyy').format(
                                                _controller
                                                    .details.releaseDate!)
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
                                    MaterialStatePropertyAll<Color>(
                                        Colors.grey),
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
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
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
                      )
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
