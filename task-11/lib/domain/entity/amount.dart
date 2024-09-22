
sealed class Amount {
  int get value;
}


class Grams implements Amount {
  @override
  final int value;
  Grams(this.value);
}

class Quantity implements Amount {
  @override
  final int value;
  Quantity(this.value);
}