import 'package:cropco/views/home_body.dart';
import 'package:cropco/views/wishlist_view.dart';
import 'package:cropco/widgets/category.dart';
import 'package:cropco/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FrontViewCostumer extends StatefulWidget {
  const FrontViewCostumer({super.key});

  @override
  State<FrontViewCostumer> createState() => _FrontViewCostumerState();
}

class _FrontViewCostumerState extends State<FrontViewCostumer> {
  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'categories') {
      await Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx) => const FrontViewCostumer()),
      );
    }
  }

  void _setWishlist() async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const WishlistView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    @override
    void dispose() {
      searchController.dispose();
      super.dispose();
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: AppBar(
            backgroundColor: const Color(0xFF667E06),
            title: const Text(
              'Cropco',
              style: TextStyle(color: Colors.white),
            ),
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            actions: [
              IconButton(
                color: Colors.red,
                icon: const Icon(Icons.favorite),
                onPressed: () {
                  _setWishlist();
                },
              ),
              const SizedBox(width: 0.05),
              IconButton(
                icon: const Icon(
                  Icons.account_circle,
                ),
                onPressed: () {},
              ),
              const SizedBox(
                width: 5,
              ),
            ],
          ),
        ),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration:
              const BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              Container(
                height: 50,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    
                  ),
                  color: Color(0xFF667E06),
                ),
                padding: const EdgeInsets.only(
                    left: 6, right: 6, top: 1, bottom: 10),
                child: TextField(
                  controller: searchController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    hintText: 'search....',
                    
                    hintStyle: TextStyle(
                      color: Color.fromARGB(159, 255, 255, 255),
                    ),
                    fillColor: Color(0xFF859738),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
            borderSide: BorderSide(
              color: Colors.white, 
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
            borderSide: BorderSide(
              color: Color.fromARGB(255, 255, 254, 254), 
              width: 2,
            ),
          ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                        borderSide: BorderSide(color: Colors.white, width: 12)),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                
                width: double.infinity,
                child: Category(),
              ),
              const SizedBox(
                height: 5,
              ),
               SizedBox(
                height: 600,
                child: HomeBody(),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(255, 233, 219, 112),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedIconTheme: IconThemeData(shadows: [
          Shadow(
            offset: const Offset(2.0, 2.0),
            blurRadius: 2.0,
            color: const Color.fromARGB(255, 27, 172, 5).withOpacity(0.7),
          ),
        ]),
        selectedItemColor: const Color(0xFF667E06),
        unselectedItemColor: const Color(0xFF667E06),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Color(0xFF667E06),
            ),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.grid_view_outlined,
              color: Color(0xFF667E06),
            ),
            label: 'category',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.wallet,
              color: Color(0xFF667E06),
            ),
            label: 'wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart_rounded,
              color: Color(0xFF667E06),
            ),
            label: 'My Order',
          ),
        ],
      ),
    );
  }
}
