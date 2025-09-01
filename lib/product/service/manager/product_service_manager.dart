import 'dart:io';

import 'package:architecture_template/product/init/config/app_enviroment.dart';
import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

/// Ana network yönetim sınıfı
/// Bu sınıf, tüm HTTP isteklerini yönetir ve hata durumlarını yakalar
/// Vexana paketinin NetworkManager sınıfından türetilmiştir
class ProductNetworkManager extends NetworkManager<EmptyModel> {
  /// Constructor - Base URL'i AppEnvironment'den alır
  /// AppEnvironmentItems.baseUrl.value ile dinamik olarak environment'a göre URL belirlenir
  ProductNetworkManager() : super(options: BaseOptions(baseUrl: AppEnvironmentItems.baseUrl.value));

  /// Network hata durumlarını dinleyen metod
  /// Bu metod, HTTP isteklerinde oluşan hataları yakalar ve callback fonksiyonuna yönlendirir
  /// @param onErrorStatus - Hata durumunda çağrılacak callback fonksiyonu
  void listenErorState({required ValueChanged<int> onErrorStatus}) {
    // Vexana interceptor'ı eklenir - tüm HTTP hatalarını yakalar
    interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) {
          // HTTP status kodunu alır, yoksa 404 (not found) döndürür
          onErrorStatus(error.response?.statusCode ?? HttpStatus.notFound);
          // Hatayı bir sonraki interceptor'a veya error handler'a yönlendirir
          return handler.next(error);
        },
      ),
    );
  }
}
