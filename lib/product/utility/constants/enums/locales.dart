import 'package:flutter/material.dart';

//Proje için kullanılacak dillerin listesi
enum Locales {
  //Dil ve ülke kodu
  tr(Locale('tr', 'TR')),
  en(Locale('en', 'US'));

  final Locale locale;

  const Locales(this.locale);

  static final List<Locales> supportedLocales = [Locales.tr, Locales.en];
}
