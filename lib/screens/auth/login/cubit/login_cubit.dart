import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:maktabat_alharam/config/dio_helper/dio.dart';
import 'package:maktabat_alharam/screens/auth/login/model/models.dart';
import 'package:meta/meta.dart';

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
      if (res.data['status']==0 || res.data['status']==-1) {
        throw res.data['message'];
      }
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
      emit(LoginError(LoginModel.fromJson(res.data)));
    }
  }
}
