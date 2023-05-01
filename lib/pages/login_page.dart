import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routing/configs/storage.dart';
import 'package:routing/pages/dashboard.dart';

class LoginPage extends GetResponsiveView<LoginController> {
  static const routeName = '/login';

  LoginPage({super.key});


  @override
  Widget? phone() {
    return SafeArea(
      child: Scaffold(
        body: Obx(
              ()=> Form(
            key: controller.formKey,
            autovalidateMode: controller.autoValidateMode.value,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 50),
              children: [
                const Text(
                  "LOGIN",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  controller: controller.email,
                  validator: (email){
                    if (email == null) return "required";
                    if (email.isEmpty) {
                      return "required";
                    } else if (!GetUtils.isEmail(email.trim())) {
                      return "invalid email id";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Enter email',
                    labelStyle:
                    const TextStyle(fontSize: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 1.2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 1.2,
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  controller: controller.password,
                  validator: (data){
                    if (data == null) return "required";
                    if (data.toString().trim().isEmpty) return "required";
                    if (data is Iterable || data is Map) {
                      if (data.isEmpty) return "required";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Enter password',
                    labelStyle:
                    const TextStyle(fontSize: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 1.2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 1.2,
                      ),
                    ),
                  ),
                ).paddingOnly(top: 22, bottom: 22),
                ElevatedButton(
                  onPressed: controller.login,
                  child: const Text('Login'),
                )
              ],
            ),
          ),
        ),
      ),
    );

  }
  @override
  Widget desktop() {
    return Scaffold(
      body: Center(
        child: Obx(
          ()=> Form(
            key: controller.formKey,
            autovalidateMode: controller.autoValidateMode.value,
            child: SimpleDialog(
              title: const Center(child: Text('Login')),
              contentPadding: const EdgeInsets.all(30),
                children: [
                  TextFormField(
                    controller: controller.email,
                    validator: (email){
                      if (email == null) return "required";
                      if (email.isEmpty) {
                        return "required";
                      } else if (!GetUtils.isEmail(email.trim())) {
                        return "invalid email id";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Enter email',
                      labelStyle:
                          const TextStyle(fontSize: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 1.2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 1.2,
                        ),
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Icon(Icons.email),
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: controller.password,
                    validator: (data){
                      if (data == null) return "required";
                        if (data.toString().trim().isEmpty) return "required";
                      if (data is Iterable || data is Map) {
                        if (data.isEmpty) return "required";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Enter password',
                      labelStyle:
                          const TextStyle(fontSize: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 1.2,
                        ),
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Icon(Icons.lock),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 1.2,
                        ),
                      ),
                    ),
                    obscureText: true,
                  ).paddingOnly(top: 22, bottom: 22),
                  ElevatedButton(
                    onPressed: controller.login,
                    child: const Text('Login'),
                  )
                ],
              ),
            ),
          ),
        ),
    );
  }
}

class LoginBinding extends Bindings {
  late LoginController loginController;

  @override
  void dependencies() {
    loginController = Get.put(LoginController());
  }
}

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late Rx<AutovalidateMode> autoValidateMode;

  @override
  void onInit() {
    autoValidateMode = Rx<AutovalidateMode>(AutovalidateMode.disabled);
    super.onInit();
  }
  void login() {
    final state = formKey.currentState;
    if (state == null) return;
    if (!state.validate()) {
      autoValidateMode.value = AutovalidateMode.always;
    } else {
      state.save();
    if (password.text == "12345") {
      Storage.storeAccessToken("12345");
      Get.rootDelegate.offNamed(DashboardPage.routeName);
    }
    }
  }
}
