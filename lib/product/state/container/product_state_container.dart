import 'package:architecture_template/product/service/manager/product_service_manager.dart';
import 'package:architecture_template/product/state/view_model/product_view_model.dart';
import 'package:get_it/get_it.dart';

/// Dependency Injection container sınıfı
/// Bu sınıf, uygulama genelinde kullanılan singleton objeleri yönetir
/// GetIt paketi kullanılarak merkezi dependency injection sağlanır
final class ProductStateContainer {
  /// Private constructor - singleton pattern için
  ProductStateContainer._();

  /// GetIt instance'ı - dependency injection için kullanılır
  static final GetIt _getIt = GetIt.instance;

  /// Container'ı başlatan setup metodu
  /// Bu metod, uygulama başlangıcında çağrılarak tüm singleton'ları kaydeder
  /// main() fonksiyonunda ApplicationInitalize().init() içinde çağrılır
  static void setup() {
    // ProductNetworkManager'ı singleton olarak kaydet
    // Bu sayede tüm uygulama genelinde aynı instance kullanılır
    // Network istekleri için merkezi yönetim sağlar
    _getIt
      ..registerSingleton<ProductNetworkManager>(ProductNetworkManager())
      // ProductViewModel'i singleton olarak kaydet
      // Global state yönetimi için merkezi view model
      ..registerSingleton<ProductViewModel>(ProductViewModel());
  }

  /// Generic read metodu - kayıtlı objeleri döndürür
  /// @param T - Döndürülecek obje tipi
  /// @return - Kayıtlı obje instance'ı
  static T read<T extends Object>() => _getIt.get<T>();
}
