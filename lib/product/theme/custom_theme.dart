import 'package:flutter/material.dart';

/// Tema konfigürasyonu için abstract (soyut) sınıf
///
/// Bu sınıf:
/// - Tema konfigürasyonu için ortak interface tanımlar
/// - Light ve Dark tema sınıflarının implement etmesi gereken metodları belirler
/// - Tema tutarlılığını ve standartlaşmayı sağlar
/// - Polymorphism ile farklı tema türlerinin kullanılmasına izin verir
///
/// Kullanım:
/// - CustomLightTheme extends CustomTheme
/// - CustomDarkTheme extends CustomTheme
/// - Tema değişikliklerinde aynı interface kullanılır
///
/// Avantajları:
/// - Kod tekrarını önler
/// - Tema değişikliklerini kolaylaştırır
/// - Test edilebilirliği artırır
/// - Bakım kolaylığı sağlar
abstract class CustomTheme {
  /// Ana tema verisi (ThemeData) getter metodu
  ///
  /// Bu metod:
  /// - Flutter'ın ThemeData sınıfını döndürür
  /// - Uygulamanın genel görünümünü kontrol eder
  /// - Renk şeması, font, boyut gibi tüm tema özelliklerini içerir
  ///
  /// Implement eden sınıflar:
  /// - Light tema için açık renk şeması döndürmeli
  /// - Dark tema için koyu renk şeması döndürmeli
  /// - Material 3 tasarım sistemini kullanmalı
  ThemeData get themeData;

  /// Floating Action Button tema konfigürasyonu getter metodu
  ///
  /// Bu metod:
  /// - FloatingActionButtonThemeData sınıfını döndürür
  /// - FAB'ın görünümünü ve davranışını kontrol eder
  /// - Renk, boyut, şekil gibi FAB özelliklerini belirler
  ///
  /// Implement eden sınıflar:
  /// - Light tema için açık renkli FAB döndürmeli
  /// - Dark tema için koyu renkli FAB döndürmeli
  /// - Primary renk ile uyumlu tasarım sağlamalı
  FloatingActionButtonThemeData get floatingActionButtonThemeData;
}
