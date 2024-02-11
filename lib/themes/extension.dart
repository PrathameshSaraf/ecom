import 'package:easy_widgets/easy_widget_extensions.dart';
import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Widget unfocus(BuildContext context) =>
      onTap(() => FocusScope.of(context).unfocus());
}

extension BuildContextExtension on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}
