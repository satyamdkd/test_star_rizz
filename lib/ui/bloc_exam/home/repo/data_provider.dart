import 'package:demo_firebase/ui/bloc_exam/home/model/login_req_model.dart';

abstract class HomeDataProvider {
  Future login(LoginRequestModel model);
}
