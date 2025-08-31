import 'package:architecture_template/feature/home/view/home_detail_view.dart';
import 'package:architecture_template/feature/home/view/homw_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

// Auto Route tarafından otomatik olarak oluşturulan route dosyası
part 'app_router.gr.dart';

/// Uygulama router sınıfı - tüm sayfa yönlendirmelerini yönetir
/// AutoRouterConfig ile otomatik route oluşturma aktif edilir
/// replaceInRouteName parametresi ile route isimlerindeki 'View' ve 'Route' kısımları değiştirilir
@AutoRouterConfig(replaceInRouteName: AppRouter._replaceRouteName)
final class AppRouter extends RootStackRouter {
  /// Route isimlerinde yapılacak değişiklikleri tanımlar
  /// 'View' -> 'Route' olarak değiştirilir
  static const _replaceRouteName = 'View,Route';

  /// Uygulama içindeki tüm route'ları tanımlar
  /// Her route bir sayfa ile eşleştirilir
  @override
  List<AutoRoute> get routes => [
    // Ana sayfa route'u - uygulama başlangıcında gösterilir
    AutoRoute(page: HomeRoute.page, initial: true),
    // Ana sayfa detay route'u - ana sayfadan sonra gösterilir
    AutoRoute(page: HomeDetailRoute.page),
  ];
}
