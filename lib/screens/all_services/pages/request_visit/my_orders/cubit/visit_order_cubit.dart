import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:queen/core/helpers/prefs.dart';

import '../../../../../../config/dio_helper/dio.dart';
import '../../../../../widgets/alerts.dart';
import '../../archive/cubit/my_archive_visit_cubit.dart';
import '../../archive/models/model.dart';
import '../../archive/view.dart';
import '../models/model.dart';
import '../view.dart';

part 'visit_order_state.dart';

class VisitOrderCubit extends Cubit<VisitOrderState> {
 MyArchiveVisitCubit myArchiveVisitCubit;
//this.myArchiveVisitCubit
  VisitOrderCubit(this.myArchiveVisitCubit) : super(VisitOrderInitial()) {
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

      emit(VisitOrderSuccess(
          allOrderVisitModel: AllOrderVisitModel.fromJson(res.data)));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(VisitOrderError(msg: e.toString()));
    }
  }

  Future<void> addToArchiveVisit(MyOrderToVisit order) async {
    await myArchiveVisitCubit.addedVisitToArchive(
      id: order.id!,
      libraryId: order.libraryId!,
      visitDateId: order.visitDateId!,
      authority: order.authority!,
      responsibleName: order.responsibleName.toString(),
      responsibleMobile: order.responsibleMobile.toString(),
      responsibleEmail: order.responsibleEmail.toString(),
      numberOfVisitors: order.numberOfVisitors!,
      visitReason: order.visitReason.toString(),
      requestStatusId: order.requestStatusId!,
    );
    await getOrderVisit();
    Alert.success("تم إضافة الطلب إلي الأرشيف");
     Get.to(() => const ArchiveRequestToVisitScreen());
  }

  Future<void> removeFromArchiveVisit(MyArchiveVisits order) async {
    await myArchiveVisitCubit.removeVisitFromArchive(
      id: order.id!,
      libraryId: order.libraryId!,
      visitDateId: order.visitDateId!,
      authority: order.authority!,
      responsibleName: order.responsibleName.toString(),
      responsibleMobile: order.responsibleMobile.toString(),
      responsibleEmail: order.responsibleEmail.toString(),
      numberOfVisitors: order.numberOfVisitors!,
      visitReason: order.visitReason.toString(),
      requestStatusId: order.requestStatusId!,
    );
    await getOrderVisit();
    Alert.success("تم إزلة الطلب من الأرشيف");
  Get.to(() => const MyOrderRequestVisitScreen());
  }
}
