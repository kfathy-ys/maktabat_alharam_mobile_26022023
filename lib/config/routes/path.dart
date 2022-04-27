import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/follow_answering_librarian/view.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/my_order/view.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/view.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_scientific_message/my_order/view.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_scientific_message/view.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_visit/follow_request_visit/view.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_visit/my_orders/view.dart';
import 'package:maktabat_alharam/screens/all_services/pages/request_visit/view.dart';
import 'package:maktabat_alharam/screens/all_services/pages/reserve_article_research/follow_reserved_retreated/view.dart';
import 'package:maktabat_alharam/screens/all_services/pages/reserve_article_research/my_order/view.dart';
import 'package:maktabat_alharam/screens/all_services/pages/reserve_article_research/view.dart';
import 'package:maktabat_alharam/screens/all_services/pages/sugggest_buying_book/my_orders/view.dart';
import 'package:maktabat_alharam/screens/all_services/pages/sugggest_buying_book/view.dart';

class AppPages {

  static final routes = [
    GetPage(
      name:  "/MyOrderAskLibrarian",
      page: () => MyOrderAskLibrarian(),
    ),  GetPage(
      name:  "/AskLibrarian",
      page: () => AskLibrarian(),
    ),
    GetPage(
      name:  "/MyOrdersScientificMessage",
      page: () => MyOrdersScientificMessage(),
    ),
   GetPage(
  name:  "/PutScientificMessage",
  page: () => PutScientificMessage(),
  ),

    GetPage(
      name:  "/ReserveResearchRetreatScreen",
      page: () => ReserveResearchRetreatScreen(),
    ),
    GetPage(
      name:  "/MyOrdersSuggestBuyBookScreen",
      page: () =>MyOrdersSuggestBuyBookScreen(),
    ),


    GetPage(
      name:  "/MyOrderRequestVisitScreen",
      page: () =>MyOrderRequestVisitScreen(),
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
      name:  "/MyOrderReserveArticleResearch",
      page: () =>MyOrderReserveArticleResearch(),
    ),
  ];
}
