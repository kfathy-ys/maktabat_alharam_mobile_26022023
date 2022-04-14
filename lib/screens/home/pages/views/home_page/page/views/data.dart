import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/view.dart';
import 'package:maktabat_alharam/screens/drawer/page/contect_us/view.dart';
import 'package:maktabat_alharam/screens/home/pages/views/home_page/page/views/list_model.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';

class OurServicesContent {
  List<OurServicesModel> ourServices = [
    OurServicesModel(
      routeName: "/AskLibrarian",
      title: "askRelationLibrary".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(AssetImage("assets/image/homefileQuestion.png"),
          color: kSmallIconColor),
    ),
    OurServicesModel(
      routeName: "/AskLibrarian",

      title: "askLibrarian".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(AssetImage("assets/image/homeemptyQuestion.png"),
          color: kSmallIconColor),
    ),
    OurServicesModel(
      routeName: "/AskLibrarian",

      title: "libraryExternalServices".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(AssetImage("assets/image/homeoutKindom.png"),
          color: kSmallIconColor),
    ),
    OurServicesModel(
      routeName: "/AskLibrarian",

      title: "SuggestionBuyBook".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(
        AssetImage(
          "assets/image/homesuggest.png",
        ),
        color: kSmallIconColor,
      ),
    ),
    OurServicesModel(
      routeName: "/AskLibrarian",

      title: "Inter-LibraryExchangeAndLending".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(
        AssetImage("assets/image/homeoutKindom.png"),
        color: kSmallIconColor,
      ),
    ),
  ];
}
class OurServicesGridCard {
  List<OurServicesModel> ourServicesGrid = [
    OurServicesModel(
      routeName: "/FollowAnsweringLibrarian",

      title: "Inter-LibraryExchangeAndLending".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(
        AssetImage("assets/image/bigBook.png"),
        color: kSmallIconColor,
      ),
    ),
    OurServicesModel(
      routeName: "/FollowAnsweringLibrarian",
      title: "RequestDepositScientificThesis".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(
        AssetImage("assets/image/bigMessage.png"),
        color: kSmallIconColor,
      ),
    ),
    OurServicesModel(
      routeName: "/FollowAnsweringLibrarian",
      title: "SelectiveBroadcastingInformation".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(
        AssetImage("assets/image/bigcamera.png"),
        color: kSmallIconColor,
      ),
    ),
    OurServicesModel(
      routeName: "/FollowAnsweringLibrarian",
      title: "manuscriptRequest".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(
        AssetImage("assets/image/bigpincel.png"),
        color: kSmallIconColor,
      ),
    ),
    OurServicesModel(
      routeName: "/FollowAnsweringLibrarian",

      title: "RequestReserveArticleOrResearchRetreat".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(AssetImage("assets/image/bigRquestSubjectSientific.png"),
          color: kSmallIconColor),
    ),
    OurServicesModel(
      routeName: "/FollowAnsweringLibrarian",

      title: "RequestVisit".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(AssetImage("assets/image/bigarrowRight.png"),
          color: kSmallIconColor),
    ),
    OurServicesModel(
      routeName: "/AskLibrarian",

      title: "askRelationLibrary".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(AssetImage("assets/image/BigFillQuestion.png"),
          color: kSmallIconColor),
    ),
    OurServicesModel(
      routeName: "/AskLibrarian",

      title: "askLibrarian".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(AssetImage("assets/image/BigEmptyQuestion.png"),
          color: kSmallIconColor),
    ),
    OurServicesModel(
      routeName: "/AskLibrarian",
      title: "libraryExternalServices".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(AssetImage("assets/image/BigSevrices.png"),
          color: kSmallIconColor),
    ),
    OurServicesModel(
      routeName: "/AskLibrarian",
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
    ),

    OurServicesModel(
      routeName: "/FollowAnsweringLibrarian",


      title: "SuggestionBuyBook".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(
        AssetImage(
          "assets/image/bigBuyBook.png",
        ),
        color: kSmallIconColor,
      ),
    ),





  ];
}
