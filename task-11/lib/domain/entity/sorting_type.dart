import '../../assets/text_strings.dart';

enum SortingType {
  none(type: FilterType.none, name: AppTexts.noneSorting),
  nameFromA(type: FilterType.byName, name: AppTexts.nameFromAToZ),
  nameFromZ(type: FilterType.byName, name: AppTexts.nameFromZToA),
  ascendingOrderPrice(type: FilterType.byPrice, name: AppTexts.ascendingOrder),
  descendingOrderPrice(
      type: FilterType.byPrice, name: AppTexts.descendingOrder),
  typeFromA(type: FilterType.byType, name: AppTexts.typeFromAToZ),
  typeFromZ(type: FilterType.byType, name: AppTexts.typeFromZToA);

  final FilterType type;
  final String name;

  const SortingType({required this.type, required this.name});
}


enum FilterType {
  none(AppTexts.noneSorting),
  byName(AppTexts.byName),
  byPrice(AppTexts.byPrice),
  byType(AppTexts.byType);

  final String name;

  const FilterType(this.name);
}