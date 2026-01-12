import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cropco/model/product.dart';

class ProductService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<Product>> getProducts() {
  return FirebaseFirestore.instance
      .collection('product')
      .snapshots(includeMetadataChanges: true)
      .map((snapshot) {
        if (snapshot.metadata.isFromCache) {
          print('Using cache');
        }

        return snapshot.docs.map((doc) {
          return Product.fromFirestore(doc.data());
        }).toList();
      });
}

}
