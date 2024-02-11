import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.context,
    required this.onTap,
    required this.buttonText,
    required this.opacity,
    required this.height,
    required this.width,
  });

  final BuildContext context;
  final GestureTapCallback onTap;
  final Widget buttonText;
  final double opacity;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xffa00500),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        onPressed: onTap,
        child: Container(
          height: height.h,
          width: width.w,
          padding: const EdgeInsets.symmetric(horizontal: 0).r,
          
          child: buttonText,
        ),
      ),
    );
  }
}