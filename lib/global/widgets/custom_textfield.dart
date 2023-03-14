import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String placeholder;
  final bool enabled;
  final bool readOnly;
  final EdgeInsetsGeometry margin;
  final void Function(String text)? onChanged;
  final int? maxLength;
  const CustomTextField(
      {super.key,
      required this.placeholder,
      this.enabled = true,
      this.readOnly = false,
      this.onChanged,
      required this.controller,
      this.margin = const EdgeInsets.all(8.0), this.maxLength});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: TextField(
        controller: widget.controller,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          hintText: widget.placeholder,
          label: Text(widget.placeholder),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 2,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 1,
            ),
          ),
        ),
        enabled: widget.enabled,
        readOnly: widget.readOnly,
        maxLength: widget.maxLength,
      ),
    );
  }
}