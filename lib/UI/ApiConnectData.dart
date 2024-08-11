import 'package:get/get.dart';
import 'package:quantzi/ResponseModel/CreateResponse.dart';

import '../ResponseModel/ListResponse.dart';

class ApiConnectData extends GetConnect {
  @override
  void onInit() {
    super.allowAutoSignedCert = true;
    super.onInit();
    httpClient.addResponseModifier(
      (request, response) {
        return response;
      },
    );
  }

  Future<ListResponse> getList() async {
    var response =
        await get('https://dummy.restapiexample.com/api/v1/employees');
    if (response.body == null) throw Exception('no data');
    print(response.body);
    return ListResponse.fromJson(response.body);
  }

  Future<CreateResponse> postData(Map<String, dynamic> payload) async {
    var res =
        await post('https://dummy.restapiexample.com/api/v1/create', payload);

    if (res.body == null) throw Exception('no data');

    return CreateResponse.fromJson(res.body);
  }
}
