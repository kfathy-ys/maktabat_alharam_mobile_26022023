import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:queen/core/helpers/prefs.dart';

import '../../../../../config/dio_helper/dio.dart';
import '../models/model.dart';

part 'user_info_state.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  final UserModel userModel;
  UserInfoCubit(this.userModel) : super(UserInfoInitial()){
    /// TODO :: i dont know if call this func or not here
    getUserInfo();
    if(userModel.firstName != null )firstNameController.text = userModel.firstName!;
    if(userModel.lastName != null )lastNameController.text = userModel.lastName!;
    if(userModel.nameArabic != null )arabicFullNameController.text = userModel.nameArabic!;
    if(userModel.email != null )emailController.text = userModel.email!;
    if(userModel.phoneNumber != null )phoneController.text = userModel.phoneNumber!;
    if(userModel.birthDate != null )dateController.text = userModel.birthDate!;


  }

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  final phoneController = TextEditingController();

  final firstNameController = TextEditingController();

  final lastNameController = TextEditingController();
  final dateController = TextEditingController();
  final arabicFullNameController = TextEditingController();


  dynamic image = "assets/image/kabah.png";

  Future<void> getUserInfo() async {
    emit(UserInfoLoading());
    try {
      final userId = Prefs.getString("userId");
      final res = await NetWork.get('User/$userId');

      if (res.data['status'] == 0 ||
          res.data['status'] == -1 ||
          res.statusCode != 200) {
        throw res.data['message'];
      }

      emit(UserInfoSuccess(userModel:
      UserModel.fromJson(res.data)));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(UserInfoError(msg: e.toString()));
    }
  }
  Future<void> updatedUserInfo({

    required String allData,
    required String image,
  }) async {
    emit(UserInfoLoading());
    try {

      //Map<String, dynamic> map = jsonDecode(userInfo.toJson); //
      final res = await NetWork.post(
        'User/UpdateUserProfile',
        body: {
          "id": userModel.id,
        //  "visitorName": visitorName,
          //"visitorEmail": visitorEmail,

        },
      );
      if (res.data['status'] == 0 || res.data['status'] == -1 ) {
        throw res.data["messages"] ?? res.data;
      }
      emit(UserInfoSuccess(userModel:
      UserModel.fromJson(res.data)));
    } catch (e, st) {

      log(e.toString());
      log(st.toString());
      emit(UserInfoError(msg: e.toString()));
    }
  }


}
