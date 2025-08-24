import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cropco/model/product.dart';

class ProductService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<Product>> getProducts() {
    return _db.collection('product').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Product.fromFirestore(doc.data());
      }).toList();
    });
  }
}
