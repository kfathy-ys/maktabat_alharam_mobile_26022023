import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/follow_answering_librarian/view.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/view.dart';

class AppPages {

  static final routes = [
    GetPage(
      name:  "/FollowAnsweringLibrarian",
      page: () => FollowAnsweringLibrarian(),
    ),  GetPage(
      name:  "/AskLibrarian",
      page: () => AskLibrarian(),
    ),

  ];
}
