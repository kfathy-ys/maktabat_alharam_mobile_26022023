import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:maktabat_alharam/screens/home/pages/views/my_orders/models/model.dart';
import 'package:meta/meta.dart';
import 'package:queen/core/helpers/prefs.dart';

import '../../../../../../config/dio_helper/dio.dart';

part 'all_my_orders_state.dart';

class AllMyOrdersCubit extends Cubit<AllMyOrdersState> {
  AllMyOrdersCubit() : super(AllMyOrdersInitial()){
    getAllMyOrders();
  }

  Future<void> getAllMyOrders() async {
    emit(AllMyOrdersLoading());
    try {
      final userId = Prefs.getString("userId");
      final res =
      await NetWork.get('User/GetAllUserRequests/$userId');

      if (res.data['status'] == 0 ||
          res.data['status'] == -1 ||
          res.statusCode != 200) {
        throw res.data['message'];
      }

      emit(AllMyOrdersSuccess(ordersModel:
      OrdersModel .fromJson(res.data)));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(AllMyOrdersError(msg: e.toString()));
    }
  }
}
