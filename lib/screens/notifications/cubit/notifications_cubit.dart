import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:queen/core/helpers/prefs.dart';

import '../../../config/dio_helper/dio.dart';
import '../models/model.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(NotificationsInitial()) {
    getNotifications();
  }

  Future<void> getNotifications() async {
    emit(NotificationsLoading());
    try {
      final userId = Prefs.getString("userId");
      final res = await NetWork.get('Notification/$userId');

      if (res.data['status'] == 0 ||
          res.data['status'] == -1 ||
          res.statusCode != 200) {
        throw res.data['message'];
      }

      emit(NotificationsSuccess(
          allNotifications: AllNotifications.fromJson(res.data)));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());

      emit(NotificationsError(msg: e.toString()));
    }
  }
}
