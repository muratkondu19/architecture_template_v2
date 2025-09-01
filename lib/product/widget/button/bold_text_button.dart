// Flutter Material Design kütüphanesini import ediyoruz
import 'package:flutter/material.dart';

/// Kalın metin butonu - TextButton'ın özel bir implementasyonu
/// Bu buton 20 elevation (yükseklik) değeri ile gölge efekti sağlar
/// Material Design prensiplerine uygun olarak yüksek görsel etki yaratır
final class BoldTextButton extends TextButton {
  /// BoldTextButton constructor'ı
  /// [onPressed] parametresi: Buton tıklandığında çalışacak callback fonksiyon
  /// [child] parametresi: Buton içinde gösterilecek widget (genellikle Text)
  /// [key] parametresi: Widget'ı benzersiz olarak tanımlamak için kullanılan opsiyonel key
  BoldTextButton({
    required super.onPressed, // Zorunlu: Buton tıklama callback'i
    required super.child, // Zorunlu: Buton içeriği
    super.key, // Opsiyonel: Widget key'i
  }) : super(
         // TextButton'ın style'ını özelleştiriyoruz
         style: TextButton.styleFrom(
           elevation: 20, // 20 birimlik yükseklik - güçlü gölge efekti yaratır
         ),
       );
}
