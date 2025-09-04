import 'package:core/src/cache/core/cache_model.dart';

/// Cache yönetimi için abstract base sınıf
/// Bu sınıf, farklı cache implementasyonları için ortak interface sağlar
/// Strategy pattern kullanılarak farklı cache teknolojileri desteklenir
abstract class CacheManager {
  /// Constructor - cache dosyalarının saklanacağı path'i alır
  /// @param path - Cache dosyalarının saklanacağı dizin yolu (opsiyonel)
  const CacheManager({required this.path});

  /// Cache sistemini başlatan initialize metodu
  /// Bu metod, cache sistemini hazırlar ve model'ları kayıt eder
  /// @param cacheModels - Cache'de kullanılacak model'ların listesi
  Future<void> init({required List<CacheModel> cacheModels});

  /// Cache'deki tüm verileri silen metod
  /// Uygulama temizleme işlemleri için kullanılır
  Future<void> remove();

  /// Cache dosyalarının saklanacağı dizin yolu
  /// Null ise default sistem dizini kullanılır
  final String? path;
}
