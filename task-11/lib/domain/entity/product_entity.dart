import '/domain/entity/amount.dart';
import 'package:decimal/decimal.dart';
import 'category_type.dart';

class ProductEntity {
  final String title;

  final int price;

  final CategoryType category;

  final String imageUrl;

  final Amount amount;

  final double discount;

  Decimal get decimalPrice => _getDecimalPrice(price);

  ProductEntity({
    required this.title,
    required this.price,
    required this.category,
    required this.imageUrl,
    required this.amount,
    this.discount = 0,
  });


  Decimal _getDecimalPrice(int price) {
    final priceString = (price / 100).toStringAsFixed(2);
    return Decimal.parse(priceString);
  }
}