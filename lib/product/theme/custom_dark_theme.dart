import 'package:architecture_template/product/theme/custom_color_scheme.dart';
import 'package:architecture_template/product/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Koyu tema (Dark Theme) konfigürasyonu için özel sınıf
///
/// Bu sınıf:
/// - CustomTheme abstract sınıfını extend eder
/// - Koyu tema için özel renk şeması ve font ayarları sağlar
/// - Material 3 tasarım sistemini kullanır
/// - Google Fonts ile Inter font ailesini entegre eder
///
/// Kullanım: CustomDarkTheme() ile instance oluşturulur
/// Genellikle ThemeData olarak MaterialApp'e verilir
/// Kullanıcı tercihi veya sistem ayarına göre otomatik seçilir
final class CustomDarkTheme extends CustomTheme {
  /// Floating Action Button tema konfigürasyonu
  ///
  /// @override ile CustomTheme abstract sınıfındaki metodu implement eder
  ///
  /// Özellikler:
  /// - backgroundColor: CustomColorScheme.darkColorScheme.primary rengi kullanır
  /// - Koyu temada primary renk ile uyumlu FAB tasarımı sağlar
  /// - Göz yorgunluğunu azaltan kontrast oranları
  @override
  FloatingActionButtonThemeData get floatingActionButtonThemeData => FloatingActionButtonThemeData(
    backgroundColor: CustomColorScheme.darkColorScheme.primary,
  );

  /// Ana tema verisi (ThemeData) konfigürasyonu
  ///
  /// @override ile CustomTheme abstract sınıfındaki metodu implement eder
  ///
  /// Tema özellikleri:
  /// - useMaterial3: true - Material 3 tasarım sistemini aktif eder
  /// - colorScheme: CustomColorScheme.darkColorScheme - Özel koyu tema renk şeması
  /// - floatingActionButtonTheme: floatingActionButtonThemeData - FAB tema ayarları
  /// - fontFamily: GoogleFonts.inter().fontFamily - Inter font ailesi
  ///
  /// Bu tema, uygulamanın koyu tema görünümünü tamamen kontrol eder
  /// Gece modu ve düşük ışık koşullarında ideal görünüm sağlar
  @override
  ThemeData get themeData => ThemeData(
    useMaterial3: true, // Material 3 tasarım sistemini kullan
    colorScheme: CustomColorScheme.darkColorScheme, // Özel koyu tema renk şeması
    floatingActionButtonTheme: floatingActionButtonThemeData, // FAB tema ayarları
    fontFamily: GoogleFonts.inter().fontFamily, // Inter font ailesi
  );
}
