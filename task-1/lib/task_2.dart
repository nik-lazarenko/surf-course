abstract interface class Sleeper {
  void sleep();
}

class Home {
  final String name;
  final HomeSize size;

  Home({
    required this.name,
    required this.size,
  });
}

enum HomeSize {
  small,
  medium,
  large,
}

class Cat {
  String _name;
  final int age;
  bool isHungry = true;
  final Home home;

  Cat(
    this._name,
    this.age, {
    required this.home,
  });

  Cat.old(
    this._name,
    this.home,
  ) : age = 20;

  String get name => _name;

  void eat() {
    if (isHungry) {
      print('Кот $_name наелся.');
      isHungry = false;
    } else {
      print('Кот $_name сыт.');
    }
  }

  @override
  void sleep() {
    print('Кот спит');
  }
}

class ColoredCat extends Cat with Jumper {
  final String color;

  ColoredCat(
    String name,
    int age,
    Home home, [
    this.color = 'рыжего',
  ]) : super(
          name,
          age,
          home: home,
        );

  @override
  void sleep() {
    super.sleep();
    print('Кот $color цвета спит');
  }
}

mixin Jumper {
  void jump() {
    print('Тыг-дыкает');
  }
}

void main() {
  final cat = Cat(
      'Папиу',
      2,
      home: Home(name: 'Дом', size: HomeSize.medium),
  );

  final koshkinDom = Home(
      name: 'Кошкин дом',
      size: HomeSize.small
  );

  final coloredCat = ColoredCat(
      'Паупау',
      3,
      koshkinDom, 'серого',
  );

  cat.eat();
  coloredCat.eat();
  coloredCat.jump();
  coloredCat.sleep();
}
