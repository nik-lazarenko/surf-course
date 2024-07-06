

import '../../api/data/color_data.dart';
import '../../domain/entity/color_entity.dart';

final class ColorMapper {
  List<ColorEntity> mapColors(List<ColorData> data) {
    final mappedList = <ColorEntity>[];
    for (var e in data) {
      final entity = _mapColor(e);
      if (entity != null) mappedList.add(entity);
    }
    return mappedList;
  }

  ColorEntity? _mapColor(ColorData data) {
    final value = data.value;
    if (value == null) return null;

    return ColorEntity(
        name: data.name,
        value: value,
    );
  }
}