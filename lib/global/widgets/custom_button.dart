import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String title;
  final Function() onPressed;
  final MaterialColor? customColor;
  const CustomButton(
      {super.key,
      required this.title,
      required this.onPressed,
      this.customColor});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            widget.customColor ?? Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: widget.onPressed,
      child: Text(widget.title),
    );
  }
}
