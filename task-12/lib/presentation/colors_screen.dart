

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:surf_flutter_courses_template/domain/entity/color_entity.dart';
import 'package:surf_flutter_courses_template/utils/extension/string_x.dart';

import '../assets/strings/app_strings.dart';
import '../main.dart';
import 'detailed_color_screen.dart';

class ColorsScreen extends StatefulWidget {
  const ColorsScreen({Key? key}) : super(key: key);

  @override
  State<ColorsScreen> createState() => _ColorsScreenState();
}

class _ColorsScreenState extends State<ColorsScreen> {
  Future<List<ColorEntity>>? _data;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    _data = colorsRepository.getColors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              AppStrings.appBarTitleColorsScreen,
              style: Theme.of(context).textTheme.headlineMedium,
              maxLines: 2,
            ),
          ),
        ),
      ),
      body: FutureBuilder<List<ColorEntity>>(
        future: _data,
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const _ErrorWidget();
            } else if (snapshot.hasData) {
              final data = snapshot.data;
              return data != null ? _ContentWidget(data: data) : const _EmptyWidget();
            }
          }
          return const _LoadingWidget();
        },
      ),
    );
  }
}

class _ContentWidget extends StatelessWidget {
  final List<ColorEntity> data;
  const _ContentWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.80,
        mainAxisSpacing: 40,
        crossAxisSpacing: 22,
      ),
      itemCount: data.length,
      itemBuilder: (_, i) => _ColorWidget(
          colorData: data[i],
      ),
    );
  }
}


class _ColorWidget extends StatelessWidget {
  final ColorEntity colorData;
  const _ColorWidget({Key? key, required this.colorData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Center(
      child: GestureDetector(
        onTap: () => onTap(context),
        onLongPress: onLongPress,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox.square(
              dimension: 100.0,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: colorData.value.hexToColor(),
                ),
              ),
            ),
            Text(colorData.name, style: theme.bodySmall),
            Text(colorData.value, style: theme.bodySmall),
          ],
        ),
      ),
    );
  }

  void onTap(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => DetailedColorScreen(colorData: colorData)));
  }

  void onLongPress() async {
    await Clipboard.setData(ClipboardData(text: colorData.value));
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
      child: Text(AppStrings.errorColorsScreen),
    );
  }
}

class _EmptyWidget extends StatelessWidget {
  const _EmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(AppStrings.emptyStateColorsScreen),
    );
  }
}