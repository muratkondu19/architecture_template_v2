import 'package:flutter/foundation.dart';
import 'package:gen/gen.dart';

/// Uygulama ortam konfigürasyonunu yöneten ana sınıf
///
/// Bu sınıf:
/// - Development ve Production ortamları arasında geçiş yapar
/// - Ortam bazlı konfigürasyon değerlerini sağlar
/// - Singleton pattern kullanarak tek instance garantisi verir
///
/// Kullanım örnekleri:
/// - AppEnvironment.general() - Otomatik ortam seçimi
/// - AppEnvironment.setup() - Manuel ortam konfigürasyonu
final class AppEnvironment {
  /// Manuel ortam konfigürasyonu için constructor
  ///
  /// [appConfiguration] parametresi ile özel konfigürasyon ayarlanabilir
  /// Genellikle test ortamları veya özel konfigürasyonlar için kullanılır
  AppEnvironment.setup({required AppConfiguration appConfiguration}) {
    _appConfiguration = appConfiguration;
  }

  /// Otomatik ortam seçimi yapan constructor
  ///
  /// kDebugMode değerine göre:
  /// - Debug modunda: DevEnv() (Development ortamı)
  /// - Release modunda: ProdEnv() (Production ortamı)
  ///
  /// Bu sayede build türüne göre otomatik ortam seçimi yapılır
  AppEnvironment.general() {
    _appConfiguration = kDebugMode ? DevEnv() : ProdEnv();
  }

  /// Uygulama konfigürasyonunu tutan private static değişken
  ///
  /// late final ile:
  /// - Değer sadece bir kez atanabilir
  /// - Runtime'da değer atanır
  /// - Null safety sağlanır
  static late final AppConfiguration _appConfiguration;
}

/// Uygulama ortam konfigürasyon öğelerini tanımlayan enum
///
/// Bu enum ile:
/// - Konfigürasyon değerlerine type-safe erişim sağlanır
/// - Yeni konfigürasyon öğeleri kolayca eklenebilir
/// - Compile-time hata kontrolü yapılır
enum AppEnvironmentItems {
  /// Network istekleri için temel URL adresi
  ///
  /// Örnek: https://api.example.com/v1
  baseUrl,

  /// Örnek API anahtarı
  ///
  /// Örnek API key
  apiKey;

  /// Seçilen konfigürasyon öğesinin değerini döndürür
  ///
  /// Bu getter:
  /// - AppEnvironment'ın başlatılıp başlatılmadığını kontrol eder
  /// - Konfigürasyon değerini güvenli şekilde döndürür
  /// - Hata durumunda açıklayıcı exception fırlatır
  ///
  /// Kullanım: AppEnvironmentItems.baseUrl.value
  String get value {
    try {
      // Switch statement ile enum değerine göre konfigürasyon döndürülür
      switch (this) {
        case AppEnvironmentItems.baseUrl:
          return AppEnvironment._appConfiguration.baseUrl;
        case AppEnvironmentItems.apiKey:
          return AppEnvironment._appConfiguration.apiKey;
      }
    } catch (e) {
      // AppEnvironment başlatılmamışsa hata fırlat
      throw Exception('AppEnvironment is not initialized.');
    }
  }
}
