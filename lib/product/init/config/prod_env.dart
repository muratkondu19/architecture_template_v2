import 'package:architecture_template/product/init/config/app_configartion.dart';
import 'package:envied/envied.dart';

/// Envied paketi tarafından otomatik oluşturulan dosya
/// Bu dosya .env dosyasındaki değerleri Dart koduna dönüştürür
part 'prod_env.g.dart';

/// Production ortamı konfigürasyon sınıfı
///
/// Bu sınıf:
/// - Production ortamı için gerekli konfigürasyon değerlerini sağlar
/// - Envied paketi ile .env dosyasından değerleri okur
/// - AppConfiguration interface'ini implement eder
///
/// Özellikler:
/// - obfuscate: true - Production build'de değerler gizlenir (güvenlik için)
/// - path: 'assets/env/.prod.env' - Production ortam .env dosyası
///
/// Kullanım: ProdEnv() ile instance oluşturulur
/// Genellikle AppEnvironment.general() ile otomatik seçilir
@Envied(
  obfuscate: true, // Production build'de değerleri gizle (güvenlik)
  path: 'assets/env/.prod.env', // Production ortam .env dosyası yolu
)
final class ProdEnv implements AppConfiguration {
  /// Production ortamı Base URL değerini .env dosyasından okur
  ///
  /// @EnviedField annotation ile:
  /// - varName: 'BASE_URL' - .env dosyasındaki değişken adı
  /// - static final - Compile-time'da değer atanır
  /// - _ProdEnv._baseUrl - Otomatik oluşturulan getter
  ///
  /// Not: Production'da gerçek API sunucu adresi kullanılır
  @EnviedField(varName: 'BASE_URL')
  static final String _baseUrl = _ProdEnv._baseUrl;

  /// Production ortamı API Key değerini .env dosyasından okur
  ///
  /// @EnviedField annotation ile:
  /// - varName: 'API_KEY' - .env dosyasındaki değişken adı
  /// - static final - Compile-time'da değer atanır
  /// - _ProdEnv._apiKey - Otomatik oluşturulan getter
  ///
  /// Not: Production'da gerçek API anahtarı kullanılır
  @EnviedField(varName: 'API_KEY')
  static final String _apiKey = _ProdEnv._apiKey;

  /// AppConfiguration interface'ini implement eden getter
  ///
  /// @override ile interface contract'ı sağlanır
  /// _apiKey private değişkeninin değerini döndürür
  /// Production ortamında gerçek API anahtarı döndürülür
  @override
  String get apiKey => _apiKey;

  /// AppConfiguration interface'ini implement eden getter
  ///
  /// @override ile interface contract'ı sağlanır
  /// _baseUrl private değişkeninin değerini döndürür
  /// Production ortamında gerçek API sunucu adresi döndürülür
  @override
  String get baseUrl => _baseUrl;
}
