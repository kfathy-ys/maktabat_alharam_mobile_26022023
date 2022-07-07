import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_scientific_message/my_order/models/model.dart';
import 'package:meta/meta.dart';
import 'package:queen/core/helpers/prefs.dart';

import '../../../../../../config/dio_helper/dio.dart';
import '../../../../../widgets/alerts.dart';
import '../../archive/cubit/archived_thesis_cubit.dart';
import '../../archive/models/model.dart';
import '../../archive/view.dart';
import '../view.dart';

part 'order_thesis_state.dart';

class OrderThesisCubit extends Cubit<OrderThesisState> {
  ArchivedThesisCubit archivedThesisCubit;

  OrderThesisCubit(this.archivedThesisCubit) : super(OrderThesisInitial()) {
    getOrderThesis();
  }

  Future<void> getOrderThesis() async {
    emit(OrderThesisLoading());
    try {
      final userId = Prefs.getString("userId");
      final res = await NetWork.get(
          'ThesisDepositionRequest/GetAllThesisDepositionRequests/$userId');

      if (res.data['status'] == 0 ||
          res.data['status'] == -1 ||
          res.statusCode != 200) {
        throw res.data['message'];
      }

      emit(OrderThesisSuccess(
          orderThesisModel: OrderThesisModel.fromJson(res.data)));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(OrderThesisError(msg: e.toString()));
    }
  }

  Future<void> addToArchiveThesis(MyOrderThesis order) async {
    await archivedThesisCubit.addedThesisToArchive(
      id: order.id!,
      universityId: order.universityId!,
      applicantName: order.applicantName.toString(),
      faculty: order.faculty.toString(),
      department: order.department.toString(),
      mobile: order.mobile.toString(),
      email: order.email.toString(),
      thesisData: order.thesisData!,
      thesisTitle: order.thesisTitle.toString(),
      scientificDegree: order.scientificDegree!,
      yearOfDiscussion: order.yearOfDiscussion!,
      numberOfPages: order.numberOfPages!,
      numberOfParts: order.numberOfParts!,
      requestStatusId: order.requestStatusId!,
      createdDate: order.createdDate!,
      thesisFile: order.thesisFile.toString(),
      availabilityType: order.availabilityType!,
      isAvailable: order.isAvailable!,
      isAvailableWithChains: order.isAvailableWithChains!,
    );

    await getOrderThesis();
    Alert.success("alertAddToArchive".tr);
    Get.to(() => const ArchiveScientificMessageScreen());
  }

  Future<void> removeFromArchiveThesis(MyArchivedThesis order) async {
    await archivedThesisCubit.removeThesisFromArchive(
      id: order.id!,
      universityId: order.universityId!,
      applicantName: order.applicantName.toString(),
      faculty: order.faculty.toString(),
      department: order.department.toString(),
      mobile: order.mobile.toString(),
      email: order.email.toString(),
      thesisData: order.thesisData!,
      thesisTitle: order.thesisTitle.toString(),
      scientificDegree: order.scientificDegree!,
      yearOfDiscussion: order.yearOfDiscussion!,
      numberOfPages: order.numberOfPages!,
      numberOfParts: order.numberOfParts!,
      requestStatusId: order.requestStatusId!,
      createdDate: order.createdDate!,
      thesisFile: order.thesisFile!,
      availabilityType: order.availabilityType!,
      isAvailable: order.isAvailable!,
      isAvailableWithChains: order.isAvailableWithChains!,
    );

    await getOrderThesis();
    Alert.success( "alertRemoveToArchive".tr);
    Get.to(() => const MyOrdersScientificMessage());
  }
}
