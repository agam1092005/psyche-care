// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    required this.child,
    required this.onPressed,
    required this.height,
    required this.width,
    required this.color,
  });

  final child;
  final onPressed;
  final double height;
  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        elevation: 2,
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            12,
          ),
        ),
        child: MaterialButton(
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: onPressed,
          minWidth: width,
          height: height,
          child: child,
        ),
      ),
    );
  }
}
