import 'package:cropco/views/authentications/email_varification_view.dart';
import 'package:cropco/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final TextEditingController fnameController = TextEditingController();
  final TextEditingController lnameController = TextEditingController();
  final TextEditingController unameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Let us create Your account ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 15,
              ),
              Form(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CTextField(
                            text: 'First Name',
                            icon: Icons.person,
                            controller: fnameController,
                            ishidden: false,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: CTextField(
                            text: 'last Name',
                            icon: Icons.person_outline,
                            controller: lnameController,
                            ishidden: false,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CTextField(
                      text: 'User Name',
                      icon: Icons.person_search_outlined,
                      controller: unameController,
                      ishidden: false,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CTextField(
                      text: 'E-mail',
                      icon: Icons.email_outlined,
                      controller: emailController,
                      ishidden: false,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CTextField(
                      text: 'Phone Number',
                      icon: Icons.phone_outlined,
                      controller: phoneController,
                      ishidden: false,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CTextField(
                      text: 'password',
                      icon: Icons.lock_outline_sharp,
                      icon2: Icons.visibility_off_outlined,
                      icon3: Icons.visibility_outlined,
                      controller: passwordController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 2,
                        ),
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: Checkbox(
                            value: true,
                            onChanged: (value) {},
                            activeColor: Colors.blueAccent,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),

                        //multiple style of a text in a single line using text.rich()
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'I agree to  ',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: Colors.grey),
                              ),
                              TextSpan(
                                text: 'privacy policy',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        decoration: TextDecoration.underline,
                                        color: Colors.blueAccent,
                                        decorationColor: Colors.blueAccent),
                              ),
                              const TextSpan(text: ' '),
                              TextSpan(
                                text: 'and',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: Colors.grey),
                              ),
                              const TextSpan(text: ' '),
                              TextSpan(
                                text: 'terms of use',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        decoration: TextDecoration.underline,
                                        color: Colors.blueAccent,
                                        decorationColor: Colors.blueAccent),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () =>
                            Get.to(() => const EmailVarificationView()),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF667E06),
                        ),
                        child: const Text(
                          'Create Account',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
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
                    'Or Sign Up with',
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
