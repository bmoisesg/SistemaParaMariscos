import 'package:flutter/material.dart';

class CustomBtn extends StatefulWidget {
  final String title;
  final Function fnt;
  const CustomBtn({
    required this.fnt,
    required this.title,
    super.key,
  });

  @override
  State<CustomBtn> createState() => _CustomBtnState();
}

class _CustomBtnState extends State<CustomBtn> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => widget.fnt(),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Text(widget.title),
    );
  }
}
