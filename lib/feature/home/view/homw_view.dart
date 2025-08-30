import 'package:architecture_template/product/init/language/locale_keys.g.dart';
import 'package:architecture_template/product/init/product_localization.dart';
import 'package:architecture_template/product/utility/constants/enums/locales.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(LocaleKeys.home_change_language.tr()),
          ElevatedButton(
            onPressed: () {
              ProductLocalization.updateLocale(context: context, locale: Locales.en);
            },
            child: Text(LocaleKeys.general_language_en.tr()),
          ),
          ElevatedButton(
            onPressed: () {
              ProductLocalization.updateLocale(context: context, locale: Locales.tr);
            },
            child: Text(LocaleKeys.general_language_tr.tr()),
          ),
        ],
      ),
    );
  }
}
