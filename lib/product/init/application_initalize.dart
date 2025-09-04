import 'dart:async';

import 'package:architecture_template/product/init/config/app_enviroment.dart';
import 'package:architecture_template/product/state/container/product_state_container.dart';
import 'package:architecture_template/product/state/container/product_state_items.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_logger/easy_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kartal/kartal.dart';
import 'package:logger/logger.dart';

@immutable
///Uygulama başlatıldığında ilk çalıştırılacak sın ıf.
final class ApplicationInitalize {
  ///Singleton pattern için kullanılır.
  //Uygulama genelinde tek bir instance oluşturulur.
  //const ApplicationInitalize._();

  /// Uygulama başlatma işlemlerini güvenli bir şekilde çalıştırır
  /// runZonedGuarded kullanarak hata yakalama ve loglama sağlar
  ///
  /// Bu metod:
  /// - _initialize metodunu güvenli bir zone içinde çalıştırır
  /// - Oluşan hataları yakalar ve Logger ile kaydeder
  /// - Uygulama çökmesini engelleyerek stabilite sağlar
  ///
  /// Kullanım: await ApplicationInitalize().init();
  Future<void> init() async {
    //Zone içerisinde başlatmaya izin vermdiği için araya giriyoruz.
    WidgetsFlutterBinding.ensureInitialized();

    // runZonedGuarded ile hata yakalama ve loglama
    // _initialize metodunu güvenli bir zone içinde çalıştırır
    await runZonedGuarded<Future<void>>(_initialize, (error, stack) {
      // Yakalanan hataları Logger ile error seviyesinde kaydet
      Logger().e(error.toString());
    });
  }

  ///Uygulama başlatıldığında ilk çalıştırılacak fonksiyon.
  static Future<void> _initialize() async {
    await EasyLocalization.ensureInitialized();

    ///EasyLogger'ın loglarının error'dan başka loglarını  görünmesini engeller.
    EasyLocalization.logger.enableLevels = [LevelMessages.error];

    ///Uygulamanın yatay modda çalışmasını engeller.
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    ///Kartal paketi ile uygulama bilgileri alınıyor.
    await DeviceUtility.instance.initPackageInfo();

    ///FlutterError'ların loglanmasını sağlar.
    FlutterError.onError = (details) {
      Logger().e(details.exceptionAsString());
    };

    ///AppEnvironment'ın genel başlatılması
    AppEnvironment.general();

    ///ProductStateContainer'ın başlatılması
    ProductStateContainer.setup();

    ///ProductCache'ın başlatılması
    await ProductStateItems.productCache.init();
  }
}
