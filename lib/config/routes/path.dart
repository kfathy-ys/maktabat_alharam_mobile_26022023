import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/follow_answering_librarian/view.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/new_order/view.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/view.dart';
import 'package:maktabat_alharam/screens/all_services/pages/reserve_article_research/view.dart';

class AppPages {

  static final routes = [
    GetPage(
      name:  "/FollowAnsweringLibrarian",
      page: () => FollowAnsweringLibrarian(),
    ),  GetPage(
      name:  "/AskLibrarian",
      page: () => AskLibrarian(),
    ),
    GetPage(
      name:  "/AskLibrarianNewOrder",
      page: () => AskLibrarianNewOrder(),
    ),
    GetPage(
      name:  "/ReserveResearchRetreatScreen",
      page: () => ReserveResearchRetreatScreen(),
    ),

  ];
}
