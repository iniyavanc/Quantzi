import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import '../ApiConnect.dart';
import '../Component/MenuProvider.dart';
import '../ResponseModel/CreateResponse.dart';
import '../ResponseModel/ListResponse.dart';
import '../ResponseModel/MoviesListResponse.dart';
import '../UI/ApiConnectData.dart';

class HomeScreenController extends GetxController {
  late MenuProvider userDataProvider;

  ApiConnect _connect = Get.put(ApiConnect());

  ApiConnectData con = Get.put(ApiConnectData());

  RxList<Data> dataValues = RxList();

  RxBool isLoading = RxBool(false);

  RxList<Results> moviesData = RxList();

  CreateData? dataSet;

  @override
  void onInit() {
    getMovies();
    getListData();
    super.onInit();
  }

  getMovies() async {
    isLoading.value = true;
    var response = await _connect.getMovieCall();
    isLoading.value = false;
    print('getMovies:${response.toJson()}');
    if (response != null) {
      moviesData.value = response.results!;
      // Get.offNamed(AppRoutes.login.toName);
    } else {}
  }

  getListData() async {
    isLoading.value = true;
    var res = await con.getList();
    print('getPrabha:${res.toJson()}');
    isLoading.value = false;
    if (res != null) {
      dataValues.value = res.data!;
    } else {}
  }

  createData() async {
    Map<String, dynamic> payload = {
      "name": "test",
      "salary": "123",
      "age": "23"
    };
    var res = await con.postData(payload);

    print('create:${res.toJson()}');

    if (res != null) {
      dataSet = res.data;
      Fluttertoast.showToast(
        msg: res.message!,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    } else {}
  }
}
