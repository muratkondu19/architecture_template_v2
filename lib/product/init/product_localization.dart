import 'package:architecture_template/product/utility/constants/enums/locales.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

@immutable //@immutable sınıfların instance'larının değişmez.
//final ile de inheritance alınması engellenir.
final class ProductLocalization extends EasyLocalization {
  ProductLocalization({required super.child, super.key})
    : super(
        supportedLocales: _supportedLocales,
        path: _path,
        useOnlyLangCode: true, //dosya adı yalnızca dil kodu olacak şekilde okunabilir.
      );

  static final List<Locale> _supportedLocales = Locales.supportedLocales.map((locale) => locale.locale).toList();

  static const String _path = 'assets/localization';

  /// Dil değiştirmek için kullanılır. [Locales] enum'u ile dil seçilir.
  static void updateLocale({required BuildContext context, required Locales locale}) {
    context.setLocale(locale.locale);
  }
}
