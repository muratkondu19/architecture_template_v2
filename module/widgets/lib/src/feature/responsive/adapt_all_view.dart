import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

/// Responsive tasarım için widget adaptasyon sınıfı
///
/// Bu sınıf, farklı ekran boyutlarına göre uygun widget'ları göstermek için
/// kullanılır. ResponsiveFramework paketi ile cihaz türünü tespit eder ve
/// ilgili widget'ı render eder.
///
/// Kullanım amacı:
/// - Mobil, tablet ve masaüstü için farklı layout'lar sağlamak
/// - Cihaz türüne göre otomatik widget seçimi yapmak
/// - Responsive tasarım prensiplerini uygulamak
final class AdaptAllView extends StatelessWidget {
  /// AdaptAllView widget'ını oluşturur
  ///
  /// [phone]: Widget - Mobil cihazlar için gösterilecek widget
  /// [tablet]: Widget - Tablet cihazlar için gösterilecek widget
  /// [desktop]: Widget - Masaüstü cihazlar için gösterilecek widget
  /// [key]: Key? - Widget'ın benzersiz anahtarı (opsiyonel)
  const AdaptAllView({
    required this.phone,
    required this.tablet,
    required this.desktop,
    super.key,
  });

  /// Mobil cihazlar için tasarlanmış widget
  final Widget phone;

  /// Tablet cihazlar için tasarlanmış widget
  final Widget tablet;

  /// Masaüstü cihazlar için tasarlanmış widget
  final Widget desktop;

  @override
  Widget build(BuildContext context) {
    // ResponsiveBreakpoints ile cihaz türünü tespit et
    // Mobil cihaz ise phone widget'ını göster
    if (ResponsiveBreakpoints.of(context).isMobile) return phone;

    // Tablet cihaz ise tablet widget'ını göster
    if (ResponsiveBreakpoints.of(context).isTablet) return tablet;

    // Masaüstü cihaz ise desktop widget'ını göster
    if (ResponsiveBreakpoints.of(context).isDesktop) return desktop;

    // Varsayılan olarak masaüstü widget'ını göster
    // (4K gibi tanımlanmamış breakpoint'ler için)
    return desktop;
  }
}
