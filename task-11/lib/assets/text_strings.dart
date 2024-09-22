class AppTexts {
  static const rub = 'руб.', pieces = 'шт.', kg = 'кг', space = ' ';

  static const listPurchases = 'Список покупок';

  static const emptyScreen = 'Пустой экран';

  static const catalogue = 'Каталог',
      search = 'Поиск',
      basket = 'Корзина',
      personal = 'Личное';

  static const receipt = 'Чек № ';
  static String discountPercentage(int percentage) => 'Скидка $percentage %';

  static const inYourPurchase = 'В вашей покупке',
      discount = 'Скидка',
      total = 'Итого';

  static const noProducts = 'нет товаров';
  static String oneProduct(int count) => '$count товар';
  static String fewProducts(int count) => '$count товара';
  static String manyProducts(int count) => '$count товаров';
  static String otherProducts(int count) => '$count тoвapa';

  static const error = 'Произошла ошибка!';

  static const done = 'Готово', sorting = 'Сортировка';

  static const noneSorting = 'Без сортировки',
      nameFromAToZ = 'По имени от А до Я',
      nameFromZToA = 'По имени от Я до А',
      ascendingOrder = 'По возрастанию',
      descendingOrder = 'По убыванию',
      typeFromAToZ = 'По типу от А до Я',
      typeFromZToA = 'По типу от Я до А';

  static const byName = 'По имени', byPrice = 'По цене', byType = 'По типу';
}