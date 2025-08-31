import 'package:flutter/widgets.dart';
import 'package:responsive_framework/responsive_framework.dart';

/// Responsive tasarım için özelleştirilmiş sınıf
///
/// Bu sınıf, farklı ekran boyutlarına göre uygulamanın responsive davranışını
/// yönetmek için kullanılır. ResponsiveFramework paketi kullanılarak
/// breakpoint'ler tanımlanır ve her ekran boyutu için uygun layout sağlanır.
///
/// Kullanılan paket: responsive_framework
/// - Flutter uygulamalarında responsive tasarım için güçlü bir çözüm
/// - Otomatik breakpoint yönetimi ve responsive widget'lar sağlar
/// - Farklı cihaz türleri için optimize edilmiş layout'lar oluşturur
final class CustomResponsive {
  /// Responsive breakpoint'leri tanımlar ve responsive wrapper oluşturur
  ///
  /// [context]: BuildContext - Widget ağacındaki konum bilgisi
  /// [child]: Widget? - Responsive wrapper içine yerleştirilecek widget
  ///
  /// Dönen değer: ResponsiveBreakpoints ile sarılmış widget
  ///
  /// Breakpoint'ler:
  /// - MOBILE: 0-450px (mobil cihazlar)
  /// - TABLET: 451-800px (tablet cihazlar)
  /// - DESKTOP: 801-1920px (masaüstü bilgisayarlar)
  /// - 4K: 1921px+ (4K ve üzeri ekranlar)
  static Widget build(BuildContext context, Widget? child) {
    return ResponsiveBreakpoints.builder(
      child: child!, // Null check ile child widget'ı alır
      breakpoints: [
        // Mobil cihazlar için breakpoint (0-450px)
        const Breakpoint(start: 0, end: 450, name: MOBILE),
        // Tablet cihazlar için breakpoint (451-800px)
        const Breakpoint(start: 451, end: 800, name: TABLET),
        // Masaüstü bilgisayarlar için breakpoint (801-1920px)
        const Breakpoint(start: 801, end: 1920, name: DESKTOP),
        // 4K ve üzeri ekranlar için breakpoint (1921px+)
        const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
      ],
    );
  }
}
