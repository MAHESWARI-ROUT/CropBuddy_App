import 'package:cropco/model/wishlist_provider.dart';
import 'package:cropco/views/authentications/email_varification_view.dart';
import 'package:cropco/views/authentications/forget_password_view.dart';
import 'package:cropco/views/authentications/login_view.dart';
import 'package:cropco/views/authentications/reset_password_view.dart';
import 'package:cropco/views/authentications/signup_view.dart';
import 'package:cropco/views/authentications/sucess_view.dart';
import 'package:cropco/views/buyview.dart';
import 'package:cropco/views/cart_view.dart';
import 'package:cropco/views/community_view.dart';
import 'package:cropco/views/expense_tracker.dart';
import 'package:cropco/views/frontview_farmer.dart';
import 'package:cropco/views/onboarding.dart';
import 'package:cropco/views/plantation_view.dart';
import 'package:cropco/views/post_view.dart';
import 'package:cropco/views/profile_view.dart';
import 'package:cropco/views/sells_view.dart';
import 'package:cropco/views/wishlist_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';


final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ChangeNotifierProvider(
      create: (_) => WishlistProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      initialRoute: '/onboarding',
      getPages: [
        GetPage(name: '/onboarding', page: () => Onboarding()),
        GetPage(name: '/signup', page: () => const SignupView()),
        GetPage(name: '/login', page: () => const LoginView()),
        GetPage(name: '/cart', page: () => const CartView()),
        GetPage(
          name: '/email-verification',
          page: () => const EmailVarificationView(),
        ),
        GetPage(
          name: '/forget-password',
          page: () => const ForgetPasswordView(),
        ),
        GetPage(
          name: '/reset-password',
          page: () => const ResetPasswordView(),
        ),
        GetPage(
          name: '/login-success',
          page: () => const SucessView(),
        ),
        GetPage(name: '/buying-view', page: () => const Buyview()),
        GetPage(name: '/community', page: () => const CommunityView()),
        GetPage(
          name: '/expense-tracker',
          page: () => const ExpenseTracker(),
        ),
        GetPage(
          name: '/front-farmer',
          page: () => const FrontviewFarmer(),
        ),
        GetPage(
          name: '/plantation',
          page: () => const PlantationView(),
        ),
        GetPage(name: '/post-view', page: () => const PostView()),
        GetPage(name: '/profile', page: () => const ProfileView()),
        GetPage(name: '/sells-view', page: () => const SellsView()),
        GetPage(name: '/Wishlist', page: () => const WishlistView()),
      ],
    );
  }
}
