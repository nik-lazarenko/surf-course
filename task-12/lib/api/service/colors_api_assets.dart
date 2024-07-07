
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:surf_flutter_courses_template/api/colors_api_urls.dart';
import 'package:surf_flutter_courses_template/api/data/color_data.dart';
import 'package:surf_flutter_courses_template/api/service/colors_api.dart';

class ColorsApiAssets implements ColorsApi {
  @override
  Future<List<ColorData>> getColors() async {
    final colors = <ColorData>[];

    await _addDelay(1500);
    final jsonString = await _loadAsset(ColorsApiUrls.colors);
    final data = jsonDecode(jsonString) as Map<String, dynamic>;

    final colorsData = data['colors'] as List;

    if (colorsData.isNotEmpty) {
      for (final e in colorsData) {
        colors.add(ColorData.fromJson(e as Map<String, dynamic>));
      }
    }

    return colors;
  }

  Future<String> _loadAsset(String path) => rootBundle.loadString(path);

  Future<void> _addDelay(int ms) => Future<void>.delayed(Duration(milliseconds: ms));
}