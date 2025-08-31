import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/src/package/custom_image/custom_memcache.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Ağdan resim yükleyen özel widget sınıfı
/// CachedNetworkImage kullanarak resimleri önbelleğe alır ve performansı artırır
final class CustomNetworkImage extends StatelessWidget {
  /// CustomNetworkImage widget'ının constructor'ı
  /// Tüm parametreler opsiyonel olarak tanımlanmıştır
  const CustomNetworkImage({
    this.memCache, // Bellek önbelleği ayarları
    this.imageUrl, // Yüklenecek resmin URL'i
    this.emptyWidget, // Resim yüklenemediğinde gösterilecek widget
    this.fit = BoxFit.cover, // Resmin nasıl sığdırılacağı (varsayılan: cover)
    this.loadingWidget, // Yükleme sırasında gösterilecek widget
    this.size, // Resmin boyutları
    super.key, // Widget key'i
  });

  // Widget'ın özelliklerini tanımlayan final değişkenler
  final String? imageUrl; // Resim URL'i (null olabilir)
  final Widget? emptyWidget; // Boş durum widget'ı
  final CustomMemCache? memCache; // Bellek önbelleği ayarları
  final BoxFit? fit; // Resim sığdırma stili
  final Widget? loadingWidget; // Yükleme widget'ı
  final Size? size; // Resim boyutları

  @override
  Widget build(BuildContext context) {
    // URL'i yerel değişkene atama
    final url = imageUrl;

    // URL null veya boş ise boş widget'ı döndür
    if (url == null || url.isEmpty) return emptyWidget ?? const SizedBox.shrink();

    // CachedNetworkImage widget'ını döndür
    return CachedNetworkImage(
      imageUrl: url, // Yüklenecek resim URL'i
      // Hata durumunda gösterilecek widget
      errorWidget: (context, url, error) => emptyWidget ?? const SizedBox.shrink(),
      // Bellek önbelleği boyutları (0 ise önbelleğe alınmaz)
      memCacheHeight: memCache?.height ?? 0,
      memCacheWidth: memCache?.width ?? 0,
      fit: fit, // Resim sığdırma stili
      // Yükleme sırasında gösterilecek widget
      progressIndicatorBuilder: (context, url, progress) => loadingWidget ?? const CircularProgressIndicator.adaptive(),
      width: size?.width, // Resim genişliği
      height: size?.height, // Resim yüksekliği
      // Hata dinleyicisi - debug modunda hataları konsola yazdırır
      errorListener: (error) {
        if (kDebugMode) {
          debugPrint('CustomNetworkImage   error: $error');
        }
      },
    );
  }
}
