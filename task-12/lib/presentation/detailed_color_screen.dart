


import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:surf_flutter_courses_template/domain/entity/color_entity.dart';
import 'package:surf_flutter_courses_template/utils/extension/string_x.dart';

import '../assets/strings/app_strings.dart';
import '../domain/entity/rgb_type.dart';

class DetailedColorScreen extends StatelessWidget {
  final ColorEntity colorData;

  const DetailedColorScreen({Key? key, required this.colorData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final colorBoxHeight = height / 2;
    final preferredSizeHeight = colorBoxHeight - kToolbarHeight;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight,
        foregroundColor: Colors.white,
        flexibleSpace: SizedBox(
          width: double.infinity,
          height: colorBoxHeight,
          child: ColoredBox(
            color: colorData.value.hexToColor(),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(preferredSizeHeight),
          child: const SizedBox.shrink(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              colorData.name,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            _ShadowBoxWidget(title: AppStrings.hexColorsScreen, value: colorData.value),
            const SizedBox(height: 16),
            _RgbWidget(color: colorData.value.hexToColor()),
          ],
        ),
      ),
    );
  }
}

class _RgbWidget extends StatelessWidget {
  final Color color;

  const _RgbWidget({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: RgbType.values
      .expandIndexed(
          (i, e) => [
            Expanded(
                child: _ShadowBoxWidget(
              title: e.name,
                  value: switch (e) {
                RgbType.red => color.red.toString(),
                    RgbType.green => color.green.toString(),
                    RgbType.blue => color.blue.toString(),
                  },
            ),
            ),
            if (i != RgbType.values.length - 1) const SizedBox(width: 8),
          ],
      )
      .toList(),
    );
  }
}

class _ShadowBoxWidget extends StatelessWidget {
  final String title;
  final String value;

  const _ShadowBoxWidget({Key? key, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyMedium;

    return DecoratedBox(
        decoration: BoxDecoration(
      color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade100,
              blurRadius: 12,
              offset: const Offset(0, 12)
            ),
          ],
    ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: GestureDetector(
          onTap: _onTap,
          child: Row(
            children: [
              Expanded(
                  child: Text(
                    title,
                    style: textStyle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
              ),
              Text(value, style: textStyle),
            ],
          ),
        ),
      ),
    );
  }

  void _onTap() async {
    await Clipboard.setData(ClipboardData(text: value));
  }
}