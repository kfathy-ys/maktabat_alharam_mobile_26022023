import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/follow_answering_librarian/view.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/view.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_visit/follow_request_visit/view.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_visit/view.dart';
import 'package:maktabat_alharam/screens/all_services/pages/reserve_article_research/follow_reserved_retreated/view.dart';
import 'package:maktabat_alharam/screens/all_services/pages/reserve_article_research/view.dart';
import 'package:maktabat_alharam/screens/all_services/pages/sugggest_buying_book/view.dart';

class AppPages {

  static final routes = [
    GetPage(
      name:  "/FollowAnsweringLibrarian",
      page: () => FollowAnsweringLibrarian(),
    ),  GetPage(
      name:  "/AskLibrarian",
      page: () => AskLibrarian(),
    ),
    // GetPage(
    //   name:  "/AskLibrarianNewOrder",
    //   page: () => AskLibrarianNewOrder(),
    // ),
    GetPage(
      name:  "/ReserveResearchRetreatScreen",
      page: () => ReserveResearchRetreatScreen(),
    ),
    // GetPage(
    //   name:  "/NewOrderToReserveScientificResearch",
    //   page: () =>NewOrderToReserveScientificResearch(),
    // ),

    GetPage(
      name:  "/RequestVisitScreen",
      page: () =>RequestVisitScreen(),
    ),
    GetPage(
      name:  "/FollowRequestVisitScreen",
      page: () =>FollowRequestVisitScreen(),
    ),
    GetPage(
      name:  "/SuggestToBuyBook",
      page: () =>SuggestToBuyBook(),
    ),
    GetPage(
      name:  "/FollowReservedRetreatScreen",
      page: () =>FollowReservedRetreatScreen(),
    ),
  ];
}
