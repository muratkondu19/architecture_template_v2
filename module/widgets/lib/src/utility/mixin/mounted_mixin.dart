import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Stateful widget'lar için güvenli mounted durumu yönetimi sağlayan mixin
/// Bu mixin, widget'ın hala mount edilip edilmediğini kontrol ederek
/// memory leak'leri ve crash'leri önler
/// T: StatefulWidget türünde olmalıdır
mixin MountedMixin<T extends StatefulWidget> on State<T> {
  /// Widget'ın mounted durumunu kontrol ederek güvenli asynchronous işlem yapar
  /// Bu metod, widget dispose edildikten sonra işlem yapılmasını önler
  ///
  /// [callback] parametresi: Güvenli şekilde çalıştırılacak asynchronous fonksiyon
  ///
  /// Kullanım alanları:
  /// - API çağrıları sonrası UI güncellemeleri
  /// - Timer veya Future işlemleri sonrası state değişiklikleri
  /// - Navigation işlemleri
  ///
  /// Örnek kullanım:
  /// ```dart
  /// await safeOperation(() async {
  ///   // Bu kod sadece widget hala mount edilmişse çalışır
  ///   setState(() {
  ///     // State güncellemesi
  ///   });
  /// });
  /// ```
  Future<void> safeOperation(AsyncCallback callback) async {
    // Widget'ın hala mount edilip edilmediğini kontrol et
    // Eğer widget dispose edilmişse işlemi yapma (memory leak önleme)
    if (!mounted) return;

    // Widget hala mount edilmişse callback'i güvenli şekilde çalıştır
    await callback.call();
  }
}
