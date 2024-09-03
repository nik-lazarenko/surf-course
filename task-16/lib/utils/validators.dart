String? emailValidate(value) {
  const pattern = r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  final regex = RegExp(pattern);
  return value!.isNotEmpty && !regex.hasMatch(value) ? 'Введите email' : null;
}

String? nameValidate(value) {
  if ((value.length < 3 || value.length > 20)) {
    return 'Укажите имя питомца от 3 до 20 символов';
  }
  return null;
}

String? dateValidate(value) {
  if (value.isEmpty) {
    return 'Укажите дату дд/мм/гггг';
  }
  return null;
}

String? weightValidate(value) {
  if (value.isEmpty ||
      int.parse(value) < 1) {
    return 'Укажите вес, больше 0 кг';
  }
  return null;
}