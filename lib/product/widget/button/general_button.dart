import 'package:architecture_template/product/utility/constants/project_radius.dart';
import 'package:flutter/material.dart';

/// Genel amaçlı buton widget'ı - Proje genelinde standart buton tasarımı
/// Bu buton InkWell kullanarak dokunma efektleri sağlar
/// Radius değeri ProjectRadius.normal (20) olarak ayarlanmıştır
final class GeneralButton extends StatelessWidget {
  /// GeneralButton constructor'ı
  /// [title] parametresi: Buton üzerinde gösterilecek metin (zorunlu)
  /// [onPressed] parametresi: Buton tıklandığında çalışacak fonksiyon (zorunlu)
  /// [key] parametresi: Widget'ı benzersiz tanımlamak için opsiyonel key
  const GeneralButton({
    required this.title, // Zorunlu: Buton metni
    required this.onPressed, // Zorunlu: Tıklama callback'i
    super.key, // Opsiyonel: Widget key'i
  });

  /// Buton üzerinde görüntülenecek metin
  /// Bu değer buton oluşturulduğunda belirlenir ve değiştirilemez
  final String title;

  /// Buton tıklandığında çalışacak callback fonksiyon
  /// VoidCallback türünde - parametre almaz, değer döndürmez
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    // InkWell: Material Design dokunma efektleri sağlar
    return InkWell(
      /// Dokunma efekti için radius değeri
      /// ProjectRadius.normal.value = 20 (sabít radius değeri)
      radius: ProjectRadius.normal.value,

      /// Buton tıklandığında çalışacak callback
      onTap: onPressed,

      /// Buton içeriği - sadece metin gösterimi
      /// Gelecekte icon veya diğer widget'lar eklenebilir
      child: Text(title),
    );
  }
}
