import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:maktabat_alharam/config/dio_helper/dio.dart';
import 'package:maktabat_alharam/screens/auth/register/model/models.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  RegisterModel? register;

  Future<void> userRegister({
    required String fName,
    required String lName,
    required String fullName,
    required String phone,
    required String country,
    required String email,
    required String password,
    required String confirmPass,
  }) async {
    emit(RegisterLoading());
    try {
      final res = await NetWork.post(
        'Accounts/Register',
        body: {



          "firstName": fName,
          "lastName": lName,
          "nameArabic": fullName,
          "password": phone,
          "name": email,
          "phoneNumber": password,
          "email": confirmPass,
          "location": country,
          "defaultRole": "Visitor",
          "active": true,
          "roleName": [
            "Visitor"
          ]

        },
      );
      if (res.data['status'] == 0 ||res.data['status'] == -1) {
        throw res.data['message'];
      }
      emit(RegisterSuccess(RegisterModel.fromJson(res.data)));
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      emit(RegisterError(msg: e.toString()));
    }
  }
}
