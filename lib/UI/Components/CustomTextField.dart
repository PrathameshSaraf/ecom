import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final Function(String)? onChange;
  final double width;
  final TextInputType keyboardType;
  final int? maxLine;
  final TextEditingController? textController;

  const CustomTextField({
    required this.labelText,
    required this.onChange,
    required this.width,
    required this.keyboardType,
    this.maxLine,
    this.textController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: TextField(
        controller: textController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          labelStyle: TextStyle(
            color: Colors.grey,
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          hintText: '',
          labelText: labelText,
        ),

        onChanged:onChange,
        keyboardType: keyboardType,
        autocorrect: true,
        maxLines: maxLine ?? 1,
        scrollPadding: EdgeInsets.all(20.0), // Adjust the scroll padding to keep text visible
      ),
    );
  }
}
