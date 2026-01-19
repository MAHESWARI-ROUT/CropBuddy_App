import 'package:cropco/model/product.dart';
import 'package:cropco/model/product_service.dart';
import 'package:cropco/widgets/product_container.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  HomeBody({super.key});
  final ProductService productService = ProductService();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(children: [Card(),SizedBox(width: 10,),Card()],),
        StreamBuilder<List<Product>>(
          stream: productService.getProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text("No products found"));
            }
            final products = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                itemCount: products.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 5 / 7,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (_, index) =>
                    ProductContainer(product: products[index]),
              ),
            );
          },
        ),
      ],
    );
  }
}
