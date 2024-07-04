import 'product_entity.dart';

class CheckEntity {
  final int id;
  final DateTime date;
  final List<ProductEntity> products;

  CheckEntity({required this.id, required this.date, required this.products});
}
