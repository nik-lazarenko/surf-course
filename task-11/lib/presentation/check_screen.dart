import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:surf_flutter_courses_template/domain/entity/check_entity.dart';
import 'package:surf_flutter_courses_template/domain/entity/sorting_type.dart';
import 'package:surf_flutter_courses_template/presentation/empty_screen.dart';
import 'package:surf_flutter_courses_template/utils/extension/date_time_x.dart';
import 'package:surf_flutter_courses_template/utils/extension/decimal_x.dart';
import 'package:surf_flutter_courses_template/utils/extension/product_list_x.dart';

import '../domain/entity/category_type.dart';
import '../domain/entity/product_entity.dart';
import '../main.dart';
import 'filter_screen.dart';

class CheckScreen extends StatefulWidget {
  final int id;

  const CheckScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<CheckScreen> createState() => _CheckScreenState();
}

class _CheckScreenState extends State<CheckScreen> {
  Future<CheckEntity>? _data;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    _data = shoppingListRepository.getCheck(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CheckEntity>(
        future: _data,
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const _ErrorWidget();
            } else if (snapshot.hasData) {
              final data = snapshot.data;
              return data != null
                  ? _ContentWidget(data: data)
                  : const EmptyScreen();
            }
          }
          return const _LoadingWidget();
        });
  }
}

class _ContentWidget extends StatefulWidget {
  final CheckEntity data;

  const _ContentWidget({Key? key, required this.data}) : super(key: key);

  @override
  State<_ContentWidget> createState() => _ContentWidgetState();
}

class _ContentWidgetState extends State<_ContentWidget> {
  SortingType _currentFilter = SortingType.none;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            Text('Чек № ${widget.data.id}'),
            Text(
              widget.data.date.toStringDateAndTime(),
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Список покупок',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                FilledButton.icon(
                  onPressed: () {
                    _onPressedFilter();
                  },
                  icon: const Icon(Icons.sort),
                  label: const Text('Сорт'),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
        itemBuilder: (_, i) {
          final cat = CategoryType.values[i];
          final categoryProducts = widget.data.products
              .where((product) => product.category == cat)
              .toList();
          final isLastCat = i == CategoryType.values.length - 1;

          return categoryProducts.isNotEmpty
              ? _CategoryWidget(
                  category: cat.name,
                  productsOfCategory: categoryProducts,
                  products: widget.data.products,
                  isLastCat: isLastCat,
                  filter: _currentFilter,
                )
              : const SizedBox();
        },
        itemCount: CategoryType.values.length,
      ),
    );
  }

  Future<void> _onPressedFilter() async {
    final SortingType? filter = await showFlexibleBottomSheet(
      initHeight: 0.8,
      bottomSheetColor: Colors.transparent,
      context: context,
      builder: (_, __, ___) => FilterScreen(filter: _currentFilter),
      isExpand: true,
    );

    if (filter == null) return;

    if (filter != _currentFilter) {
      setState(() {
        _currentFilter = filter;
      });
    }
  }
}

class _CategoryWidget extends StatelessWidget {
  final String category;
  final List<ProductEntity> productsOfCategory;
  final List<ProductEntity> products;
  final bool isLastCat;
  final SortingType filter;

  const _CategoryWidget({
    Key? key,
    required this.category,
    required this.productsOfCategory,
    required this.products,
    required this.isLastCat,
    required this.filter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(category),
        ...productsOfCategory
            .sortByFilter(filter)
            .map((e) => ListTile(
                  title: Text(e.title),
                  trailing: Text(
                    e.decimalPrice.toFormattedCurrency(),
                  ),
                ))
            .toList(),
        const Divider(),
        if (isLastCat)
          _FinancialWidget(
            products: products,
          ),
      ],
    );
  }
}

class _FinancialWidget extends StatelessWidget {
  final List<ProductEntity> products;

  const _FinancialWidget({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fullTotal = _getFullTotal(products);
    final discount = _getDiscount(products);
    final total = fullTotal - discount;

    return Column(
      children: [
        const Text('В вашей покупке'),
        _RowWidget(
            description: _plural(products.length),
            value: fullTotal.toFormattedCurrency()),
        _RowWidget(
            description: 'Скидка 0%', value: discount.toFormattedCurrency()),
        _RowWidget(description: 'Итого', value: total.toFormattedCurrency()),
      ],
    );
  }

  String _plural(int count) {
    return Intl.plural(
      count,
      zero: 'нет товаров',
      one: '$count товар',
      few: '$count товара',
      many: '$count товаров',
      other: '$count товара',
      locale: 'ru',
    );
  }

  Decimal _getFullTotal(List<ProductEntity> products) {
    return products.fold<Decimal>(Decimal.zero,
        (previousValue, element) => previousValue + element.decimalPrice);
  }

  Decimal _getDiscount(List<ProductEntity> product) {
    final discount = products.where((element) => element.sale > 0).toList();

    return discount.isEmpty
        ? Decimal.zero
        : discount.fold<Decimal>(
            Decimal.zero,
            (previousValue, element) =>
                previousValue +
                _calculateDiscountForProduct(
                  element.decimalPrice,
                  element.sale.toString(),
                ),
          );
  }

  Decimal _calculateDiscountForProduct(Decimal price, String discountPercent) {
    final discountAmount =
        (price * Decimal.parse(discountPercent) / Decimal.fromInt(100))
            .toDecimal();
    return price - discountAmount;
  }
}

class _RowWidget extends StatelessWidget {
  final String description;
  final String value;

  const _RowWidget({Key? key, required this.description, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Expanded(child: Text(description, style: textTheme.bodyMedium)),
        Text(value, style: textTheme.headlineSmall),
      ],
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Произошла ошибка'),
    );
  }
}
