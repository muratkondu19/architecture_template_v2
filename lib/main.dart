import 'package:architecture_template/feature/home/view/homw_view.dart';
import 'package:architecture_template/product/init/application_initalize.dart';
import 'package:architecture_template/product/init/product_localization.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() async {
  await ApplicationInitalize().init();

  runApp(ProductLocalization(child: _MyApp()));
}

class _MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const HomeView(),
    );
  }
}
