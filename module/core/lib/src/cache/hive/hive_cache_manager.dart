import 'package:core/core.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

/// Hive database kullanarak cache yönetimi sağlayan implementasyon
/// Bu sınıf, CacheManager abstract sınıfının Hive ile implementasyonudur
/// NoSQL key-value database olan Hive'ı kullanarak offline data storage sağlar
final class HiveCacheManager extends CacheManager {
  /// Constructor - parent class'ın path parametresini alır
  /// @param path - Hive database dosyalarının saklanacağı dizin yolu
  HiveCacheManager({required super.path});

  /// Hive cache sistemini başlatan initialize metodu
  /// Bu metod, Hive database'ini hazırlar ve model adapter'larını kayıt eder
  /// @param cacheModels - Cache'de kullanılacak model'ların listesi
  @override
  Future<void> init({required List<CacheModel> cacheModels}) async {
    // Path belirtilmemişse sistem documents dizinini kullan
    final documentPath = path ?? (await getApplicationDocumentsDirectory()).path;
    // Hive'ın default dizinini ayarla
    Hive.defaultDirectory = documentPath;

    // Her cache model için Hive adapter'ını kayıt et
    // Runtime type'ı string olarak kullanarak unique adapter isimleri oluştur
    for (final cacheModel in cacheModels) {
      Hive.registerAdapter('${cacheModel.runtimeType}', cacheModel.fromDynamicJson);
    }
  }

  /// Hive database'deki tüm box'ları silen metod
  /// Uygulama temizleme işlemleri için kullanılır
  /// Tüm cache verilerini kalıcı olarak siler
  @override
  Future<void> remove() async {
    Hive.deleteAllBoxesFromDisk();
  }
}
