import 'package:architecture_template/product/cache/model/user_cache_model.dart';
import 'package:core/core.dart';

/// Product cache management sınıfı
/// Bu sınıf, uygulama genelinde kullanılan cache işlemlerini yönetir
/// Hive database kullanılarak offline data storage sağlanır
final class ProductCache {
  /// Constructor - cache manager dependency injection ile alınır
  /// @param cacheManager - Cache işlemlerini yöneten manager
  ProductCache({required CacheManager cacheManager}) : _cacheManager = cacheManager;

  /// Private cache manager instance'ı
  /// Tüm cache işlemleri bu manager üzerinden gerçekleştirilir
  final CacheManager _cacheManager;

  /// Cache sistemini başlatan initialize metodu
  /// Bu metod, uygulama başlangıcında çağrılmalıdır
  /// Tüm cache model'larını kayıt eder ve Hive database'ini hazırlar
  Future<void> init() async {
    // Cache manager'ı başlat ve model'ları kayıt et
    // UserCacheModel.empty() ile default model yapısını tanımla
    await _cacheManager.init(
      cacheModels: [
        UserCacheModel.empty(), // User cache model'ı için default yapı
      ],
    );
  }

  /// User cache işlemleri için özel cache operation instance'ı
  /// Bu instance ile User verilerini cache'e ekleyebilir, silebilir ve okuyabilirsiniz
  /// Late initialization kullanılarak init() çağrısından sonra kullanılabilir hale gelir
  late final HiveCacheOperation<UserCacheModel> userCacheOperation = HiveCacheOperation<UserCacheModel>();
}
