import 'package:flutter/material.dart';

class GlassUI extends StatelessWidget {
  final Widget? child;
  final double height;
  final double width;
  const GlassUI({
    Key? key,
    required this.child,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomCenter,
            colors: [Colors.white.withOpacity(0.7), Colors.black54],
          ),
          color: Colors.white.withOpacity(0.4),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(width: 2, color: Colors.white30),
        ),
        child: child,
      ),
    );
  }
}
