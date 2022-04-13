
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/all_services/pages/ask_Librarian/view.dart';
import 'package:maktabat_alharam/screens/drawer/page/contect_us/view.dart';
import 'package:maktabat_alharam/screens/home/pages/views/home_page/page/views/list_model.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';



class OurServicesContent {
  List<OurServicesModel> ourServices = [
    OurServicesModel(
      route:AskLibrarian(),
      title: "askRelationLibrary".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon:   const ImageIcon(
        AssetImage("assets/image/homefileQuestion.png"),color: kSmallIconColor),
    ),
    OurServicesModel(
      route:AskLibrarian(),
      title: "askLibrarian".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon:   const ImageIcon(
        AssetImage("assets/image/homeemptyQuestion.png"),color: kSmallIconColor),
    ),
    OurServicesModel(
      route:AskLibrarian(),
      title: "libraryExternalServices".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon:   const ImageIcon(
        AssetImage("assets/image/homeoutKindom.png"),color: kSmallIconColor),
    ),
    OurServicesModel(
      route:AskLibrarian(),
      title: "SuggestionBuyBook".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon:   const ImageIcon(
        AssetImage("assets/image/homesuggest.png",),color: kSmallIconColor,),
    ),
    OurServicesModel(

      route:AskLibrarian(),

      title: "Inter-LibraryExchangeAndLending".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon:   const ImageIcon(
        AssetImage("assets/image/homeoutKindom.png"),color: kSmallIconColor,),
    ),

  ];
}

class OurServicesGridCard {
  List<OurServicesModel> ourServicesGrid = [
    OurServicesModel(

      route:AskLibrarian(),

      title: "askRelationLibrary".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon:   const ImageIcon(
          AssetImage("assets/image/BigFillQuestion.png"),color: kSmallIconColor),
    ),
    OurServicesModel(

      route:AskLibrarian(),

      title: "askLibrarian".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon:   const ImageIcon(
          AssetImage("assets/image/BigEmptyQuestion.png"),color: kSmallIconColor),
    ),
    OurServicesModel(

      route:AskLibrarian(),

      title: "libraryExternalServices".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon:   const ImageIcon(
          AssetImage("assets/image/BigSevrices.png"),color: kSmallIconColor),
    ),
    OurServicesModel(

      route:AskLibrarian(),

      title: "SuggestionBuyBook".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon:   const ImageIcon(
        AssetImage("assets/image/bigBuyBook.png",),color: kSmallIconColor,),
    ),
    OurServicesModel(

      route:AskLibrarian(),

      title: "Inter-LibraryExchangeAndLending".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon:   const ImageIcon(
        AssetImage("assets/image/bigBook.png"),color: kSmallIconColor,),
    ),


    OurServicesModel(

      route:AskLibrarian(),

      title: "askRelationLibrary".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon:   const ImageIcon(
          AssetImage("assets/image/BigFillQuestion.png"),color: kSmallIconColor),
    ),
    OurServicesModel(

      route:AskLibrarian(),

      title: "askLibrarian".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon:   const ImageIcon(
          AssetImage("assets/image/BigEmptyQuestion.png"),color: kSmallIconColor),
    ),
    OurServicesModel(

      route:AskLibrarian(),

      title: "libraryExternalServices".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon:   const ImageIcon(
          AssetImage("assets/image/BigSevrices.png"),color: kSmallIconColor),
    ),
    OurServicesModel(

      route:AskLibrarian(),

      title: "SuggestionBuyBook".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon:   const ImageIcon(
        AssetImage("assets/image/bigBuyBook.png",),color: kSmallIconColor,),
    ),
    OurServicesModel(

      route:ContactUsScreen(),

      title: "Inter-LibraryExchangeAndLending".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon:   const ImageIcon(
        AssetImage("assets/image/bigBook.png"),color: kSmallIconColor,),
    ),

  ];
}
