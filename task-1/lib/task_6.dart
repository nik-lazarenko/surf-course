
class Product {
  final int id;
  final String category;
  final String name;
  final int price;
  final int quantity;

  Product({
   required this.id,
    required this.category,
    required this.name,
    required this.price,
    required this.quantity,
});

  @override
  String toString() {
    return '$id\t$category\t$name\t$price руб\t$quantity шт';
  }
}

abstract interface class Filter {
  bool apply({required Product product});
}

class CategoryFilter implements Filter {
  final String filteredCategory;

  CategoryFilter({required this.filteredCategory});

  @override
  bool apply({required Product product}) {
    return product.category == filteredCategory;
  }
}

class PriceFilter implements Filter {
  final int filteredPrice;

  PriceFilter({required this.filteredPrice});

  @override
  bool apply({required Product product}) {
    return product.price <= filteredPrice;
  }
}

class QuantutyFilter implements Filter {
  final int filteredQuantity;

  QuantutyFilter({required this.filteredQuantity});

  @override
  bool apply({required Product product}) {
    return product.quantity >= filteredQuantity;
  }
}

void applyFilter({
  required List<Product> products,
required Filter filter,
}) {
  print('id\tКатегория\tНазвание\tЦена\tКоличество');

  for (final product in products) {
    if (filter.apply(product: product)) {
      print(product);
    }
  }
}

void main() {
  final articles = '''
1,хлеб,Бородинский,500,5
2,хлеб,Белый,200,15
3,молоко,Полосатый кот,50,53
4,молоко,Коровка,50,53
5,вода,Апельсин,25,100
6,вода,Бородинский,500,5
''';

  List<String> articlesStrings = articles.split('\n');

  List<Product> products = [];

  for (String articleAsList in articlesStrings) {
    List<String> productAsList = articleAsList.split(',');

    if (productAsList.length == 5) {
      int? id = int.tryParse(productAsList[0]);
      String category = productAsList[1];
      String name = productAsList[2];
      int? price = int.tryParse(productAsList[3]);
      int? quantity = int.tryParse(productAsList[4]);

      if (id != null && price != null && quantity != null) {
        products.add(
          Product(
              id: id,
              category: category,
              name: name,
              price: price,
              quantity: quantity,
          ),
        );
      }
    }
  }

  applyFilter(products: products, filter: CategoryFilter(filteredCategory: 'хлеб'));

  print('\n');

  applyFilter(products: products, filter: PriceFilter(filteredPrice: 500));

  print('\n');

  applyFilter(products: products, filter: QuantutyFilter(filteredQuantity: 10));

}
