import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:quantzi/UI/LoginScreen.dart';
import '../Component/MenuProvider.dart';
import '../Controller/HomeScreenController.dart';
import 'DetailScreen.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    HomeScreenController controller = Get.put(HomeScreenController());
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

                    // Icon(Icons.cancel_sharp, size: 25, color: Colors.white),
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
                  child:
                      Icon(Icons.search_sharp, size: 25, color: Colors.white)),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Text(
                  'Log out',
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
        body: Obx(() => controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : Column(children: [
                Container(
                  child: Image.asset('assets/images/div.png'),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 0.5,
                        mainAxisExtent: 200,
                        childAspectRatio: 1.25,
                      ),
                      itemCount: controller.moviesData.length,
                      physics: AlwaysScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        var res = controller.moviesData[index];

                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.userDataProvider.setMoviesValues(
                                    controller.moviesData[index]);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailScreen()));
                              },
                              child: Container(
                                margin: EdgeInsets.all(5),
                                height:
                                    MediaQuery.of(context).size.height * 0.21,
                                width: MediaQuery.of(context).size.width * 0.45,
                                decoration: BoxDecoration(
                                  color: Color(0xFF263E60),
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(0),
                                      child: Image.network(
                                        'https://image.tmdb.org/t/p/w500/${controller.moviesData[index].backdropPath.toString() ?? ""}',
                                        fit: BoxFit.fill,
                                        height: height * 0.12,
                                        width: width * 0.45,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    width: width * 0.32,
                                                    child: Text(
                                                      controller
                                                              .moviesData[index]
                                                              .originalTitle
                                                              .toString() ??
                                                          "",
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                width: width * 0.32,
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                      'assets/images/Star.png',
                                                      height: 20,
                                                      width: 15,
                                                    ),
                                                    Image.asset(
                                                      'assets/images/Star.png',
                                                      height: 20,
                                                      width: 15,
                                                    ),
                                                    Image.asset(
                                                      'assets/images/Star.png',
                                                      height: 20,
                                                      width: 15,
                                                    ),
                                                    Image.asset(
                                                      'assets/images/Star.png',
                                                      height: 20,
                                                      width: 15,
                                                    ),
                                                    Image.asset(
                                                      'assets/images/Star.png',
                                                      height: 20,
                                                      width: 15,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    'assets/images/play.png',
                                                    height: 20,
                                                    width: 30,
                                                  ),
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ])));
  }
}
