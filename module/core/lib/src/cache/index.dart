/// Cache modülü ana export dosyası
/// Bu dosya, tüm cache alt modüllerini dış modüllere expose eder
/// Core cache interface'leri ve Hive implementasyonlarını içerir
library;

export 'core/index.dart'; // Core cache interface'leri (CacheManager, CacheModel, CacheOperation)
export 'hive/index.dart'; // Hive implementasyonları (HiveCacheManager, HiveCacheOperation)
