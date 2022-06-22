import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:maktabat_alharam/config/dio_helper/dio.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/follow_answering_librarian/models/model.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/my_order/model/models.dart';
import 'package:queen/core/helpers/prefs.dart';

part 'follow_state.dart';

class FollowCubit extends Cubit<FollowState> {
  final AskMyOrder askMyOrder;
  FollowCubit({required this.askMyOrder}) : super(FollowInitial()) {
    getAskFollow(id: askMyOrder.id!);
    if (askMyOrder.visitorName != null) {
      userController.text = askMyOrder.visitorName!;
    }
    if (askMyOrder.visitorEmail != null) {
      emailController.text = askMyOrder.visitorEmail!;
    }
    if (askMyOrder.visitorMobile != null) {
      phoneController.text = askMyOrder.visitorMobile!;
    }
    if (askMyOrder.visitorMessage != null) {
      questionController.text = askMyOrder.visitorMessage!;
    }
    if (askMyOrder.response != null) {
      responseController.text = askMyOrder.response!;
    }

    if (askMyOrder.type != null) initial = askMyOrder.type!;

    askTypeChanged(initial);
  }

  final formKey = GlobalKey<FormState>();
  final userController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final questionController = TextEditingController();
  final responseController = TextEditingController();

  int initial = 0;

  int? typeAskId;
  int askTypeChanged(int value) => typeAskId = value;

  var userId = Prefs.getString("userId");

  Future<void> getAskFollow({required int id}) async {
    emit(FollowLoading());
    try {
      final userId = Prefs.getString("userId");
      final res = await NetWork.get('Inquiry/GetInquiryById/$id/$userId');

      if (res.data['status'] == 0 ||
          res.data['status'] == -1 ||
          res.statusCode != 200) {
        throw res.data['message'];
      }

      emit(FollowSuccess(
          allAskFollowModel: AllAskFollowModel.fromJson(res.data)));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(FollowError(msg: e.toString()));
    }
  }
}
