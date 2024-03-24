import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskapp/features/auth/controller/login_controller.dart';
import 'package:taskapp/utils/color_contraints.dart';
import 'package:taskapp/utils/customtextfeild.dart';

class LoginScreen extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/img.png"),
                      fit: BoxFit.fill),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 100,
                        ),
                        const Text(
                          "Welcome Back",
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Login to access your account",
                          style: TextStyle(
                              fontSize: 16, color: ColorConstraint.greyColor),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Email address",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: ColorConstraint.greyColor),
                            ),
                          ),
                        ),
                        // TextField(
                        //   controller: loginController.username,
                        //   decoration: const InputDecoration(labelText: 'Username'),
                        // ),
                        CustomTextField(
                          controller: loginController.username,
                          decoration: const InputDecoration(
                            labelText: 'Username',
                          ),
                          text: "Enter your Email",
                        ),
                        const SizedBox(height: 20),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Password",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: ColorConstraint.greyColor),
                              ),
                            )),
                        // TextField(
                        //   controller: loginController.password,
                        //   obscureText: true,
                        //   decoration: const InputDecoration(labelText: 'Password'),
                        // ),
                        CustomTextField(
                          controller: loginController.password,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                          ),
                          text: "Enter your Password",
                        ),
                        const SizedBox(height: 40),
                        SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () => loginController.login(),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: ColorConstraint.whiteColor,
                              backgroundColor: ColorConstraint.blueColor,
                            ),
                            child: const Text(
                              'Login',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "or",
                          style: TextStyle(
                              fontSize: 20, color: ColorConstraint.greyColor),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 50,
                                width: 150,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/images/btn.png"),
                                    const Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Text(
                                        "Google",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: 50,
                                width: 150,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/images/face.png"),
                                    const Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Text(
                                        "Facebook",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
