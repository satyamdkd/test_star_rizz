import 'package:demo_firebase/services/network/api_result.dart';
import 'package:demo_firebase/ui/bloc_exam/home/model/login_req_model.dart';
import 'package:demo_firebase/ui/bloc_exam/home/repo/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeLoginButtonPressed>(login);
  }

  HomeRepository homeRepository = HomeRepository();

  login(HomeLoginButtonPressed event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    LoginRequestModel model = LoginRequestModel(
      email: event.userId,
      password: event.password,
      fcm: "fcm",
    );

    try {
      final response = await homeRepository.login(model);

      if (response is ApiSuccess) {
        debugPrint(response.data.toString());
        Get.snackbar(
          "Message",
          "Login Success.",
          dismissDirection: DismissDirection.down,
          snackPosition: SnackPosition.BOTTOM,
          overlayColor: Colors.blueAccent,
        );
        emit(HomeSuccess());
      } else if (response is ApiFailure) {
        Get.snackbar("Message", "Login failed.");
        emit(HomeFailure());
      } else {
        Get.snackbar("Message", "Login failed.",
            dismissDirection: DismissDirection.down);
        emit(HomeFailure());
      }
    } catch (e) {
      Get.snackbar("Message", "Login failed.");
      emit(HomeFailure());
    }
  }
}
