import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:maktabat_alharam/config/dio_helper/dio.dart';
import 'package:maktabat_alharam/screens/all_services/pages/sugggest_buying_book/my_orders/models/model.dart';
import 'package:meta/meta.dart';
import 'package:queen/core/helpers/prefs.dart';

part 'order_suggest_state.dart';

/// Suggestion Order Link
/// Suggestion/GetAllSuggestions/37678663-9902-41a9-a502-733792bd832d

class OrderSuggestCubit extends Cubit<OrderSuggestState> {


  OrderSuggestCubit() : super(OrderSuggestInitial()) {
    getOrderSuggest();
  }

  OrderSuggestModel? orderSuggestModel;

  Future<void> getOrderSuggest() async {
    emit(OrderSuggestLoading());
    try {
      final userId = Prefs.getString("userId");
      final res = await NetWork.get('Suggestion/GetAllSuggestions/$userId');

      if (res.data['status'] == 0 || res.data['status'] == -1) {
        throw res.data['message'];
      }

      emit(OrderSuggestSuccess(
          orderSuggestModel: OrderSuggestModel.fromJson(res.data)));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(OrderSuggestError(meg: e.toString()));
    }
  }


}
