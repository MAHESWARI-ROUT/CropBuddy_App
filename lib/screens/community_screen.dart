import 'package:cropco/screens/post_screen.dart';
import 'package:cropco/widgets/community_account.dart';
import 'package:cropco/widgets/gradient_appbar.dart';
import 'package:cropco/widgets/home_searchbar.dart';
import 'package:cropco/widgets/post_container.dart';
import 'package:flutter/material.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 45.0),
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: kToolbarHeight + 25,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 168, 200, 41),
                  Color(0xFF667E06)
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => const CommunityAccount(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.account_circle_rounded,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 30.0),
                    child: HomeSearchbar(
                      height: 45,
                      width: 260,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    PostContainer(),
                    PostContainer(),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 197, 210, 143),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => const PostScreen(),
              ),
            );
          },
          child: const Icon(
            color: Color(0xFF667E06),
            Icons.add,
            size: 50,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
