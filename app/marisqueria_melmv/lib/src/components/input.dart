import 'package:flutter/material.dart';

class CustomInput extends StatefulWidget {
  final String title;
  final TextInputType? type;
  final TextEditingController ctl;
  const CustomInput({
    required this.ctl,
    required this.title,
    this.type,
    super.key,
  });

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.type ?? TextInputType.text,
      controller: widget.ctl,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: widget.title,
        fillColor: Colors.transparent,
        filled: true,
        isDense: true,
      ),
    );
  }
}
