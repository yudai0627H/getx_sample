import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample/controllers/locale_controller.dart';
import 'package:getx_sample/controllers/theme_controller.dart';
import 'package:getx_sample/data/app_translations.dart';
import 'package:getx_sample/pages/add_todo_page.dart';
import 'package:getx_sample/pages/home_page.dart';
import 'package:getx_sample/services/storage_service.dart';

import 'controller/count_controller.dart';
import 'counter_page.dart';
import 'data/app_theme.dart';
import 'other.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageService.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final themeController = Get.put(ThemeController());
  final localeController = Get.put(LocaleController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeController.getThemeMode(),
      translations: AppTranslations(),
      locale: localeController.getLocale(),
      fallbackLocale: AppTranslations.jaJP,
      defaultTransition: Transition.noTransition,
      initialRoute: '/home',
      getPages: [
        GetPage(name: "/home", page: () => HomePage()),
        GetPage(
            name: "/todo",
            // パラメータが渡されていなければtodoIdはnullなので新規作成画面に
            page: () => AddTodoPage(
                  todoId: Get.parameters["id"],
                )),
      ],
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final Controller c = Get.put(Controller());

    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text("Clicks: ${c.count}")),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text("Go to Other"),
              onPressed: () => Get.to(Other()),
            ),
            ElevatedButton(
                onPressed: () => Get.to(CounterPage()),
                child: const Text("カウンターのやつ"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: c.increment, child: const Icon(Icons.add)),
    );
  }
}
