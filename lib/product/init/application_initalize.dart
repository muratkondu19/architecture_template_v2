import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:easy_logger/easy_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/web.dart';

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

    ///FlutterError'ların loglanmasını sağlar.
    FlutterError.onError = (details) {
      Logger().e(details.exceptionAsString());
    };
  }
}
