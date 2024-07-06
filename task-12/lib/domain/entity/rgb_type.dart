
import '../../assets/strings/app_strings.dart';

enum RgbType {
  red(AppStrings.redColorsScreen),
  green(AppStrings.greenColorsScreen),
  blue(AppStrings.blueColorsScreen);

  final String name;

  const RgbType(this.name);
}