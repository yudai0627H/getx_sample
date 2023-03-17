import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = Get.put(LoginController());

  @override
  void initState() {
    super.initState();
    controller.status.listen((status) {
      if (status == FormStatus.success) {
        Navigator.pushReplacementNamed(context, '/data');
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LOGIN'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller.emailController,
              decoration: const InputDecoration(labelText: 'E-mail'),
            ),
            TextField(
              controller: controller.passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              child: const Text('login'),
              onPressed: () => controller.login(controller.emailController.text,
                  controller.passwordController.text),
            ),
            const SizedBox(height: 30),
            Obx(() {
              final textColor = controller.status.value == FormStatus.error
                  ? Colors.red
                  : null;
              return Text(
                controller.message.string,
                style: TextStyle(color: textColor),
              );
            }),
          ],
        ),
      ),
    );
  }
}
