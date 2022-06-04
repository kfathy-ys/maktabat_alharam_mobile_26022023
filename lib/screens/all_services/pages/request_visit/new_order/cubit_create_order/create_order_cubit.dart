import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:queen/core/helpers/prefs.dart';

import '../../../../../../config/dio_helper/dio.dart';
import '../../../../../widgets/date_convertors.dart';
import '../../my_orders/models/model.dart';

part 'create_order_state.dart';

class CreateOrderCubit extends Cubit<CreateOrderState> {
  CreateOrderCubit() : super(CreateOrderInitial());

  int? authority, libraryNamedId;

  int authorityTypeChanged(int value) => authority = value;

  int libraryIdTypeChanged(int value) => libraryNamedId = value;

  Future<void> createOrderToVisit({
    //  required int libraryNamedId,
    required int visitDateId,
    // required int authority,
    required String responsibleName,
    required String responsibleMobile,
    required String responsibleEmail,
    required int numberOfVisitors,
    required String visitReason,
    required int requestStatusId,
  }) async {
    try {
      var now = DateTime.now();
      final userId = Prefs.getString("userId");
      final body = {
        "id": 0,
        "userId": userId,
        "libraryId": libraryNamedId,
        "visitDateId": visitDateId,
        "authority": authority,
        "responsibleName": responsibleName,
        "responsibleMobile": responsibleMobile,
        "responsibleEmail": responsibleEmail,
        "numberOfVisitors": numberOfVisitors,
        "visitReason": visitReason,
        "reasonOfRejection": null,
        "instructions": null,
        "requestStatusId": requestStatusId,
        "isArchived": false,
        "createdBy": userId,
        "createdDate": DateConverter.dateConverterOnly(now.toString()),
        "updatedBy": userId,
        "updatedDate": DateConverter.dateConverterOnly(now.toString())
      };
      final res =
          await NetWork.post('VisitRequest/CreateNewVisitRequest', body: body);
      if (res.data['status'] == 0 || res.data['status'] == -1) {
        throw res.data['message'];
      }

      emit(CreateOrderSuccess(
          myOrderToVisit: MyOrderToVisit.fromJson(res.data)));

      /// TODO :: UPDATE LIST OF ORDERS
      /*
      *     BlocProvider.of<VisitOrderCubit>(Get.context!).getOrderVisit();
      *
      */

    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      emit(CreateOrderError(msg: e.toString()));
    }
  }
}
