import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:maktabat_alharam/config/dio_helper/dio.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/new_order/models/model.dart';
import 'package:meta/meta.dart';
import 'package:queen/core/helpers/prefs.dart';

part 'new_order_state.dart';

class NewOrderAskCubit extends Cubit<NewOrderState> {
  NewOrderAskCubit() : super(NewOrderInitial());

  CreateOrderAsk? createOrderAsk;

  int? type;

  int askTypeChanged(int value) => type = value;
  var userId = Prefs.getString("userId");

  Future<void> createOrderAskLib({
    required String visitorName,
    required String visitorEmail,
    required String visitorMobile,
    required String visitorMessage,
    // required String response,
  }) async {
    emit(NewOrderLoading());
    try {
      var now = DateTime.now();
      final res = await NetWork.post(
        'Inquiry/CreateNewInquiry',
        body: {
          "id": 0,
          "type": type,
          "visitorName": visitorName,
          "visitorEmail": visitorEmail,
          "visitorMobile": visitorMobile,
          "visitorMessage": visitorMessage,
          "response": null,
          "isArchived": false,
          "createdBy": userId,
          "createdDate": DateFormat.yMMMMd().format(now),
          "updatedBy": userId,
          "updatedDate": DateFormat.yMMMMd().format(now)
        },
      );
      if (res.data['status'] == 0 || res.data['status'] == -1) {
        throw res.data['message'];
      }
      emit(NewOrderSuccess(createOrderAsk: CreateOrderAsk.fromJson(res.data)));
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      emit(NewOrderError(msg: e.toString()));
    }
  }
}
