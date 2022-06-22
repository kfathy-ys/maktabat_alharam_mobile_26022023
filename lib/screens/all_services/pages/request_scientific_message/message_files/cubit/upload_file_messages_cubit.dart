import 'package:bloc/bloc.dart';

part 'upload_file_messages_state.dart';

class UploadFileMessagesCubit extends Cubit<UploadFileMessagesState> {
  UploadFileMessagesCubit() : super(UploadFileMessagesInitial());
//   Future<void> uploadFileToResearch(
//
// File image
//
//
//   ) async {
//     try {
//
//
//
//       final res =
//       await NetWork.post('ThesisDepositionRequest/CreateOrUpdateThesisDepositionRequestWithAttach', body: FormData.fromMap({
//         'file': await image.toMultiPart(),
//       }) );
//       if (res.data['status'] == 0 || res.data['status'] == -1) {
//         throw res.data['message'];
//       }
//
//       emit(UploadFileMessagesSuccess(myOrdersToResearch:
//       MyOrdersToResearch.fromJson(res.data)));
//
//
//     } catch (e, st) {
//       log(e.toString());
//       log(st.toString());
//       emit(UploadFileMessagesError(msg: e.toString()));
//     }
//   }

}
