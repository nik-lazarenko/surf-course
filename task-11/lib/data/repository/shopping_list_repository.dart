import '/data/mock_data.dart';
import '/domain/entity/receipt_entity.dart';

class ShoppingListRepository {
  Future<ReceiptEntity> getReceipt(int id) async {
    return Future.value(ReceiptEntity(
      id: id,
      date: DateTime.now(),
      products: dataForStudents,
    ));
  }
}