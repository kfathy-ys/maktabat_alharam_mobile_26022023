import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:maktabat_alharam/config/dio_helper/dio.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/my_order/model/models.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/update/models/model.dart';
import 'package:meta/meta.dart';
import 'package:queen/core/helpers/prefs.dart';

part 'update_ask_lib_state.dart';

class UpdateAskLibCubit extends Cubit<UpdateAskLibState> {
  final AskMyOrder askMyOrder;
  UpdateAskLibCubit(this.askMyOrder) : super(UpdateAskLibInitial()){
    if(askMyOrder.visitorName != null )userController.text = askMyOrder.visitorName!;
    if(askMyOrder.visitorEmail != null )emailController.text = askMyOrder.visitorEmail!;
    if(askMyOrder.visitorMobile != null )phoneController.text = askMyOrder.visitorMobile!;
    if(askMyOrder.visitorMessage != null )questionController.text = askMyOrder.visitorMessage!;
    if(askMyOrder.type != null ) initial = askMyOrder.type!;

    askTypeChanged(initial);
  }

  final formKey = GlobalKey<FormState>();
  final userController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final questionController = TextEditingController();

  int initial = 0;

  int? typeAskId;
  int askTypeChanged(int value)=> typeAskId= value;

  var userId = Prefs.getString("userId");


  Future<void> updatedOrderAsk({
    required String visitorName,
    required String visitorEmail,
    required String visitorMobile,
    required String question,

  }) async {
    emit(UpdateAskLibLoading());
    try {
      var now = DateTime.now();
      final res = await NetWork.post(
        'Inquiry/UpdateInquiry',
        body: {
          "id": askMyOrder.id,
          "type": typeAskId,
          "visitorName": visitorName,
          "visitorEmail": visitorEmail,
          "visitorMobile": visitorMobile,
          "visitorMessage": question,
          "response": " ",
          "isArchived": false,
          "createdBy": userId,
          "createdDate": DateFormat('yyyy-MM-dd').format(now),
          "updatedBy": userId,
          "updatedDate": DateFormat('yyyy-MM-dd').format(now)
        },
      );
      if (res.data['status'] == 0 || res.data['status'] == -1 ) {
        throw res.data["messages"] ?? res.data;
      }
      emit(UpdateAskLibSuccess(updateAskModel: UpdateAskModel.fromJson(res.data),));
    } catch (e, st) {

      log(e.toString());
      log(st.toString());
      emit(UpdateAskLibError(msg:e.toString()));
    }
  }
}
