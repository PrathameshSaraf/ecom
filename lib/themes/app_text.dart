import 'package:easy_widgets/easy_widget.dart';
import 'package:ecom/themes/app_colors.dart';
import 'package:ecom/themes/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart' as fonts;


class AppText {
  final dynamic text;
  final BuildContext context;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final int? maxLines;
  final String? fontFamily;
  final double? height;
  AppText(
    this.text,
    this.context, {
    this.color,
    this.fontSize,
    this.fontWeight,
    this.overflow,
    this.textAlign,
    this.maxLines,
    this.fontFamily,
    this.height,
  });

  Widget _buildText(
    String text, {
    required double fontSize,
    required Color color,
    FontWeight? weight,
    TextOverflow? overflow,
    TextAlign? textAlign,
    bool underline = false,
    String? fontFamily,
  }) =>
      Text(
        text,
        style: fonts.GoogleFonts.getFont(
          fontFamily ?? "Poppins",
          fontSize: fontSize.hWise,
          color: color,
          fontWeight: weight,
          decoration:
              underline ? TextDecoration.underline : TextDecoration.none,
          height: height,
        ),
        overflow: overflow,
        textAlign: textAlign,
        maxLines: maxLines,
      );

  Widget get heading1 => _buildText(
        text,
        fontSize: fontSize ?? 40.sp,
        color: color ?? context.colorScheme.appHeadingColor,
        weight: fontWeight ?? FontWeight.w900,
        overflow: overflow,
        textAlign: textAlign,
      );
  Widget get heading2 => _buildText(
        text,
        fontSize: fontSize ?? 32.sp,
        color: color ?? context.colorScheme.appHeadingColor,
        weight: fontWeight ?? FontWeight.w900,
        overflow: overflow,
        textAlign: textAlign,
        fontFamily: fontFamily,
      );
  Widget get heading => _buildText(
        text,
        fontSize: fontSize ?? 28.sp,
        color: color ?? context.colorScheme.appHeadingColor,
        weight: fontWeight ?? FontWeight.w600,
        overflow: overflow,
        textAlign: textAlign,
        fontFamily: fontFamily,
      );

  Widget get heading3 => _buildText(
        text,
        fontSize: fontSize ?? 24.sp,
        color: color ?? context.colorScheme.appHeadingColor,
        weight: fontWeight ?? FontWeight.w500,
        overflow: overflow,
        textAlign: textAlign,
      );

  Widget get heading4 => _buildText(
        text,
        fontSize: fontSize ?? 20.sp,
        color: color ?? context.colorScheme.appHeadingColor,
        weight: fontWeight ?? FontWeight.w500,
        overflow: overflow,
        textAlign: textAlign,
      );

  Widget get heading5 => _buildText(
        text,
        fontSize: fontSize ?? 18.sp,
        color: color ?? context.colorScheme.appHeadingColor,
        weight: fontWeight ?? FontWeight.w500,
        overflow: overflow,
        textAlign: textAlign,
      );

  Widget get heading6 => _buildText(
        text,
        fontSize: fontSize ?? 16.sp,
        color: color ?? context.colorScheme.appHeadingColor,
        weight: fontWeight ?? FontWeight.bold,
        overflow: overflow,
        textAlign: textAlign,
      );

  Widget get bodyXLarge => _buildText(
        text,
        fontSize: fontSize ?? 18.sp,
        color: color ?? context.colorScheme.appBodyColor,
        weight: fontWeight ?? FontWeight.w600,
        overflow: overflow,
        textAlign: textAlign,
        fontFamily: fontFamily,
      );

  Widget get bodyLarge => _buildText(
        text,
        fontSize: fontSize ?? 16.sp,
        color: color ?? context.colorScheme.appBodyColor,
        weight: fontWeight ?? FontWeight.w600,
        overflow: overflow,
        textAlign: textAlign,
      );
  Widget get bodyMedium => _buildText(
        text,
        fontSize: fontSize ?? 14.sp,
        color: color ?? context.colorScheme.appBodyColor,
        weight: fontWeight ?? FontWeight.w600,
        overflow: overflow,
        textAlign: textAlign,
      );
  Widget get bodySmall => _buildText(
        text,
        fontSize: fontSize ?? 12.sp,
        color: color ?? context.colorScheme.appBodyColor,
        weight: fontWeight ?? FontWeight.w600,
        overflow: overflow,
        textAlign: textAlign,
        fontFamily: fontFamily,
      );

  Widget get bodyXSmall => _buildText(
        text,
        fontSize: fontSize ?? 10.sp,
        color: color ?? context.colorScheme.appBodyColor,
        weight: fontWeight ?? FontWeight.w600,
        overflow: overflow,
        textAlign: textAlign,
        fontFamily: fontFamily,
      );

  Widget get bodyVerySmall => _buildText(
        text,
        fontSize: fontSize ?? 10.sp,
        color: color ?? context.colorScheme.appBodyColor,
        weight: fontWeight ?? FontWeight.w600,
        overflow: overflow,
        textAlign: textAlign,
      );
}
