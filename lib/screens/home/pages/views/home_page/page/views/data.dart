import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/home/pages/views/home_page/page/views/list_model.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
enum  Pages{ one ,two ,three ,four  ,five }
class OurServicesContent {
  List<OurServicesModel> ourServices = [
/*
    OurServicesModel(
      routeName: "/FollowAnsweringLibrarian",

      title: "Inter-LibraryExchangeAndLending".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(
        AssetImage("assets/image/bigBook.png"),
        color: kSmallIconColor,
      ),
    ),
*/
    OurServicesModel(
      pages: Pages.one ,
      routeName: "/MyOrdersScientificMessage",
      title: "RequestDepositScientificThesis".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(
        AssetImage("assets/image/bigMessage.png"),
        color: kSmallIconColor,
      ),
    ),
    /*  OurServicesModel(
      routeName: "/FollowAnsweringLibrarian",
      title: "SelectiveBroadcastingInformation".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(
        AssetImage("assets/image/bigcamera.png"),
        color: kSmallIconColor,
      ),
    ),*/
    /*  OurServicesModel(
      routeName: "/FollowAnsweringLibrarian",
      title: "manuscriptRequest".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(
        AssetImage("assets/image/bigpincel.png"),
        color: kSmallIconColor,
      ),
    ),*/
    OurServicesModel(
      pages: Pages.two ,
      routeName: "/MyOrderReserveArticleResearch",

      title: "RequestReserveArticleOrResearchRetreat".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(AssetImage("assets/image/bigRquestSubjectSientific.png"),
          color: kSmallIconColor),
    ),
    OurServicesModel(
      pages: Pages.three ,
      routeName: "/MyOrderAskLibrarian",

      title: "askStaff".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(AssetImage("assets/image/BigEmptyQuestion.png"),
          color: kSmallIconColor),
    ),
    OurServicesModel(
      pages: Pages.four ,
      routeName: "/MyOrdersSuggestBuyBookScreen",


      title: "SuggestionBuyBook".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(
        AssetImage(
          "assets/image/bigBuyBook.png",
        ),
        color: kSmallIconColor,
      ),
    ),
    OurServicesModel(
      pages: Pages.five ,
      routeName: "/MyOrderRequestVisitScreen",

      title: "RequestVisit".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(AssetImage("assets/image/bigarrowRight.png"),
          color: kSmallIconColor),
    ),
    /* OurServicesModel(
      routeName: "/AskLibrarian",

      title: "askRelationLibrary".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(AssetImage("assets/image/BigFillQuestion.png"),
          color: kSmallIconColor),
    ),*/

    /*OurServicesModel(
      routeName: "/AskLibrarian",
      title: "libraryExternalServices".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(AssetImage("assets/image/BigSevrices.png"),
          color: kSmallIconColor),
    ),*/
    /*  OurServicesModel(
      routeName: "/AskLibrarian",
      title: "SuggestionBuyBook".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(
        AssetImage(
          "assets/image/bigBuyBook.png",
        ),
        color: kSmallIconColor,
      ),
    ),*/
    /*  OurServicesModel(
      routeName: "/FollowAnsweringLibrarian",

      title: "BookGiftRequest".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(AssetImage("assets/image/giftright.png"),
          color: kSmallIconColor),
    ),
    OurServicesModel(
      routeName: "/FollowAnsweringLibrarian",


      title: "RequestGiftBook".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(
        AssetImage("assets/image/giftleft.png"),
        color: kSmallIconColor,
      ),
    ),*/

  ];
}
class OurServicesGridCard {
  List<OurServicesModel> ourServicesGrid = [
/*
    OurServicesModel(
      routeName: "/FollowAnsweringLibrarian",

      title: "Inter-LibraryExchangeAndLending".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(
        AssetImage("assets/image/bigBook.png"),
        color: kSmallIconColor,
      ),
    ),
*/
    OurServicesModel(
        pages: Pages.one ,
      routeName: "/MyOrdersScientificMessage",
      title: "RequestDepositScientificThesis".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(
        AssetImage("assets/image/bigMessage.png"),
        color: kSmallIconColor,
      ),
    ),
  /*  OurServicesModel(
      routeName: "/FollowAnsweringLibrarian",
      title: "SelectiveBroadcastingInformation".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(
        AssetImage("assets/image/bigcamera.png"),
        color: kSmallIconColor,
      ),
    ),*/
  /*  OurServicesModel(
      routeName: "/FollowAnsweringLibrarian",
      title: "manuscriptRequest".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(
        AssetImage("assets/image/bigpincel.png"),
        color: kSmallIconColor,
      ),
    ),*/
    OurServicesModel(
        pages: Pages.two ,
      routeName: "/MyOrderReserveArticleResearch",

      title: "RequestReserveArticleOrResearchRetreat".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(AssetImage("assets/image/bigRquestSubjectSientific.png"),
          color: kSmallIconColor),
    ),
    OurServicesModel(
        pages: Pages.three ,
      routeName: "/MyOrderAskLibrarian",

      title: "askStaff".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(AssetImage("assets/image/BigEmptyQuestion.png"),
          color: kSmallIconColor),
    ),
    OurServicesModel(
        pages: Pages.four ,
      routeName: "/MyOrdersSuggestBuyBookScreen",


      title: "SuggestionBuyBook".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(
        AssetImage(
          "assets/image/bigBuyBook.png",
        ),
        color: kSmallIconColor,
      ),
    ),
    OurServicesModel(
        pages: Pages.five ,
      routeName: "/MyOrderRequestVisitScreen",

      title: "RequestVisit".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(AssetImage("assets/image/bigarrowRight.png"),
          color: kSmallIconColor),
    ),
   /* OurServicesModel(
      routeName: "/AskLibrarian",

      title: "askRelationLibrary".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(AssetImage("assets/image/BigFillQuestion.png"),
          color: kSmallIconColor),
    ),*/

    /*OurServicesModel(
      routeName: "/AskLibrarian",
      title: "libraryExternalServices".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(AssetImage("assets/image/BigSevrices.png"),
          color: kSmallIconColor),
    ),*/
  /*  OurServicesModel(
      routeName: "/AskLibrarian",
      title: "SuggestionBuyBook".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(
        AssetImage(
          "assets/image/bigBuyBook.png",
        ),
        color: kSmallIconColor,
      ),
    ),*/
  /*  OurServicesModel(
      routeName: "/FollowAnsweringLibrarian",

      title: "BookGiftRequest".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(AssetImage("assets/image/giftright.png"),
          color: kSmallIconColor),
    ),
    OurServicesModel(
      routeName: "/FollowAnsweringLibrarian",


      title: "RequestGiftBook".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(
        AssetImage("assets/image/giftleft.png"),
        color: kSmallIconColor,
      ),
    ),*/


  ];
}
