import 'dart:ui';

import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final VoidCallback onButtonPressed;
  final Color primaryColour;
  final String buttonText;

  const CustomButton({
    required this.onButtonPressed,
    required this.primaryColour,
    required this.buttonText,
  });

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 55.0,
        child: ElevatedButton(
          onPressed: widget.onButtonPressed,
          style: ElevatedButton.styleFrom(
            primary: widget.primaryColour,
            // Color(0xFF5061AC),
            // shadowColor: Color(0xFFFFFFFF),
            side: BorderSide(
              width: 0,
              // width: 0.5,
              // color: Color(0xFFFFFFFF),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
          ),
          child: Center(
            child: Text(
              widget.buttonText,
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
