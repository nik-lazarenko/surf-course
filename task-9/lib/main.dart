import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'GestureMaster'),
    );
  }
}

enum Figure {
  circle,
  rectangle;
}

extension on Figure {
  BoxDecoration get decoration => switch (this) {
    Figure.rectangle => BoxDecoration(
      color: _color,
      borderRadius: BorderRadius.zero,
    ),
  Figure.circle => BoxDecoration(
    color: Colors.deepPurple
  )
  };
}

Figure figure = Figure.rectangle;

Color _color = Colors.red;


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _myAnimation;
  AnimationStatus _animationStatus = AnimationStatus.dismissed;
  double _left = 120;
  double _top = 350;
  double _width = 200;

  void _onTap() {
    setState(() {
      _color = Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0);
    });
  }

  void initState() {
    super.initState();
    setState(() {
      _controller =
          AnimationController(vsync: this, duration: Duration(seconds: 1));
      _myAnimation =
      Tween(end: 1.0, begin: 0.0).animate(_controller as Animation<double>)
        ..addListener(() {
          setState(() {});
        })
        ..addStatusListener((status) {
          _animationStatus = status;
        });
    });  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

    title: Text(widget.title),
    ),
    body: Stack(
          children: [
            Positioned(
              left: _left,
              top: _top,
                child: AnimatedContainer(
                  transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.002)
                  ..rotateX(pi*(_myAnimation.value)),
                  width: _width,
                  height: 200,
                  decoration: figure.decoration,
                  duration: const Duration(milliseconds: 500),
                ),


            ),
            Positioned.fill(
                child: GestureDetector(
                  onTap: _onTap,
                  onLongPress: _onLong,
                  onPanUpdate: _onPan,
                )),

         ],
        ),
    );

  }
  void _onLong() {
    if (_animationStatus == AnimationStatus.dismissed) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  void _onPan(DragUpdateDetails details) {
    setState(() {
      final moveLeft = !(_left < 1 && details.delta.dx < 0);
      final moveRight = !((_left + _width) > context.size!.width && details.delta.dx > 0);
      if (moveRight && moveLeft) {
        _left += details.delta.dx;
      }

      final moveUp = !(_top < 1 && details.delta.dy < 0);
      final moveDown = !((_top + _width) > context.size!.height && details.delta.dy > 0);
      if (moveUp && moveDown) {
        _top += details.delta.dy;
      }
    });
  }

}
//
// class MyClipper extends CustomClipper<Rect> {
//   @override
//   Rect getClip(Size size) {
//     return const Rect.fromLTWH(50, 50, 100, 100);
//   }
//   @override
//   bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
//     return false;
//   }
//
// }