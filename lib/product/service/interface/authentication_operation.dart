import 'package:gen/gen.dart';

/// Authentication işlemleri için abstract interface
/// Bu interface, kullanıcı ile ilgili tüm işlemlerin contract'ını tanımlar
/// Concrete implementation'lar bu interface'i implement eder
abstract class AuthenticationOperation {
  /// Kullanıcı listesini getiren metod
  /// Bu metod, API'den kullanıcı listesini çeker
  /// @return - User listesi, hata durumunda boş liste döner
  Future<List<User>> users();
}
