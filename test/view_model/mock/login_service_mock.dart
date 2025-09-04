import 'package:architecture_template/product/service/interface/authentication_operation.dart';
import 'package:gen/gen.dart';
import 'package:mockito/mockito.dart';

/// Authentication service için mock sınıfı
/// Bu sınıf, test ortamında AuthenticationOperation interface'ini mock'lar
/// Mockito paketi kullanılarak gerçek service yerine test verisi döndürür
/// Test verileri sabit olarak tanımlanmıştır
final class LoginServiceMock extends Mock implements AuthenticationOperation {
  /// Mock users metodu - test için sabit kullanıcı listesi döndürür
  /// Gerçek API çağrısı yapmadan test verisi sağlar
  /// @return - Test için hazırlanmış User listesi
  @override
  Future<List<User>> users() async {
    // Test için sabit kullanıcı verileri
    // Her test için aynı veri seti döndürülür
    return [
      const User(body: 'body1', id: 1, title: 'title', userId: 1),
      const User(body: 'body2', id: 2, title: 'title2', userId: 2),
      const User(body: 'body3', id: 3, title: 'title3', userId: 3),
    ];
  }
}
