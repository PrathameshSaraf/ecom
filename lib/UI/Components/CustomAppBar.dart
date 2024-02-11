import 'package:flutter/material.dart';

import '../../themes/app_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  CustomAppBar({super.key,required this.title});

  String title;
  @override
  AppBar build(BuildContext context) {
    return AppBar(
      title: AppText(title, context,
          color: Colors.black, fontSize: 20)
          .bodyMedium,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
