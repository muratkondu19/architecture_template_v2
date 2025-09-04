// example/integration_test/example_test.dart
import 'package:architecture_template/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

/// Home sayfası için integration test dosyası
/// Bu dosya, uygulamanın tam olarak çalışır durumda test edilmesini sağlar
/// Patrol paketi kullanılarak widget etkileşimleri test edilir
/// End-to-end test senaryoları burada tanımlanır
void main() {
  /// Ana integration test - Home sayfası ve FloatingActionButton testi
  /// Bu test, uygulamanın başlatılmasından widget etkileşimlerine kadar
  /// tüm süreci gerçek cihaz/simülatörde test eder
  patrolTest(
    'Open home page and press button',
    ($) async {
      // Uygulamayı başlat - main() fonksiyonunu çağır
      // Bu, gerçek uygulama başlatma sürecini simüle eder
      app.main();

      // Widget tree'nin tamamen yüklenmesini bekle
      // pumpAndSettle() tüm animasyonların ve async işlemlerin tamamlanmasını sağlar
      await $.pumpAndSettle();

      // FloatingActionButton'ı bul ve tıkla
      // Bu, home sayfasındaki ana etkileşim noktasını test eder
      await $(FloatingActionButton).tap();

      // Button tıklaması sonrası widget tree'nin güncellenmesini bekle
      // Yeni widget'ların render edilmesi için gerekli
      await $.pumpAndSettle();

      // '1' text'ini içeren widget'ın görünür olmasını bekle
      // Bu, button tıklaması sonrası beklenen UI değişikliğini doğrular
      await $('1').waitUntilVisible();

      // Scrollable widget'ı bul ve Text içerdiğini kontrol et
      // Bu, liste veya scroll edilebilir içeriğin varlığını doğrular
      $(Scrollable).containing(Text);

      // 'q' text'ini içeren widget'ların bulunduğunu doğrula
      // Bu, beklenen içeriğin UI'da render edildiğini kontrol eder
      expect($('q'), findsWidgets);
    },
  );
}
