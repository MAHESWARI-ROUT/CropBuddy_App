import 'package:cropco/model/device_utility.dart';
import 'package:cropco/screens/authentications/login_screen.dart';
import 'package:cropco/widgets/bottom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SucessScreen extends StatelessWidget {
  const SucessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => const LoginScreen()),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                height: CDeviceUtils.getAppbarHeight(),
              ),
              Image.asset(
                "assets/images/confirmed-concept-illustration-b.png",
                width: 300,
                height: 300,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Your account successfully created!',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                'Welcome to your ultimate shopping destination.explor more organic food and stay healthy',
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => const BottomNavigation(
                            icon1: Icons.home,
                            icon2: Icons.local_florist,
                            icon3: Icons.account_balance_wallet,
                            icon4: Icons.people,
                            text1: 'home',
                            text2: 'plantation',
                            text3: 'wallet',
                            text4: 'community'),
                        
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF667E06),
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
            ],
          ),
        ),
      ),
    );
  }
}
