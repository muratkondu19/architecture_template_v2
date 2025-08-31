import 'package:flutter/material.dart';

/// Temel dialog sınıfı - Tüm dialog'lar için ortak yapıyı sağlar
/// Bu sınıf, dialog gösterme işlemlerini standartlaştırır
final class DialogBase {
  // Private constructor - Bu sınıfın instance'ı oluşturulamaz
  DialogBase._();

  /// Generic dialog gösterme metodu
  /// [T] tipinde bir değer döndüren dialog'lar için kullanılır
  ///
  /// Parametreler:
  /// - [context]: BuildContext - Dialog'un gösterileceği context
  /// - [builder]: WidgetBuilder - Dialog içeriğini oluşturan builder fonksiyonu
  ///
  /// Özellikler:
  /// - barrierDismissible: false - Arka plana tıklayarak kapatılamaz
  /// - useSafeArea: false - Safe area kısıtlamaları uygulanmaz
  static Future<T?> show<T>({
    required BuildContext context,
    required WidgetBuilder builder,
  }) async {
    // Flutter'ın standart showDialog metodunu çağırır
    // Özelleştirilmiş ayarlarla dialog'u gösterir
    return showDialog<T>(
      context: context,
      barrierDismissible: false, // Arka plana tıklayarak kapatılamaz
      useSafeArea: false, // Safe area kısıtlamaları uygulanmaz
      builder: builder, // Dialog içeriğini oluşturan builder
    );
  }
}
