import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:maktabat_alharam/config/dio_helper/dio.dart';
import 'package:maktabat_alharam/screens/auth/login/model/models.dart';
import 'package:meta/meta.dart';
import 'package:queen/core/helpers/prefs.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  LoginModel? model;

  Future<void> userLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    try {
      final res = await NetWork.post(
        'Auth/login',
        body: {
          "userName": email,
          "password": password,
        },
      );
      if (res.data['status'] == 0 || res.data['status'] == -1) {
        throw res.data['message'];
      }
      LoginModel loginModel = LoginModel.fromJson((res.data));
      Prefs.setString("token", res.data["data"]["token"]);
      Prefs.setString("userId", res.data["data"]["userId"]);

      Prefs.setString("fullName", loginModel.data!.fullName!);
      Prefs.setString("email", loginModel.data!.email!);
      Prefs.setString("phoneNumber", loginModel.data!.phoneNumber!);

      Prefs.setString("firstName", loginModel.data!.fullName!);
      Prefs.setString("lastName", loginModel.data!.email!);

      log("${res.data["data"]["token"]}");
      log("${res.data["data"]["userId"]}");

      log("${res.data["data"]["fullName"]}");
      log("${res.data["data"]["email"]}");
      log("${res.data["data"]["phoneNumber"]}");

      emit(LoginSuccess(LoginModel.fromJson((res.data))));
    } catch (e, st) {
      final res = await NetWork.post(
        'Auth/login',
        body: {
          "userName": email,
          "password": password,
        },
      );
      log(e.toString());
      log(st.toString());
      emit(LoginError(res.data["messages"][0]["body"].toString()));
    }
  }
}
