import 'package:flutter/material.dart';

import 'glass_ui.dart';

class QuotesButton extends StatelessWidget {
  const QuotesButton(
      {Key? key,
      this.onPressed,
      required this.buttonText,
      required this.isErrorButton})
      : super(key: key);
  final VoidCallback? onPressed;
  final String buttonText;
  final bool isErrorButton;
  @override
  Widget build(BuildContext context) {
    return GlassUI(
      width: isErrorButton ? 180 : 160,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent),
        onPressed: onPressed,
        child: Center(
          child: Text(
            buttonText,
            style: const TextStyle(color: Colors.white, fontSize: 17),
          ),
        ),
      ),
    );
  }
}
