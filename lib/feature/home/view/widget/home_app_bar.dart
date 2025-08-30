import 'package:architecture_template/product/init/language/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: AppBar(
        title: Text(LocaleKeys.home_title.tr()),
      ),
    );
  }

  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
