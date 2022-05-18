import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/config/dio_helper/dio.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/archive/cubit/ask_archive_cubit.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/archive/models/model.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/archive/view.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/my_order/model/models.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/my_order/view.dart';
import 'package:maktabat_alharam/screens/widgets/alart.dart';
import 'package:meta/meta.dart';
import 'package:queen/core/helpers/prefs.dart';

import '../../../../../widgets/alerts.dart';

part 'my_order_ask_state.dart';

class MyOrderAskCubit extends Cubit<MyOrderAskState> {
  final AskArchiveCubit askArchiveCubit;

  MyOrderAskCubit(this.askArchiveCubit) : super(MyOrderAskInitial()) {
    getOrderAsk();
  }

  Future<void> getOrderAsk() async {
    emit(MyOrderAskLoading());
    try {
      final userId = Prefs.getString("userId");
      final res = await NetWork.get('Inquiry/GetAllInquiries/$userId');

      if (res.data['status'] == 0 ||
          res.data['status'] == -1 ||
          res.statusCode != 200) {
        throw res.data['message'];
      }

      emit(MyOrderAskSuccess(askOrderModel: AskOrderModel.fromJson(res.data)));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(MyOrderAskError(msg: e.toString()));
    }
  }

  Future<void> addToArchiveAsk(AskMyOrder order) async {
    await askArchiveCubit.addedAskToArchive(
      id: order.id!,
      visitorName: order.visitorName.toString(),
      visitorEmail: order.visitorEmail.toString(),
      visitorMobile: order.visitorMobile.toString(),
      visitorMessage: order.visitorMessage.toString(),
      type: order.type!,
    );
    await getOrderAsk();
    Alert.success( "تم إضافة الطلب إلي الأرشيف");
    Get.to(() => const ArchiveAskLibrarianScreen());
  }

  Future<void> removeFromArchiveAsk(AskArchiveData order) async {
    await askArchiveCubit.removeAskFromArchive(
      id: order.id!,
      visitorName: order.visitorName.toString(),
      visitorEmail: order.visitorEmail.toString(),
      visitorMobile: order.visitorMobile.toString(),
      visitorMessage: order.visitorMessage.toString(),
      type: order.type!,
    );
    await getOrderAsk();
    Alert.success( "تم إزلة الطلب من الأرشيف");
Get.to(() =>  MyOrderAskLibrarian());
  }
}
