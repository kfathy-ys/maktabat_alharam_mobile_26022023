import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:maktabat_alharam/config/dio_helper/dio.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/my_order/model/models.dart';
import 'package:meta/meta.dart';
import 'package:queen/core/helpers/prefs.dart';

part 'my_order_ask_state.dart';

class MyOrderAskCubit extends Cubit<MyOrderAskState> {
  MyOrderAskCubit() : super(MyOrderAskInitial()){
    getOrderAsk();
  }


  Future<void> getOrderAsk() async {
    emit(MyOrderAskLoading());
    try {
      final userId = Prefs.getString("userId");
      final res = await NetWork.get('Inquiry/GetArchivedInquiries/$userId');

      if (res.data['status'] == 0 || res.data['status'] == -1 || res.statusCode != 200) {
        throw res.data['message'];
      }

      emit(MyOrderAskSuccess(askOrderModel: AskOrderModel.fromJson(res.data)));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(MyOrderAskError(msg:e.toString()));
    }
  }
}
