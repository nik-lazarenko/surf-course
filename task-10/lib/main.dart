import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Card(),
    );
  }
}

class Card extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Визитка'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  width: 200,
                  height: 200,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/4-04.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Text(
                  'ФИО',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'RubikMono'),
                ),
                const ListTile(
                  leading: Icon(
                    Icons.face,
                    size: 30,
                  ),
                  title: Text('О себе'),
                  subtitle: Text('*** В жизни всегда есть две дороги: '
                      'одна — первая, а другая — вторая. *** Мы должны '
                      'оставаться мыми, а они – оними. *** Делай, как надо. '
                      'Как не надо, не делай. ***'),
                ),
                ListTile(
                  leading: SvgPicture.asset(
                    'assets/icons/emoticons-color-devil-svgrepo-com.svg',
                    width: 30,
                    height: 30,
                    colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),
                  ),
                  title: Text('Увлечения'),
                  subtitle: Text('Вышивка крестиком по металлу. '
                      'Появление на заднем плане ТВ-сюжетов. '
                      'Лепка из грязи. Экстремальное вязание крючком. '
                      'Необычный груминг. Резьба по яичной скорлупе. '
                      'Глажка белья в экстремальных условиях. '
                      'Создание картин с помощью канцелярского скотча'),
                ),
                const ListTile(
                  leading: Icon(
                    Icons.dangerous,
                    size: 30,
                  ),
                  title: Text('Опыт в разработке'),
                  subtitle: Text('Однажды новичок спросил мастера: '
                      '«Каждый день я пишу много кода, выполняя множество '
                      'требований, но почему мой уровень программирования не '
                      'повышается?» Мастер ответил: «Дай посмотреть, что ты пишешь». '
                      'Новичок показал компьютер. Мастер указал на обычную строку '
                      'кода присвоения переменных и сказал: «Когда ты поймёшь, '
                      'что перед этим нужно пять строк комментариев, тогда и '
                      'вырастешь». С этими словами мастер ушёл.'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
