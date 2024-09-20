class LoginRequestModel {
  late String email;
  late String password;
  late String fcm;

  LoginRequestModel(
      {required this.email, required this.password, required this.fcm});

  LoginRequestModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    fcm = json['fcm_token'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['fcm_token'] = fcm;
    return data;
  }
}
