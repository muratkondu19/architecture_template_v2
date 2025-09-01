import 'package:flutter/material.dart';

/// Network hatalarını yönetmek için kullanılan sınıf
/// Bu sınıf, ağ isteklerinde oluşan hataları yakalar ve kullanıcıya uygun şekilde gösterir
class ProductNetworkErrorManager {
  /// Constructor - BuildContext gereklidir çünkü hata mesajları göstermek için gerekli
  ProductNetworkErrorManager({required this.context});

  /// Flutter widget ağacındaki context - hata mesajları göstermek için kullanılır
  final BuildContext context;

  /// HTTP status koduna göre hata işleme metodu
  /// @param statusCode - HTTP response status kodu (200, 404, 500 vb.)
  void handleError(int statusCode) {
    // TODO: Status koduna göre farklı hata mesajları gösterilecek
    // Örnek: 404 -> "Sayfa bulunamadı", 500 -> "Sunucu hatası" vb.
  }
}
