import 'package:flutter/material.dart';

class OdometerWidget extends StatefulWidget {
  final Duration duration;
  final int endNumber;
//  final String text;

   const OdometerWidget(
      {super.key, required this.duration, required this.endNumber, });

  @override
  _OdometerWidgetState createState() => _OdometerWidgetState();
}

class _OdometerWidgetState extends State<OdometerWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this)
      ..addListener(() {
        setState(() {});
      });

    _animation = IntTween(begin: 0, end: widget.endNumber).animate(_controller);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Text('${_animation.value}',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
