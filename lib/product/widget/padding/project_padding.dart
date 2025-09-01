import 'package:flutter/material.dart';

/// Proje genelinde kullanılan padding değerlerini içeren sınıf
/// Bu sınıf, uygulama genelinde tutarlı spacing değerleri sağlar
/// EdgeInsets sınıfından türetilmiştir ve önceden tanımlanmış padding değerleri sunar
final class ProjectPadding extends EdgeInsets {
  /// Küçük boyutlu padding - tüm yönlerde 8 pixel
  /// Genellikle içerik arası minimal boşluklar için kullanılır
  /// Örnek: Icon ve text arası, checkbox ve label arası
  const ProjectPadding.allSmall() : super.all(8);

  /// Orta boyutlu padding - tüm yönlerde 16 pixel
  /// En yaygın kullanılan padding değeri
  /// Örnek: Card içi boşluklar, button padding'leri
  const ProjectPadding.allMedium() : super.all(16);

  /// Normal boyutlu padding - tüm yönlerde 20 pixel
  /// Biraz daha geniş boşluk gerektiren durumlar için
  /// Örnek: Section arası boşluklar, form elemanları arası
  const ProjectPadding.allNormal() : super.all(20);

  /// Büyük boyutlu padding - tüm yönlerde 32 pixel
  /// Geniş boşluk gerektiren durumlar için
  /// Örnek: Sayfa kenar boşlukları, büyük section'lar arası
  const ProjectPadding.allLarge() : super.all(32);

  /// Yatay (sol-sağ) symmetric padding - 16 pixel
  /// Genellikle sayfa kenar boşlukları için kullanılır
  /// Örnek: Liste öğeleri, form elemanları
  const ProjectPadding.horizontal() : super.symmetric(horizontal: 16);

  /// Dikey (üst-alt) symmetric padding - 16 pixel
  /// Genellikle içerik blokları arası boşluklar için kullanılır
  /// Örnek: Paragraf araları, section araları
  const ProjectPadding.vertical() : super.symmetric(vertical: 16);

  /// Yatay (sol-sağ) küçük symmetric padding - 8 pixel
  /// Minimal yatay boşluk gerektiren durumlar için
  /// Örnek: Icon grupları, küçük button grupları
  const ProjectPadding.horizontalSmall() : super.symmetric(horizontal: 8);

  /// Dikey (üst-alt) küçük symmetric padding - 8 pixel
  /// Minimal dikey boşluk gerektiren durumlar için
  /// Örnek: Satır araları, küçük element grupları
  const ProjectPadding.verticalSmall() : super.symmetric(vertical: 8);

  /// Yatay (sol-sağ) büyük symmetric padding - 32 pixel
  /// Geniş yatay boşluk gerektiren durumlar için
  /// Örnek: Geniş sayfa kenar boşlukları, büyük container'lar
  const ProjectPadding.horizontalLarge() : super.symmetric(horizontal: 32);

  /// Dikey (üst-alt) büyük symmetric padding - 32 pixel
  /// Geniş dikey boşluk gerektiren durumlar için
  /// Örnek: Büyük section araları, sayfa araları
  const ProjectPadding.verticalLarge() : super.symmetric(vertical: 32);

  /// Sadece sol padding - 16 pixel
  /// Sol tarafta boşluk gerektiren durumlar için
  /// Örnek: Sol hizalı içerikler, sol kenar boşlukları
  const ProjectPadding.onlyLeft() : super.only(left: 16);

  /// Sadece sağ padding - 16 pixel
  /// Sağ tarafta boşluk gerektiren durumlar için
  /// Örnek: Sağ hizalı içerikler, sağ kenar boşlukları
  const ProjectPadding.onlyRight() : super.only(right: 16);

  /// Sadece üst padding - 16 pixel
  /// Üst tarafta boşluk gerektiren durumlar için
  /// Örnek: Üst kenar boşlukları, header altı boşluklar
  const ProjectPadding.onlyTop() : super.only(top: 16);

  /// Sadece alt padding - 16 pixel
  /// Alt tarafta boşluk gerektiren durumlar için
  /// Örnek: Alt kenar boşlukları, footer üstü boşluklar
  const ProjectPadding.onlyBottom() : super.only(bottom: 16);
}
