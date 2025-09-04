// Gerekli import'lar - HomeView, login service, network error manager, state items ve Flutter widget'ları
import 'package:architecture_template/feature/home/view/homw_view.dart';
import 'package:architecture_template/feature/home/view_model/home_view_model.dart';
import 'package:architecture_template/product/service/login_service.dart';
import 'package:architecture_template/product/service/manager/product_network_error_manager.dart';
import 'package:architecture_template/product/state/base/base_sate.dart';
import 'package:architecture_template/product/state/container/product_state_items.dart';

/// View sınıfına ait logic işlemler mixin sınıflarında tutulur.
/// Bu mixin, HomeView widget'ının state yönetimi ve network işlemlerini yönetir.
mixin HomeViewMixin on BaseState<HomeView> {
  // Network işlemlerini yönetmek için gerekli yönetici sınıfları
  late final ProductNetworkErrorManager _networkErrorManager; // Ağ hatalarını yöneten sınıf
  late final HomeViewModel _homeViewModel;

  HomeViewModel get homeViewModel => _homeViewModel;
  ProductNetworkErrorManager get networkErrorManager => _networkErrorManager;

  @override
  void initState() {
    super.initState();

    // Network yöneticilerini başlat
    // LoginService'i ProductStateItems'den alınan network manager ile oluştur
    // Bu sayede singleton pattern ile aynı network manager instance'ı kullanılır

    // Hata yönetimi için context ile network error manager oluştur
    _networkErrorManager = ProductNetworkErrorManager(
      context: context,
    );

    // Network hata durumlarını dinle ve hata yöneticisine yönlendir
    // ProductStateItems'den alınan network manager'ın hata dinleyicisini kur
    ProductStateItems.networkManager.listenErorState(
      onErrorStatus: _networkErrorManager.handleError, // Hata durumunda handleError metodunu çağır
    );

    _homeViewModel = HomeViewModel(
      authenticationOperation: LoginService(networkManager: networkManager),
    );
  }

  @override
  void dispose() {
    // Widget dispose edildiğinde temizlik işlemleri
    // Şu anda herhangi bir temizlik işlemi yapılmıyor
    // İleride gerekirse network listener'ları kapatılabilir
    // Örnek: ProductStateItems.networkManager.dispose();
    super.dispose();
  }
}
