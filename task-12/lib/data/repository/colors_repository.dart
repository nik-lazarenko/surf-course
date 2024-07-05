

import 'package:surf_flutter_courses_template/api/service/colors_api.dart';

import '../../domain/entity/color_entity.dart';
import '../mapper/color_mapper.dart';

final class ColorsRepository {
  final ColorsApi _colorsApi;
  final ColorMapper _colorsMapper;

  ColorsRepository({
    required ColorsApi colorsApi,
    required ColorMapper colorsMapper,
}) : _colorsApi = colorsApi,
  _colorsMapper = colorsMapper;

  Future<List<ColorEntity>> getColors() => _colorsApi.getColors().then(_colorsMapper.mapColors);
}