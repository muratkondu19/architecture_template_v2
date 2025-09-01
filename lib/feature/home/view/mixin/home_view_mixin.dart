import 'package:architecture_template/feature/home/view/homw_view.dart';
import 'package:architecture_template/product/service/manager/product_network_error_manager.dart';
import 'package:architecture_template/product/service/manager/product_service_manager.dart';
import 'package:flutter/material.dart';

/// View sınıfına ait logic işlemler mixin sınıflarında tutulur.
/// Bu mixin, HomeView widget'ının state yönetimi ve network işlemlerini yönetir.
mixin HomeViewMixin on State<HomeView> {
  // Network işlemlerini yönetmek için gerekli yönetici sınıfları
  late final ProductNetworkManager networkManager; // Ağ isteklerini yöneten ana sınıf
  late final ProductNetworkErrorManager networkErrorManager; // Ağ hatalarını yöneten sınıf

  @override
  void initState() {
    super.initState();

    // Network yöneticilerini başlat
    networkManager = ProductNetworkManager(); // Ağ istekleri için yönetici oluştur
    networkErrorManager = ProductNetworkErrorManager(
      context: context,
    ); // Hata yönetimi için context ile yönetici oluştur

    // Network hata durumlarını dinle ve hata yöneticisine yönlendir
    networkManager.listenErorState(
      onErrorStatus: networkErrorManager.handleError, // Hata durumunda handleError metodunu çağır
    );
  }

  @override
  void dispose() {
    // Widget dispose edildiğinde temizlik işlemleri
    // Şu anda herhangi bir temizlik işlemi yapılmıyor
    super.dispose();
  }
}
