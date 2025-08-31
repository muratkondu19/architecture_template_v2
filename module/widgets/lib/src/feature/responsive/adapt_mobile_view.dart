import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

/// Sadece mobil ve tablet cihazlar için view adaptasyonu yapan sınıf
///
/// Bu sınıf, masaüstü cihazları hariç tutarak sadece mobil ve tablet
/// cihazlar için responsive tasarım sağlar. ResponsiveFramework paketi
/// kullanılarak cihaz türü tespit edilir ve uygun widget gösterilir.
///
/// Kullanım amacı:
/// - Mobil ve tablet için özel layout'lar sağlamak
/// - Masaüstü cihazları responsive hesaplamadan çıkarmak
/// - Mobil öncelikli tasarım yaklaşımı uygulamak
final class AdaptMobileView extends StatelessWidget {
  /// AdaptMobileView widget'ını oluşturur
  ///
  /// [phone]: Widget - Mobil cihazlar için gösterilecek widget
  /// [tablet]: Widget - Tablet cihazlar için gösterilecek widget
  /// [key]: Key? - Widget'ın benzersiz anahtarı (opsiyonel)
  const AdaptMobileView({
    required this.phone,
    required this.tablet,
    super.key,
  });

  /// Mobil cihazlar için tasarlanmış widget
  final Widget phone;

  /// Tablet cihazlar için tasarlanmış widget
  final Widget tablet;

  @override
  Widget build(BuildContext context) {
    // ResponsiveBreakpoints ile cihaz türünü tespit et
    // Mobil cihaz ise phone widget'ını göster
    if (ResponsiveBreakpoints.of(context).isMobile) return phone;

    // Tablet cihaz ise tablet widget'ını göster
    if (ResponsiveBreakpoints.of(context).isTablet) return tablet;

    // Varsayılan olarak tablet widget'ını göster
    // (Masaüstü ve diğer cihaz türleri için tablet layout kullanılır)
    return tablet;
  }
}
