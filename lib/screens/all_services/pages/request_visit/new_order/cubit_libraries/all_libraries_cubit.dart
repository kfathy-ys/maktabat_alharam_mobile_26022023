import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../../config/dio_helper/dio.dart';
import '../models/all_libraries_model.dart';

part 'all_libraries_state.dart';

class AllLibrariesCubit extends Cubit<AllLibrariesState> {
  AllLibrariesCubit() : super(AllLibrariesInitial()) {
    getAllAvailableLibrariesVisit();
  }

  Future<void> getAllAvailableLibrariesVisit() async {
    emit(AllLibrariesLoading());
    try {
      final res = await NetWork.get('Library/GetAllLibraries');

      if (res.data['status'] == 0 ||
          res.data['status'] == -1 ||
          res.statusCode != 200) {
        throw res.data['message'];
      }

      emit(AllLibrariesSuccess(
          allLibrariesModel: AllLibrariesModel.fromJson(res.data)));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(AllLibrariesError(msg: e.toString()));
    }
  }
}
