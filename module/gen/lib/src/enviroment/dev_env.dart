import 'package:envied/envied.dart';
import 'package:gen/src/enviroment/app_configartion.dart';

/// Envied paketi tarafından otomatik oluşturulan dosya
/// Bu dosya .env dosyasındaki değerleri Dart koduna dönüştürür
part 'dev_env.g.dart';

/// Development ortamı konfigürasyon sınıfı
///
/// Bu sınıf:
/// - Development ortamı için gerekli konfigürasyon değerlerini sağlar
/// - Envied paketi ile .env dosyasından değerleri okur
/// - AppConfiguration interface'ini implement eder
///
/// Özellikler:
/// - obfuscate: true - Production build'de değerler gizlenir
/// - path: 'assets/env/.dev.env' - Development ortam .env dosyası
///
/// Kullanım: DevEnv() ile instance oluşturulur
@Envied(
  obfuscate: true, // Production build'de değerleri gizle
  path: 'assets/env/.dev.env', // Development ortam .env dosyası yolu
)
final class DevEnv implements AppConfiguration {
  /// Base URL değerini .env dosyasından okur
  ///
  /// @EnviedField annotation ile:
  /// - varName: 'BASE_URL' - .env dosyasındaki değişken adı
  /// - static final - Compile-time'da değer atanır
  /// - _DevEnv._baseUrl - Otomatik oluşturulan getter
  @EnviedField(varName: 'BASE_URL')
  static final String _baseUrl = _DevEnv._baseUrl;

  /// API Key değerini .env dosyasından okur
  ///
  /// @EnviedField annotation ile:
  /// - varName: 'API_KEY' - .env dosyasındaki değişken adı
  /// - static final - Compile-time'da değer atanır
  /// - _DevEnv._apiKey - Otomatik oluşturulan getter
  @EnviedField(varName: 'API_KEY')
  static final String _apiKey = _DevEnv._apiKey;

  /// AppConfiguration interface'ini implement eden getter
  ///
  /// @override ile interface contract'ı sağlanır
  /// _apiKey private değişkeninin değerini döndürür
  @override
  String get apiKey => _apiKey;

  /// AppConfiguration interface'ini implement eden getter
  ///
  /// @override ile interface contract'ı sağlanır
  /// _baseUrl private değişkeninin değerini döndürür
  @override
  String get baseUrl => _baseUrl;
}
