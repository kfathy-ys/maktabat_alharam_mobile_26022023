import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:queen/core/helpers/prefs.dart';

import '../../../../../../config/dio_helper/dio.dart';
import '../../../../../widgets/date_convertors.dart';
import '../../my_orders/models/model.dart';
import '../../new_order/models/available_dates_model.dart';
import '../../new_order/models/avalible_periods_model.dart';
import '../model/update_model.dart';

part 'update_visit_order_state.dart';

class UpdateVisitOrderCubit extends Cubit<UpdateVisitOrderState> {
  final MyOrderToVisit order;
  UpdateVisitOrderCubit(this.order) : super(UpdateVisitOrderInitial()) {
    if (order.responsibleName != null) {
      nameController.text = order.responsibleName!;
    }
    if (order.responsibleEmail != null) {
      emailController.text = order.responsibleEmail!;
    }
    if (order.responsibleMobile != null) {
      phoneController.text = order.responsibleMobile!;
    }
    if (order.numberOfVisitors != null) {
      visitorsController.text = order.numberOfVisitors!.toString();
    }
    if (order.visitReason != null) {
      visitorReasonController.text = order.visitReason!;
    }

    if (order.libraryId != null) initialLibID = order.libraryId!;
    onLibChang(initialLibID);

    if (order.authority != null) initialAuthID = order.authority!;
    onAuthorityIDChanged(initialAuthID);
  }
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final phoneController = TextEditingController();

  final visitorsController = TextEditingController();

  final visitorReasonController = TextEditingController();
  int initialLibID = 0;
  int initialAuthID = 0;

  int libID = 0;
  void onLibChang(int value) => libID = value;

  int? authorityID;
  int onAuthorityIDChanged(int value) => authorityID = value;

  final fullName = Prefs.getString('fullName');
  final email = Prefs.getString('email');
  final phoneNumber = Prefs.getString('phoneNumber');

  final dates = <AvailableDates>[];
  final availableDates = <DateTime>[];
  Future<void> getUpdatesAvailableDatesVisit(int libId) async {
    emit(UpdateAvailableDatesLoading());
    try {
      dates.clear();
      final res = await NetWork.get(
          'VisitRequest/GetVisitAvailableDatesByLibraryId/$libId');

      if (res.data['status'] == 0 ||
          res.data['status'] == -1 ||
          res.statusCode != 200) {
        throw res.data['message'];
      }

      (res.data['data'] as List)
          .map((e) => dates.add(AvailableDates.fromJson(e)))
          .toList();

      if (dates.isNotEmpty) {
        for (final date in dates) {
          availableDates.add(date.date);
        }
      }
      // log('ddddddddddddddddddddddddddddddddd'+availableDates.toString());

      emit(UpdateAvailableDatesSuccess(
        availableDatesModel: AvailableDatesModel.fromJson(res.data),
        dates: dates,
      ));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(UpdateAvailableDatesError(msg: e.toString()));
    }
  }

  final periods = <AvailablePeriods>[];
  Future<void> getUpdatesAvailablePeriodsVisit({
    required DateTime selectedDate,
  }) async {
    emit(UpdateAvailablePeriodLoading());
    try {
      periods.clear();
      final res = await NetWork.get(
          'VisitRequest/GetVisitAvailablePeriodsByDate/${DateConverter.dateConverterOnly(selectedDate.toString())}/$libID');

      if (res.data['status'] == 0 ||
          res.data['status'] == -1 ||
          res.statusCode != 200) {
        throw res.data['message'];
      }

      (res.data['data'] as List)
          .map((e) => periods.add(AvailablePeriods.fromJson(e)))
          .toList();

      emit(UpdateAvailablePeriodSuccess());
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(UpdateAvailablePeriodError(msg: e.toString()));
    }
  }

  //final createOrder = <MyOrderToVisit>[];
  int visitDateId = 0;
  Future<void> updateOrderToVisit({
    //  required int libraryNamedId,
    // required int visitDateId,

    // required int authority,

    required String responsibleName,
    required String responsibleMobile,
    required String responsibleEmail,
    required dynamic numberOfVisitors,
    required String visitReason,
    // required int requestStatusId,
  }) async {
    emit(UpdateVisitOrderLoading());
    try {
      var now = DateTime.now();
      final userId = Prefs.getString("userId");
      final body = {
        /// TODO :: ID of Order
        "id": order.id,
        "userId": userId,
        "libraryId": libID,
        "visitDateId": visitDateId,
        "authority": authorityID,
        "responsibleName": responsibleName,
        "responsibleMobile": responsibleMobile,
        "responsibleEmail": responsibleEmail,
        "numberOfVisitors": numberOfVisitors,
        "visitReason": visitReason,
        "reasonOfRejection": null,
        "instructions": null,
        "requestStatusId": 4,
        "isArchived": false,
        "createdBy": userId,
        "createdDate": DateConverter.dateConverterOnly(now.toString()),
        "updatedBy": userId,
        "updatedDate": DateConverter.dateConverterOnly(now.toString())
      };
      final res =
          await NetWork.post('VisitRequest/UpdateVisitRequest', body: body);
      if (res.data['status'] == 0 || res.data['status'] == -1) {
        throw res.data['message'];
      }

      emit(UpdateVisitOrderSuccess(
          updateVisitRequestModel: UpdateVisitRequestModel.fromJson(res.data)));
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      emit(UpdateVisitOrderError(msg: e.toString()));
    }
  }
}
