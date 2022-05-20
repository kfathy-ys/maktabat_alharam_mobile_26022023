import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:queen/core/helpers/prefs.dart';

import '../../../../../../config/dio_helper/dio.dart';
import '../models/model.dart';

part 'visit_order_state.dart';

class VisitOrderCubit extends Cubit<VisitOrderState> {
  VisitOrderCubit() : super(VisitOrderInitial()){
    getOrderVisit();
  }


  Future<void> getOrderVisit() async {
    emit(VisitOrderLoading());
    try {
      final userId = Prefs.getString("userId");
      final res = await NetWork.get('VisitRequest/GetAllVisitRequests/$userId');

      if (res.data['status'] == 0 ||
          res.data['status'] == -1 ||
          res.statusCode != 200) {
        throw res.data['message'];
      }

      emit(VisitOrderSuccess(allOrderVisitModel:
      AllOrderVisitModel.fromJson(res.data)));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(VisitOrderError(msg: e.toString()));
    }
  }
}
