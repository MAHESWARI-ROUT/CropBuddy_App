import 'package:cropco/model/device_utility.dart';
import 'package:cropco/views/authentications/forget_password_view.dart';
import 'package:cropco/views/authentications/signup_view.dart';
import 'package:cropco/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: CDeviceUtils.getAppbarHeight(),
            left: 20,
            right: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: CDeviceUtils.getAppbarHeight(),
              ),
              Image.asset(
                'assets/images/brocoli.jpg',
                height: 50,
                width: 50,
                alignment: Alignment.topLeft,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Welcom Back!',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                       CTextField(
                        text: 'E-mail',
                        icon: Icons.email,
                        controller: emailController,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                       CTextField(
                        text: 'password',
                        icon: Icons.lock,
                        icon2: Icons.visibility_off,
                        icon3: Icons.visibility,
                        controller: passwordController,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: true,
                                onChanged: (value) {},
                                activeColor: const Color(0xFF667E06),
                              ),
                              const Text('Remenber me')
                            ],
                          ),
                          const Spacer(),
                          TextButton(
                              onPressed: () => Get.to(() => const ForgetPasswordView()),
                              child: const Text(
                                'Forget Password?',
                                style: TextStyle(color: Color(0xFF667E06)),
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                backgroundColor: const Color(0xFF667E06)),
                            onPressed: () {},
                            child: const Text(
                              'Sign In',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                side: const BorderSide(
                                    color: Color(0xFF667E06), width: 2)),
                            onPressed: () => Get.to(() => const SignupView()),
                            child: const Text(
                              'Create Account',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF667E06)),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                children: [
                  Flexible(
                    child: Divider(
                      thickness: 1,
                      indent: 60,
                      endIndent: 5,
                      //color: Color.fromARGB(255, 161, 160, 160),
                    ),
                  ),
                  Text(
                    'Or Sign In with',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Flexible(
                    child: Divider(
                      thickness: 1,
                      indent: 5,
                      endIndent: 60,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Image(
                        height: 20,
                        width: 20,
                        fit: BoxFit.fill,
                        image: AssetImage("assets/images/search.png"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Image(
                        height: 20,
                        width: 20,
                        fit: BoxFit.fill,
                        image: AssetImage("assets/images/communication.png"),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
