import 'package:flutter/material.dart';
import 'package:flutter_ecomerce_23/app/modules/login/controllers/login_controller.dart';
import 'package:flutter_ecomerce_23/app/routes/app_pages.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  LoginView({super.key});
  final _formkey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                ElevatedButton(
                    onPressed: () {
                      Get.toNamed(Routes.MAIN);
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(fontSize: 20),
                    ))
              ]),
              Spacer(),
              Text(
                "welcome to login ".toUpperCase(),
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Email",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email can't be null";
                  }
                  if (!GetUtils.isEmail(value)) {
                    return "Email invalide";
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Password",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password can't be null";
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      final email = _emailController.text;

                      final password = _passwordController.text;
                      controller.login(email: email, password: password);
                      Get.offAllNamed(Routes.MAIN);
                    }
                  },
                  child: Text("Login")),
              Row(
                children: [
                  Text(
                    "Don't have account",
                    style: TextStyle(color: Colors.black),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.toNamed(Routes.REGISTER);
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(color: Colors.blue),
                      )),
                ],
              ),
              Spacer()
            ],
          ),
        ),
      ),
    ));
  }
}
