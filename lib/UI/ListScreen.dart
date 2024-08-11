import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/HomeScreenController.dart';

class ListScreen extends GetView<HomeScreenController> {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenController controller = Get.put(HomeScreenController());
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            controller.isLoading.value
                ? CircularProgressIndicator()
                : Container(
                    height: 100,
                    child: ListView.builder(
                      itemCount: controller.dataValues.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    controller.dataValues[index].employeeName
                                        .toString(),
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ],
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Text(controller.dataSet!.id.toString()),
            //   ],
            // ),
            ElevatedButton(
                onPressed: () {
                  controller.createData();
                },
                child: Text('Done'))
          ],
        ),
      ),
    );
  }
}
