import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  RegisterView({super.key});
  final _formkey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordconfirmationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('RegisterView'),
          centerTitle: true,
        ),
        body: GetBuilder<RegisterController>(
            init: controller,
            builder: (logic) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          controller.image != null
                              ? CircleAvatar(
                                  radius: 60,
                                  backgroundImage: FileImage(controller.image!),
                                )
                              : CircleAvatar(
                                  radius: 60,
                                  backgroundImage:
                                      AssetImage("assets/images/profile.png"),
                                ),
                          IconButton(
                              onPressed: controller.pickimage,
                              icon: Icon(
                                Icons.camera_alt,
                                size: 30,
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Name",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Name can't be null";
                          }
                        },
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
                      TextFormField(
                        controller: _passwordconfirmationController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Password Confirmation",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Confirmation Password can't be null";
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextButton(
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              final email = _emailController.text;
                              final name = _nameController.text;
                              final password = _passwordController.text;
                              final confirmpass =
                                  _passwordconfirmationController.text;
                              if (password != confirmpass) {
                                Get.snackbar(
                                    "message", "Password is not match");
                                return;
                              }
                              controller.register(
                                  email: email,
                                  name: name,
                                  password: password,
                                  confirmpass: confirmpass);
                            }
                          },
                          child: Text("Register")),
                      Row(
                        children: [
                          Text(
                            "Have already an accound",
                            style: TextStyle(color: Colors.black),
                          ),
                          TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(color: Colors.blue),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              );
            }));
  }
}
