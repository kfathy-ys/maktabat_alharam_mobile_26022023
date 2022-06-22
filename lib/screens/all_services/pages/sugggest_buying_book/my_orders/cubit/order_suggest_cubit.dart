import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:get/route_manager.dart';
import 'package:maktabat_alharam/config/dio_helper/dio.dart';
import 'package:maktabat_alharam/screens/all_services/pages/sugggest_buying_book/archive/cubit/archive_cubit.dart';
import 'package:maktabat_alharam/screens/all_services/pages/sugggest_buying_book/archive/models/model.dart';
import 'package:maktabat_alharam/screens/all_services/pages/sugggest_buying_book/archive/view.dart';
import 'package:maktabat_alharam/screens/all_services/pages/sugggest_buying_book/my_orders/models/model.dart';
import 'package:maktabat_alharam/screens/all_services/pages/sugggest_buying_book/my_orders/view.dart';
import 'package:meta/meta.dart';
import 'package:queen/core/helpers/prefs.dart';

import '../../../../../widgets/alerts.dart';

part 'order_suggest_state.dart';

/// Suggestion Order Link
/// Suggestion/GetAllSuggestions/37678663-9902-41a9-a502-733792bd832d

class OrderSuggestCubit extends Cubit<OrderSuggestState> {
  final ArchiveCubit archiveCubit;

  OrderSuggestCubit(this.archiveCubit) : super(OrderSuggestInitial()) {
    getOrderSuggest();
  }

  Future<void> getOrderSuggest() async {
    emit(OrderSuggestLoading());
    try {
      final userId = Prefs.getString("userId");
      final res = await NetWork.get('Suggestion/GetAllSuggestions/$userId');

      if (res.data['status'] == 0 ||
          res.data['status'] == -1 ||
          res.statusCode != 200) {
        throw res.data['message'];
      }

      emit(OrderSuggestSuccess(
          orderSuggestModel: OrderSuggestModel.fromJson(res.data)));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(OrderSuggestError(e.toString()));
    }
  }

  Future<void> addToArchive(OrderModel order) async {
    await archiveCubit.addedToArchive(
        id: order.id!,
        typeBookId: order.bookTypeId!,
        visitorName: order.visitorName.toString(),
        visitorEmail: order.visitorEmail.toString(),
        visitorMobile: order.visitorMobile.toString(),
        qualifications: order.qualifications.toString(),
        bookTitle: order.suggestedBookTitle.toString(),
        authorName: order.authorName.toString(),
        publisherName: order.publisherName.toString(),
        placeOfPublication: order.placeOfPublication.toString(),
        yearOfPublication: order.yearOfPublication.toString(),
        standardBookNumber: order.standardBookNumber.toString(),
        additionalInformation: order.additionalInformation.toString(),
        createdDate: order.createdDate.toString());
    await getOrderSuggest();
    Alert.success("تم إضافة الطلب إلي الأرشيف");
    Get.to(() => const ArchiveSuggestBuyBookScreen());
  }

  Future<void> removeFromArchive(OrderArchive order) async {
    await archiveCubit.removeFromArchive(
      id: order.id!,
      typeBookId: order.bookTypeId!,
      visitorName: order.visitorName.toString(),
      visitorEmail: order.visitorEmail.toString(),
      visitorMobile: order.visitorMobile.toString(),
      qualifications: order.qualifications.toString(),
      bookTitle: order.suggestedBookTitle.toString(),
      authorName: order.authorName.toString(),
      publisherName: order.publisherName.toString(),
      placeOfPublication: order.placeOfPublication.toString(),
      yearOfPublication: order.yearOfPublication.toString(),
      standardBookNumber: order.standardBookNumber.toString(),
      additionalInformation: order.additionalInformation.toString(),
      createdDate: order.createdDate.toString(),
    );
    await getOrderSuggest();
    Alert.success("تم إزلة الطلب من الأرشيف");
    Get.to(() => const MyOrdersSuggestBuyBookScreen());
  }
}
