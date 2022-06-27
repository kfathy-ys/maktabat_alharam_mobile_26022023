import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maktabat_alharam/screens/widgets/date_convertors.dart';
import 'package:meta/meta.dart';
import 'package:queen/core/helpers/prefs.dart';

import '../../../../../../config/dio_helper/dio.dart';
import '../../my_orders/models/model.dart';
import '../models/all_libraries_model.dart';
import '../models/available_dates_model.dart';
import '../models/avalible_periods_model.dart';

part 'available_dates_state.dart';

class AvailableDatesCubit extends Cubit<AvailableDatesState> {
  AvailableDatesCubit() : super(AvailableDatesInitial());

  AllLibraries? selectedLIB;
  void onLibChang(AllLibraries value) => selectedLIB = value;

  int? authorityID;
  int onAuthorityIDChanged(int value) => authorityID = value;

  final dates = <AvailableDates>[];
  final availableDates = <DateTime>[];
  Future<void> getAvailableDatesVisit(int libId) async {
    emit(AvailableDatesLoading());
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

      emit(AvailableDatesSuccess(
        availableDatesModel: AvailableDatesModel.fromJson(res.data),
        dates: dates,
      ));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(AvailableDatesError(msg: e.toString()));
    }
  }

  final periods = <AvailablePeriods>[];
  Future<void> getAvailablePeriodsVisit({
    required DateTime selectedDate,
  }) async {
    emit(AvailablePeriodLoading());
    try {
      periods.clear();
      final res = await NetWork.get(
          'VisitRequest/GetVisitAvailablePeriodsByDate/${DateConverter.dateConverterOnly(selectedDate.toString())}/${selectedLIB!.id}');

      if (res.data['status'] == 0 ||
          res.data['status'] == -1 ||
          res.statusCode != 200) {
        throw res.data['message'];
      }

      (res.data['data'] as List)
          .map((e) => periods.add(AvailablePeriods.fromJson(e)))
          .toList();

      emit(AvailablePeriodSuccess());
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(AvailablePeriodError(msg: e.toString()));
    }
  }

  final fullName = Prefs.getString('fullName');
  final email = Prefs.getString('email');
  final phoneNumber = Prefs.getString('phoneNumber');

  final createOrder = <MyOrderToVisit>[];
  int visitDateId = 0;
  Future<void> createOrderToVisit({


    required String responsibleName,
    required String responsibleMobile,
    required String responsibleEmail,
    required dynamic numberOfVisitors,
    required String visitReason,
    // required int requestStatusId,
  }) async {
    try {
      var now = DateTime.now();
      final userId = Prefs.getString("userId");
      final body = {
        "id": 0,
        "userId": userId,
        "libraryId": selectedLIB!.id!,
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
          await NetWork.post('VisitRequest/CreateNewVisitRequest', body: body);
      if (res.data['status'] == 0 || res.data['status'] == -1) {
        throw res.data['message'];
      }

      emit(CreateOrderSuccess(
          myOrderToVisit: MyOrderToVisit.fromJson(res.data)));
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      emit(CreateOrderError(msg: e.toString()));
    }
  }
}
