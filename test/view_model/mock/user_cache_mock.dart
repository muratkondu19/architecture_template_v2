import 'package:architecture_template/product/cache/model/user_cache_model.dart';
import 'package:core/core.dart';
import 'package:mockito/mockito.dart';

/// User cache operasyonları için mock sınıfı
/// Bu sınıf, test ortamında HiveCacheOperation interface'ini mock'lar
/// In-memory list kullanarak cache işlemlerini simüle eder
/// Gerçek Hive database kullanmadan cache testleri yapılabilir
class UserCacheMock extends Mock implements HiveCacheOperation<UserCacheModel> {
  /// In-memory cache listesi - test verilerini saklar
  /// Gerçek Hive box yerine basit list kullanır
  final List<UserCacheModel> _userCacheModel = [];

  /// Mock add metodu - item'ı in-memory list'e ekler
  /// Gerçek cache'e yazma işlemini simüle eder
  /// @param item - Cache'e eklenecek UserCacheModel objesi
  @override
  void add(UserCacheModel item) {
    _userCacheModel.add(item);
  }

  /// Mock getAll metodu - in-memory list'teki tüm item'ları döndürür
  /// Gerçek cache'den okuma işlemini simüle eder
  /// @return - Cache'deki tüm UserCacheModel objelerinin listesi
  @override
  List<UserCacheModel> getAll() {
    return _userCacheModel;
  }
}
