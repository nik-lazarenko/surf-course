
class RawProductItem {
  final String name;
  final String categoryName;
  final String subcategoryName;
  final DateTime expirationDate;
  final int qty;

  RawProductItem({
    required this.name,
    required this.categoryName,
    required this.subcategoryName,
    required this.expirationDate,
    required this.qty,
});
 }

 void main() {
   final products = [
     RawProductItem(
       name: 'Персик',
       categoryName: 'Растительная пища',
       subcategoryName: 'Фрукты',
       expirationDate: DateTime(2025, 12, 22),
       qty: 5,
     ),
     RawProductItem(
       name: 'Молоко',
       categoryName: 'Молочные продукты',
       subcategoryName: 'Напитки',
       expirationDate: DateTime(2025, 12, 22),
       qty: 5,
     ),
     RawProductItem(
       name: 'Кефир',
       categoryName: 'Молочные продукты',
       subcategoryName: 'Напитки',
       expirationDate: DateTime(2025, 12, 22),
       qty: 5,
     ),
     RawProductItem(
       name: 'Творог',
       categoryName: 'Молочные продукты',
       subcategoryName: 'Не напитки',
       expirationDate: DateTime(2025, 12, 22),
       qty: 0,
     ),
     RawProductItem(
       name: 'Творожок',
       categoryName: 'Молочные продукты',
       subcategoryName: 'Не напитки',
       expirationDate: DateTime(2025, 12, 22),
       qty: 0,
     ),
     RawProductItem(
       name: 'Творог',
       categoryName: 'Молочные продукты',
       subcategoryName: 'Не напитки',
       expirationDate: DateTime(2025, 12, 22),
       qty: 0,
     ),
     RawProductItem(
       name: 'Гауда',
       categoryName: 'Молочные продукты',
       subcategoryName: 'Сыры',
       expirationDate: DateTime(2025, 12, 22),
       qty: 3,
     ),
     RawProductItem(
       name: 'Маасдам',
       categoryName: 'Молочные продукты',
       subcategoryName: 'Сыры',
       expirationDate: DateTime(2025, 12, 22),
       qty: 2,
     ),
     RawProductItem(
       name: 'Яблоко',
       categoryName: 'Растительная пища',
       subcategoryName: 'Фрукты',
       expirationDate: DateTime(2023, 12, 4),
       qty: 4,
     ),
     RawProductItem(
       name: 'Морковь',
       categoryName: 'Растительная пища',
       subcategoryName: 'Овощи',
       expirationDate: DateTime(2025, 12, 23),
       qty: 51,
     ),
     RawProductItem(
       name: 'Черника',
       categoryName: 'Растительная пища',
       subcategoryName: 'Ягоды',
       expirationDate: DateTime(2025, 12, 25),
       qty: 0,
     ),
     RawProductItem(
       name: 'Курица',
       categoryName: 'Мясо',
       subcategoryName: 'Птица',
       expirationDate: DateTime(2025, 12, 18),
       qty: 2,
     ),
     RawProductItem(
       name: 'Говядина',
       categoryName: 'Мясо',
       subcategoryName: 'Не птица',
       expirationDate: DateTime(2025, 12, 17),
       qty: 0,
     ),
     RawProductItem(
       name: 'Телятина',
       categoryName: 'Мясо',
       subcategoryName: 'Не птица',
       expirationDate: DateTime(2025, 12, 17),
       qty: 0,
     ),
     RawProductItem(
       name: 'Индюшатина',
       categoryName: 'Мясо',
       subcategoryName: 'Птица',
       expirationDate: DateTime(2023, 12, 17),
       qty: 0,
     ),
     RawProductItem(
       name: 'Утка',
       categoryName: 'Мясо',
       subcategoryName: 'Птица',
       expirationDate: DateTime(2025, 12, 18),
       qty: 0,
     ),
     RawProductItem(
       name: 'Гречка',
       categoryName: 'Растительная пища',
       subcategoryName: 'Крупы',
       expirationDate: DateTime(2023, 12, 22),
       qty: 8,
     ),
     RawProductItem(
       name: 'Свинина',
       categoryName: 'Мясо',
       subcategoryName: 'Не птица',
       expirationDate: DateTime(2025, 12, 23),
       qty: 5,
     ),
     RawProductItem(
       name: 'Груша',
       categoryName: 'Растительная пища',
       subcategoryName: 'Фрукты',
       expirationDate: DateTime(2025, 12, 25),
       qty: 5,
     ),
   ];

   final result = {};

   for (final product in products) {
     if (product.qty > 0 && product.expirationDate.isAfter(DateTime(2022, 12, 18))) {
       final categoryName = product.categoryName;
       final subcategoryName = product.subcategoryName;
       final productName = product.name;

       if (!result.containsKey(categoryName)) {
         result[categoryName] = {};
       }

       final categoryMap = result[categoryName];

       if (!categoryMap.containsKey(subcategoryName)) {
         categoryMap[subcategoryName] = [];
       }

       final subcategoryList = categoryMap[subcategoryName];
       subcategoryList.add(productName);
     }
   }
    print(result);
 }