
import 'package:surf_flutter_courses_template/api/data/color_data.dart';

abstract class ColorsApi {
  Future<List<ColorData>> getColors();
}