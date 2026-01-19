import 'package:cropco/model/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:cropco/model/product.dart';
import 'package:provider/provider.dart';

class WishlistView extends StatelessWidget {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    final wishlist = context.watch<WishlistProvider>().wishlist;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist'),
      ),
      body: wishlist.isEmpty
          ? const Center(
              child: Text('Your wishlist is empty'),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: wishlist.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 2,
                crossAxisSpacing: 30,
                mainAxisSpacing: 30,
              ),
              itemBuilder: (context, index) {
                final Product product = wishlist[index];

                return Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: product.imageUrl.startsWith('http')
                            ? Image.network(
                                product.imageUrl,
                                width: double.infinity,
                                height: 100,
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                product.imageUrl,
                                width: double.infinity,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        product.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "\$${product.price.toStringAsFixed(2)}",
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
