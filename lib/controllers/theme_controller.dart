import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController {
  ThemeMode getThemeMode() {
    //TODO:SharedPreferencesの保存データを読み込んで返す、なければシステムのテーマを返す
    return ThemeMode.system;
  }

  void changeTheme() {
    if (Get.isDarkMode) {
      Get.changeThemeMode(ThemeMode.light);
    } else {
      Get.changeThemeMode(ThemeMode.dark);
    }
  }
}
