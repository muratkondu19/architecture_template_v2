import 'package:flutter/material.dart';

// Proje için kullanılacak dillerin listesi
enum Locales {
  // Dil ve ülke kodu
  tr(Locale('tr', 'TR')),
  en(Locale('en', 'US'));

  /// Constructor - locale değerini atar
  const Locales(this.locale);

  /// Locale değeri
  final Locale locale;

  /// Desteklenen dillerin listesi
  static final List<Locales> supportedLocales = [Locales.tr, Locales.en];
}
