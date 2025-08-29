import 'package:cropco/model/app_colors.dart';
import 'package:cropco/model/product.dart';
import 'package:cropco/widgets/circular_container.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductDetailsView extends StatefulWidget {
  final Product product;
  const ProductDetailsView({super.key, required this.product});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back)),
        backgroundColor: AppColors.appbarColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircularContainer(
              radius: 12,
              height: 300,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: product.imageUrl.startsWith('http')
                    ? Image.network(
                        product.imageUrl,
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        product.imageUrl,
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              product.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text.rich(TextSpan(children: [
              TextSpan(
                text: NumberFormat.currency(locale: "en_IN", symbol: "₹")
                    .format(product.price),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const TextSpan(
                text: ' per',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              TextSpan(
                text: product.unit,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )
            ])),
            const Text(
              'Description',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(product.description),
            TextButton(
              onPressed: () {},
              child: const Text('Add To Cart'),
            )
          ],
        ),
      ),
    );
  }
}
