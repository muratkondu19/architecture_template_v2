// Gerekli import'lar - HomeView, login service, network error manager, state items ve Flutter widget'ları
import 'package:architecture_template/feature/home/view/homw_view.dart';
import 'package:architecture_template/product/service/login_service.dart';
import 'package:architecture_template/product/service/manager/product_network_error_manager.dart';
import 'package:architecture_template/product/state/container/product_state_items.dart';
import 'package:flutter/material.dart';

/// View sınıfına ait logic işlemler mixin sınıflarında tutulur.
/// Bu mixin, HomeView widget'ının state yönetimi ve network işlemlerini yönetir.
mixin HomeViewMixin on State<HomeView> {
  // Network işlemlerini yönetmek için gerekli yönetici sınıfları
  late final LoginService loginService; // Kullanıcı işlemleri için login service
  late final ProductNetworkErrorManager networkErrorManager; // Ağ hatalarını yöneten sınıf

  @override
  void initState() {
    super.initState();

    // Network yöneticilerini başlat
    // LoginService'i ProductStateItems'den alınan network manager ile oluştur
    // Bu sayede singleton pattern ile aynı network manager instance'ı kullanılır
    loginService = LoginService(networkManager: ProductStateItems.networkManager);

    // Hata yönetimi için context ile network error manager oluştur
    networkErrorManager = ProductNetworkErrorManager(
      context: context,
    );

    // Network hata durumlarını dinle ve hata yöneticisine yönlendir
    // ProductStateItems'den alınan network manager'ın hata dinleyicisini kur
    ProductStateItems.networkManager.listenErorState(
      onErrorStatus: networkErrorManager.handleError, // Hata durumunda handleError metodunu çağır
    );
  }

  @override
  void dispose() {
    // Widget dispose edildiğinde temizlik işlemleri
    // Şu anda herhangi bir temizlik işlemi yapılmıyor
    // İleride gerekirse network listener'ları kapatılabilir
    super.dispose();
  }
}
