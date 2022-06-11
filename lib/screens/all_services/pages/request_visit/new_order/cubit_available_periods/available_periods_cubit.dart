import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../../config/dio_helper/dio.dart';
import '../models/avalible_periods_model.dart';

part 'available_periods_state.dart';

//AvailablePeriods
class AvailablePeriodsCubit extends Cubit<AvailablePeriodsState> {
  // final AvailableDates availableDates;

  AvailablePeriodsCubit() : super(AvailablePeriodsInitial());

  Future<void> getAvailablePeriodsVisit({
    required String selectedDate,
    required int libraryId,
  }) async {
    emit(AvailablePeriodsLoading());
    try {
      final res = await NetWork.get(
          'VisitRequest/GetVisitAvailablePeriodsByDate/$selectedDate/$libraryId');

      if (res.data['status'] == 0 ||
          res.data['status'] == -1 ||
          res.statusCode != 200) {
        throw res.data['message'];
      }

      emit(AvailablePeriodsSuccess(
          availablePeriodsModel: AvailablePeriodsModel.fromJson(res.data)));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(AvailablePeriodsError(msg: e.toString()));
    }
  }
}
