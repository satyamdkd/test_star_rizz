import 'package:demo_firebase/services/network/api_result.dart';
import 'package:demo_firebase/services/network/network.dart';
import 'package:demo_firebase/ui/bloc_exam/home/model/login_req_model.dart';
import 'package:demo_firebase/ui/bloc_exam/home/repo/data_provider.dart';

class HomeRepository implements HomeDataProvider {
  Network network = Network();

  @override
  Future<ApiResults> login(LoginRequestModel model) async {
    return await network.postData(endPoint: "/login", data: model.toJson());
  }
}
