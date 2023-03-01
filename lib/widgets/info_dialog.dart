import 'dart:ui';
import 'package:flutter/material.dart';
import 'widgets.dart';

class InfoDialog extends StatelessWidget {
  final double width;
  final double height;
  final String title;
  final List<String> description;
  final int descriptionNumber;
  const InfoDialog(
      {Key? key,
      required this.width,
      required this.height,
      required this.title,
      required this.descriptionNumber,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: AlertDialog(
        semanticLabel: 'User Manual',
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          GlassUI(
            width: width,
            height: height,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 28),
                  for (int i = 0; i < descriptionNumber; i++) ...[
                    Text(
                      description[i],
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                    ),
                    const SizedBox(height: 22),
                  ],
                  const SizedBox(height: 10),
                  Text(
                    '- Created by Tad Wilson -',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
