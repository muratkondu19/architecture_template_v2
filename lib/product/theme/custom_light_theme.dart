import 'package:architecture_template/product/theme/custom_color_scheme.dart';
import 'package:architecture_template/product/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Açık tema (Light Theme) konfigürasyonu için özel sınıf
///
/// Bu sınıf:
/// - CustomTheme abstract sınıfını extend eder
/// - Açık tema için özel renk şeması ve font ayarları sağlar
/// - Material 3 tasarım sistemini kullanır
/// - Google Fonts ile Inter font ailesini entegre eder
///
/// Kullanım: CustomLightTheme() ile instance oluşturulur
/// Genellikle ThemeData olarak MaterialApp'e verilir
final class CustomLightTheme extends CustomTheme {
  /// Floating Action Button tema konfigürasyonu
  ///
  /// @override ile CustomTheme abstract sınıfındaki metodu implement eder
  ///
  /// Özellikler:
  /// - backgroundColor: CustomColorScheme.lightColorScheme.primary rengi kullanır
  /// - Açık temada primary renk ile uyumlu FAB tasarımı sağlar
  @override
  FloatingActionButtonThemeData get floatingActionButtonThemeData => FloatingActionButtonThemeData(
    backgroundColor: CustomColorScheme.lightColorScheme.primary,
  );

  /// Ana tema verisi (ThemeData) konfigürasyonu
  ///
  /// @override ile CustomTheme abstract sınıfındaki metodu implement eder
  ///
  /// Tema özellikleri:
  /// - useMaterial3: true - Material 3 tasarım sistemini aktif eder
  /// - colorScheme: CustomColorScheme.lightColorScheme - Özel açık tema renk şeması
  /// - floatingActionButtonTheme: floatingActionButtonThemeData - FAB tema ayarları
  /// - fontFamily: GoogleFonts.inter().fontFamily - Inter font ailesi
  ///
  /// Bu tema, uygulamanın açık tema görünümünü tamamen kontrol eder
  @override
  ThemeData get themeData => ThemeData(
    useMaterial3: true, // Material 3 tasarım sistemini kullan
    colorScheme: CustomColorScheme.lightColorScheme, // Özel açık tema renk şeması
    floatingActionButtonTheme: floatingActionButtonThemeData, // FAB tema ayarları
    fontFamily: GoogleFonts.roboto().fontFamily, // Inter font ailesi
  );
}
