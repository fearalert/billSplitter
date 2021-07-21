import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextAlign textAlign;
  final TextEditingController controller;
  final Icon prefixIcon;
  final VoidCallback onEditingComplete;

  const CustomTextField({
    required this.hintText,
    required this.prefixIcon,
    required this.textAlign,
    required this.controller,
    required this.onEditingComplete,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.numberWithOptions(),
      controller: widget.controller,
      onEditingComplete: widget.onEditingComplete,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        fillColor: Color(0xFFc5cdce),
        filled: true,
        border: InputBorder.none,
        hintText: widget.hintText,

        prefixIcon: widget.prefixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        // labelText: 'Enter total bill amount',
      ),
      textAlign: TextAlign.end,
      style: TextStyle(
        color: Colors.blueGrey,
        // fontSize: 20.0,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}
