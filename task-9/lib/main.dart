import 'dart:math';
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
  circle(Colors.deepPurple, BoxShape.circle),
  rectangle(Colors.red, BoxShape.rectangle);

  final Color color;
  final BoxShape shape;

  const Figure(this.color, this.shape);

  BoxDecoration get decoration => BoxDecoration(color: color, shape: shape);
}

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
  var _left = 120.0;
  var _top = 350.0;
  final double _width = 200;
  Figure _figure = Figure.rectangle;
  late Color _color;

  void _onTap() {
    final tapColor =
        Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0);
    var tapFigure = Figure
        .values[(Figure.values.indexOf(_figure) + 1) % Figure.values.length];
    setState(() {
      _color = tapColor;
      _figure = tapFigure;
    });
  }

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _myAnimation =
        Tween(begin: 0.0, end: 1.0).animate(_controller as Animation<double>)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            _animationStatus = status;
          });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
                ..rotateX(pi * (_myAnimation.value)),
              width: _width,
              height: 200,
              decoration: _figure.decoration,
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
    var moveL = !(_left < 1 && details.delta.dx < 0);
    var moveR =
        !((_left + _width) > context.size!.width && details.delta.dx > 0);
    var moveU = !(_top < 1 && details.delta.dy < 0);
    var moveD =
        !((_top + _width) > context.size!.height && details.delta.dy > 0);
    setState(() {
      final moveLeft = moveL;
      final moveRight = moveR;
      if (moveRight && moveLeft) {
        _left += details.delta.dx;
      }

      final moveUp = moveU;
      final moveDown = moveD;
      if (moveUp && moveDown) {
        _top += details.delta.dy;
      }
    });
  }
}
