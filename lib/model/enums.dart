import 'package:uuid/uuid.dart';

enum Category { cereals, dairy, fruits, spices, vegetables, other }
enum PaymentMode{paypal,googlepay,phonepe,visa,creditcard}
enum OrderStatus{processing,shipped,delivered}
const uuid = Uuid();

class SellItem {
  SellItem(
      {required this.category,
      required this.title,
      required this.amount,
      required this.quantity}): id = uuid.v4();
  final String id;
  final Category category;
  final String title;
  final double amount;
  final double quantity;
}
