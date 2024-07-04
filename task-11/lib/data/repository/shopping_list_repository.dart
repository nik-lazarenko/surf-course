import '../../domain/entity/check_entity.dart';
import '../data.dart';

class ShoppingListRepository {
  Future<CheckEntity> getCheck(int id) async {
    return Future.value(
      CheckEntity(
        id: id,
        date: DateTime(2024, 2, 23, 12, 23),
        products: dataForStudents,
      ),
    );
  }
}
