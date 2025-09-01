import 'package:architecture_template/product/service/manager/product_service_manager.dart';
import 'package:architecture_template/product/state/container/product_state_container.dart';

/// Product state yönetimi için kullanılan singleton sınıf
/// Bu sınıf, uygulama genelinde kullanılan state objelerine erişim sağlar
/// Dependency Injection pattern'i kullanarak merkezi state yönetimi yapar
final class ProductStateItems {
  /// Private constructor - singleton pattern için
  ProductStateItems._();

  /// Network manager'a erişim sağlayan static getter
  /// ProductStateContainer'dan ProductNetworkManager instance'ını döndürür
  /// Bu sayede tüm uygulama genelinde aynı network manager instance'ı kullanılır
  static ProductNetworkManager get networkManager => ProductStateContainer.read<ProductNetworkManager>();
}
