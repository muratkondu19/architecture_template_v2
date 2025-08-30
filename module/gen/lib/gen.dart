/// Gen Modülü - Merkezi Export Noktası
///
/// Bu modül:
/// - Environment konfigürasyonlarını merkezi olarak yönetir
/// - AppConfiguration, DevEnv ve ProdEnv sınıflarını export eder
/// - Ana projeden bağımsız olarak çalışır
/// - Modüler yapı ile kod organizasyonunu iyileştirir
///
/// Yapılan İşlemler:
/// - Environment konfigürasyonları ayrı modüle taşındı
/// - Merkezi export ile tek noktadan erişim sağlandı
/// - Ana proje daha temiz ve organize hale getirildi
///
/// Kullanım Akışı:
/// Gen Modülü (module/gen/) → AppEnvironment → Ana Uygulama
///
/// Avantajları:
/// - Temiz kod yapısı
/// - Modüler organizasyon
/// - Kolay bakım ve güncelleme
/// - Yeniden kullanılabilirlik
library;

export 'src/index.dart';
