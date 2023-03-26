import 'dart:ui';

import 'package:get/get.dart';
import 'package:getx_sample/data/app_translations.dart';

class LocaleController {
  Locale? getLocale() {
    // TODO:SharedPreferencesの保存データを読み込んで返す、なければデバイスの言語を返す
    return Get.deviceLocale;
  }

  void changeLocale() {
    if (Get.locale == AppTranslations.jaJP) {
      Get.updateLocale(AppTranslations.enUS);
    } else {
      Get.updateLocale(AppTranslations.jaJP);
    }
  }
}
