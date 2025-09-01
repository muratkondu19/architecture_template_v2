import 'package:architecture_template/product/service/manager/service_path.dart';
import 'package:gen/gen.dart';
import 'package:vexana/vexana.dart';

/// Login ve kullanıcı işlemleri için service sınıfı
/// Bu sınıf, kullanıcı ile ilgili tüm API işlemlerini yönetir
/// Network manager dependency injection ile alınır
final class LoginService {
  /// Constructor - network manager dependency injection ile alınır
  /// @param networkManager - HTTP istekleri için kullanılacak network manager
  LoginService({required INetworkManager<EmptyModel> networkManager}) : _networkManager = networkManager;

  /// Private network manager instance'ı - HTTP istekleri için kullanılır
  final INetworkManager<EmptyModel> _networkManager;

  /// Kullanıcı listesini getiren metod
  /// ServicePath.users.fullPath endpoint'ini kullanarak GET isteği yapar
  /// @return - User listesi, hata durumunda boş liste döner
  Future<List<User>> users() async {
    // Network manager ile GET isteği yap
    final response = await _networkManager.send<User, List<User>>(
      ServicePath.users.fullPath, // API endpoint path'i
      parseModel: const User(), // Response'u parse etmek için User model'i
      method: RequestType.GET, // HTTP GET metodu
    );

    // Response data'sını döndür, null ise boş liste döndür
    return response.data ?? [];
  }
}
