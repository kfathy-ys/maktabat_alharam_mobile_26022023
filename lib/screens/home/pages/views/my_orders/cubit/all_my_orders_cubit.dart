import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:maktabat_alharam/screens/home/pages/views/my_orders/models/model.dart';
import 'package:meta/meta.dart';
import 'package:queen/core/helpers/prefs.dart';

import '../../../../../../config/dio_helper/dio.dart';

part 'all_my_orders_state.dart';

class AllMyOrdersCubit extends Cubit<AllMyOrdersState> {
  AllMyOrdersCubit() : super(AllMyOrdersInitial()) {
    getAllMyOrders();
  }

  final allMyOrders = <AllMyOrders>[];
  final formKey = GlobalKey<FormState>();
  final fromController = TextEditingController();
  final toController = TextEditingController();

  String? libId;
  String onLibIDChanged(String value) => libId = value;
  String? stateId;
  String onStateIdChanged(String value) => stateId = value;

  Future<void> getAllMyOrders() async {
    emit(AllMyOrdersLoading());
    try {
      allMyOrders.clear();
      final userId = Prefs.getString("userId");
      final res = await NetWork.get('User/GetAllUserRequests/$userId');

      if (res.data['status'] == 0 ||
          res.data['status'] == -1 ||
          res.statusCode != 200) {
        throw res.data['message'];
      }
      (res.data["data"] as List)
          .map((e) => allMyOrders.add(AllMyOrders.fromJson(e)))
          .toList();
      emit(AllMyOrdersSuccess());
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(AllMyOrdersError(msg: e.toString()));
    }
  }

  Future<void> getSearchResult({
    String searchText = "null",
    String type = "null",
    String status = "null",
    dynamic dateFrom = "null",
    dynamic dateTo = "null",
  }) async {
    allMyOrders.clear();

    emit(AllMyOrdersLoading());
    try {
      final userId = Prefs.getString("userId");
      final res = await NetWork.get(
        "User/GetAllUserRequestsByFilters/$userId/$searchText/$type/$status/$dateFrom/$dateTo",
      );

      if (res.statusCode != 200) {
        throw res.data;
      }
      (res.data["data"] as List)
          .map((e) => allMyOrders.add(AllMyOrders.fromJson(e)))
          .toList();

      emit(AllMyOrdersSuccess());
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      emit(AllMyOrdersError(msg: e.toString()));
    }
  }
}
