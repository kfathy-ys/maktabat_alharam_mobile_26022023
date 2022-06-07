import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:queen/core/helpers/prefs.dart';

import '../../../../../../config/dio_helper/dio.dart';
import '../models/model.dart';

part 'my_order_research_state.dart';

class MyOrderResearchCubit extends Cubit<MyOrderResearchState> {
  MyOrderResearchCubit() : super(MyOrderResearchInitial()){
    getOrderResearch();
  }

  Future<void> getOrderResearch() async {
    emit(MyOrderResearchLoading());
    try {
      final userId = Prefs.getString("userId");
      final res = await NetWork.get('ResearchRequest/GetAllResearchRequests/$userId');

      if (res.data['status'] == 0 ||
          res.data['status'] == -1 ||
          res.statusCode != 200) {
        throw res.data['message'];
      }

      emit(MyOrderResearchSuccess(orderResearchModel:
      OrderResearchModel.fromJson(res.data)));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(MyOrderResearchError(msg: e.toString()));
    }
  }
}
