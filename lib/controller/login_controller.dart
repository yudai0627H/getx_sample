import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum FormStatus { idle, loading, error, success }

class LoginController extends GetxController {
  final message = 'Please fill out the form.'.obs;
  final status = (FormStatus.idle).obs;
  final emailController = TextEditingController(text: 'oreore@ore.com');
  final passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    status.listen((status) {
      if (status == FormStatus.success) {
        Get.offNamed("/data");
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }

  void login(String email, String password) async {
    status(FormStatus.idle);

    message.value = 'Checking inputs...';

    await wait(seconds: 1);
    _validate(email.trim(), password.trim());

    if (status.value == FormStatus.idle) {
      status(FormStatus.loading);
      message('OK. Loading screen...');
      await wait(seconds: 1);

      // 後述するステータスリスナーが画面遷移を行ってくれる
      status(FormStatus.success);
    }
  }

  void _validate(String email, String password) {
    final isNotEmail = !GetUtils.isEmail(email);
    final isNotPassword = password.length < 8;

    if (isNotEmail || isNotPassword) {
      status(FormStatus.error);
      message('Invalid email or password.');
    }
  }
}

// 通信モック用（別途利用のためクラスの外に置いてます）
Future<void> wait({required int seconds}) async {
  await Future.delayed(Duration(seconds: seconds));
}
