import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:queen/core/helpers/prefs.dart';

import '../../../../../../config/dio_helper/dio.dart';
import '../../../../../widgets/alerts.dart';
import '../../archive/cubit/archived_order_cubit.dart';
import '../../archive/models/model.dart';
import '../../archive/view.dart';
import '../models/model.dart';
import '../view.dart';

part 'my_order_research_state.dart';

class MyOrderResearchCubit extends Cubit<MyOrderResearchState> {
  ArchivedOrderCubit archivedOrderCubit;

  MyOrderResearchCubit(this.archivedOrderCubit)
      : super(MyOrderResearchInitial()) {
    getOrderResearch();
  }

  Future<void> getOrderResearch() async {
    emit(MyOrderResearchLoading());
    try {
      final userId = Prefs.getString("userId");
      final res =
          await NetWork.get('ResearchRequest/GetAllResearchRequests/$userId');

      if (res.data['status'] == 0 ||
          res.data['status'] == -1 ||
          res.statusCode != 200) {
        throw res.data['message'];
      }

      emit(MyOrderResearchSuccess(
          orderResearchModel: OrderResearchModel.fromJson(res.data)));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(MyOrderResearchError(msg: e.toString()));
    }
  }

  Future<void> addToArchiveResearch(MyOrdersToResearch order) async {
    await archivedOrderCubit.addedResearchToArchive(
        id: order.id!,
        libraryId: order.libraryId!,
        requestTypeId: order.requestTypeId!,
        responsibleGradeId: order.responsibleGradeId!,
        responsibleName: order.responsibleName.toString(),
        responsibleMobile: order.responsibleMobile.toString(),
        responsibleEmail: order.responsibleMobile.toString(),
        callNum: order.callNum.toString(),
        requestStatusId: order.requestStatusId!,
        createdDate: order.createdDate.toString(),
        dateFrom: order.dateFrom.toString(),
        dateTo: order.dateTo.toString(),
        roomId: order.roomId!.toInt());
    await getOrderResearch();
    Alert.success("تم إضافة الطلب إلي الأرشيف");
    Get.to(() => const ArchiveReserveArticleScreen());
  }

  Future<void> removeFromArchiveResearch(MyArchivedOrder order) async {
    await archivedOrderCubit.removeResearchFromArchive(
        id: order.id!,
        libraryId: order.libraryId!,
        requestTypeId: order.requestTypeId!,
        responsibleGradeId: order.responsibleGradeId!,
        responsibleName: order.responsibleName.toString(),
        responsibleMobile: order.responsibleMobile.toString(),
        responsibleEmail: order.responsibleMobile.toString(),
        callNum: order.callNum.toString(),
        requestStatusId: order.requestStatusId!,
        createdDate: order.createdDate.toString(),
        dateFrom: order.dateFrom.toString(),
        dateTo: order.dateTo.toString(),
        roomId: order.roomId!.toInt());

    await getOrderResearch();
    Alert.success("تم إزلة الطلب من الأرشيف");
    Get.to(() => const MyOrderReserveArticleResearch());
  }
}
