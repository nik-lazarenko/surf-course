import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../assets/text_strings.dart';
import '/assets/colors.dart';
import '/assets/text_styles.dart';
import '/domain/entity/sorting_type.dart';

class FilterScreen extends StatefulWidget {
  final SortingType filter;
  const FilterScreen({super.key, required this.filter});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  SortingType _selectedFilter = SortingType.none;
  @override
  void initState() {
    super.initState();
    _selectedFilter = widget.filter;
  }

  @override
  Widget build(BuildContext context) {
    void onDone() {
      Navigator.of(context).pop(_selectedFilter);
    }

    void onChanged(SortingType? value) {
      final newValue = value;
      if (newValue == null || newValue == _selectedFilter) return;

      setState(() {
        _selectedFilter = value!;
      });
    }

    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
        itemCount: FilterType.values.length,
        itemBuilder: (_, i) {
          final type = FilterType.values[i];
          final sortingList =
          SortingType.values.where((e) => e.type == type).toList();
          final isLastType = i == FilterType.values.length - 1;
          return sortingList.isNotEmpty
              ? _FilterTypeWidget(
            index: i,
            type: type,
            sortingList: sortingList,
            selectedFilter: _selectedFilter,
            isLastType: isLastType,
            onChanged: onChanged,
            onDone: onDone,
            onClose: onDone,
          )
              : const SizedBox();
        },
      ),
    );
  }
}

class _FilterTypeWidget extends StatelessWidget {
  final int index;
  final FilterType type;
  final List<SortingType> sortingList;
  final SortingType selectedFilter;
  final bool isLastType;
  final ValueChanged<SortingType?> onChanged;
  final VoidCallback onDone;
  final VoidCallback onClose;

  const _FilterTypeWidget({
    required this.index,
    required this.type,
    required this.sortingList,
    required this.selectedFilter,
    required this.isLastType,
    required this.onChanged,
    required this.onDone,
    required this.onClose,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          if (index == 0) ...[
            _TitleWidget(onClose: onClose),
            const SizedBox(height: 5),
          ],
          if (type != FilterType.none) Text(type.name),
          ...sortingList.map(
                (e) => RadioListTile<SortingType>(
              title: Text(e.name),
              activeColor: AppColors.brightGreen,
              value: e,
              groupValue: selectedFilter,
              onChanged: onChanged,
            ),
          ),
          const Divider(),
          if (isLastType) ...[
            const SizedBox(height: 10),
            Center(
              child: SizedBox(
                width: 335,
                height: 48,
                child: CupertinoButton(
                  color: AppColors.brightGreen,
                  onPressed: onDone,
                  child: Text(
                    AppTexts.done,
                    style: AppTextStyles.bold,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  final VoidCallback onClose;
  const _TitleWidget({required this.onClose});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(AppTexts.sorting, style: Theme.of(context).textTheme.titleLarge),
          IconButton(
            onPressed: onClose,
            icon: const Icon(
              Icons.close,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}