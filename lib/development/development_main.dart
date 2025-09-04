import 'package:architecture_template/product/init/application_initalize.dart';
import 'package:architecture_template/product/init/product_localization.dart';
import 'package:architecture_template/product/init/state_initialize.dart';
import 'package:architecture_template/product/navigation/app_router.dart';
import 'package:architecture_template/product/state/view_model/product_view_model.dart';
import 'package:architecture_template/product/theme/index.dart';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widgets/widgets.dart';

/// Development ortamı için ana giriş noktası
/// Bu fonksiyon development sırasında device preview ile uygulama başlatır
void main() async {
  // Uygulama başlatma işlemlerini gerçekleştir (database, network, vb.)
  await ApplicationInitalize().init();

  // Development ortamında device preview ile uygulama çalıştır
  // DevicePreview: Farklı cihaz boyutlarında test etmek için wrapper
  // StateInitialize: Global state yönetimi için wrapper
  // ProductLocalization: Çoklu dil desteği için wrapper
  // _MyApp: Ana uygulama widget'ı
  runApp(
    DevicePreview(
      builder: (context) => StateInitialize(child: ProductLocalization(child: _MyApp())),
    ),
  );
}

/// Development ortamı için ana uygulama widget'ı
/// Bu sınıf, development sırasında uygulamanın temel yapılandırmasını yönetir
class _MyApp extends StatelessWidget {
  // Router instance'ı - sayfa yönlendirmeleri için kullanılır
  static final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // Auto Route ile sayfa yönlendirme yapılandırması
      routerConfig: _router.config(),

      // Çoklu dil desteği yapılandırması
      localizationsDelegates: context.localizationDelegates, // Dil çevirileri için delegate'ler
      supportedLocales: context.supportedLocales, // Desteklenen diller
      locale: context.locale, // Mevcut dil ayarı
      // Responsive tasarım için custom builder
      builder: CustomResponsive.build,

      // Tema yapılandırması
      theme: CustomLightTheme().themeData, // Açık tema
      darkTheme: CustomDarkTheme().themeData, // Koyu tema
      themeMode: context.watch<ProductViewModel>().state.themeMode, // Dinamik tema modu
    );
  }
}
