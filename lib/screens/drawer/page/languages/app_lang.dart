import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/config/database.dart';

class AppLanguage extends GetxController {
  var appLocale = 'ar';

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    LocalStorage localStorage = LocalStorage();

    // ignore: unnecessary_null_comparison
    appLocale = await localStorage.languageSelected ?? 'ar';
    update();
    Get.updateLocale(Locale(appLocale));
  }

  void changeLanguage(String type) async {
    LocalStorage localStorage = LocalStorage();

    if (appLocale == type) {
      return;
    }
    if (type == 'ar') {
      appLocale = 'ar';
      localStorage.saveLanguageToDisk('ar');
    } else {
      appLocale = 'en';
      localStorage.saveLanguageToDisk('en');
    }
    update();
  }
}