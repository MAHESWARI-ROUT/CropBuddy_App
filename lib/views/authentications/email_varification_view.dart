import 'package:cropco/views/authentications/login_view.dart';
import 'package:cropco/views/authentications/sucess_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVarificationView extends GetView {
  const EmailVarificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,//to remove the back arrow mark
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => const LoginView()),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/email.png",
                width: 300,
                height: 300,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Verify your email address!',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 7,
              ),
              Text(
                'maheswarirout2005@gmail.com',
                style: Theme.of(context).textTheme.labelSmall,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'verify your email to start shopping and experience personalised deals',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed:  () => Get.to(
                  () => const SucessView(),
                ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo[600],
                    //Color(0xFF667E06),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: (){},
                child: const Text('Resend email'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
