import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:quantzi/UI/HomeScreen.dart';
import '../Component/MenuProvider.dart';
import '../Controller/DetailScreenController.dart';
import 'package:video_player/video_player.dart';

class DetailScreen extends GetView<DetailScreenController> {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    DetailScreenController controller = Get.put(DetailScreenController());
    controller.userDataProvider =
        Provider.of<MenuProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Color(0xFF0D111C),
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Color(0xFF263E60),
        leading: GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Image.asset('assets/images/cinema.png'),
            )),
        title: Row(
          children: [
            Container(
              height: 45,
              width: width * 0.55,
              decoration: BoxDecoration(
                color: Color(0xFF263E60),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
                border: Border(
                  top: BorderSide(color: Colors.white),
                  bottom: BorderSide(color: Colors.white),
                  left: BorderSide(color: Colors.white),
                ),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      onChanged: (value) {},
                      onTap: () {},
                      // controller: controller.searchController,
                      decoration: InputDecoration(
                        hintText: 'Search Movies',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Color(0xFFFF6563),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                ),
                child: Icon(Icons.search_sharp, size: 25, color: Colors.white)),
            SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              },
              child: Text(
                'Back',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
        actions: <Widget>[],
        centerTitle: false,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            decoration: BoxDecoration(
              color: Color(0xFF0D111C),
              borderRadius: BorderRadius.circular(5.5),
              border: Border.all(color: Color(0xFF0D111C), width: 1),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: width * 0.8,
                        child: Text(
                          controller.userDataProvider.getMovieValues!.title
                                  .toString() ??
                              "",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: width * 0.8,
                        child: Row(
                          children: [
                            Text(
                              controller.userDataProvider.getMovieValues!
                                      .popularity
                                      .toString() ??
                                  "",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: width * 0.8,
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                controller.userDataProvider.getMovieValues!
                                        .overview
                                        .toString() ??
                                    "",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: width * 0.8,
                        child: Row(
                          children: [
                            Text(
                              'Release Date : ${controller.userDataProvider.getMovieValues!.releaseDate.toString() ?? ""}',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: width * 0.8,
                        child: Row(
                          children: [
                            Text(
                              'Original Language : ${controller.userDataProvider.getMovieValues!.originalLanguage.toString() ?? ""}',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(2)),
                        height: height * 0.3,
                        width: width * 0.4,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(2),
                              child: Image.asset(
                                'assets/images/tammy.png',
                                fit: BoxFit.fill,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => VideoDialog(),
                                  );
                                },
                                child: Image.asset(
                                  'assets/images/play.png',
                                  height: 50,
                                  width: 40,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class VideoDialog extends StatefulWidget {
  @override
  _VideoDialogState createState() => _VideoDialogState();
}

class _VideoDialogState extends State<VideoDialog> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/images/sample.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Container(
            color: Color(0xFF0D111C),
            width: 400,
            height: 300,
            padding: EdgeInsets.all(10),
            child: _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }
}
