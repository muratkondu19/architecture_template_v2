import 'package:architecture_template/feature/home/view/home_detail_view.dart';
import 'package:architecture_template/feature/home/view/widget/home_user_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';

/// Home widget'ları için unit test dosyası
/// Bu dosya, HomeUserList widget'ının UI davranışlarını test eder
/// FlutterTest paketi kullanılarak widget rendering ve etkileşimleri test edilir
/// Navigation ve widget state değişiklikleri burada doğrulanır
void main() {
  /// Test setup metodu - şu anda boş
  /// Gerekirse test öncesi hazırlık işlemleri burada yapılabilir
  setUp(() {});

  /// Home User List widget testi
  /// Bu test, HomeUserList widget'ının doğru render edildiğini ve
  /// navigation işlemlerinin çalıştığını doğrular
  testWidgets('Home User List Test', (tester) async {
    // Test için kullanılacak kullanıcı verileri
    // Her kullanıcı için farklı userId ve body değerleri
    final users = [
      const User(userId: 1, body: 'body 1'),
      const User(userId: 2, body: 'body 2'),
      const User(userId: 3, body: 'body 3'),
    ];

    // Test widget'ını MaterialApp içinde render et
    // Scaffold ile AppBar ve body yapısını oluştur
    // HomeUserList widget'ını test verileri ile initialize et
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            actions: [
              // AppBar'da navigation butonu ekle
              // Builder widget'ı ile context'e erişim sağla
              Builder(
                builder: (context) {
                  return IconButton(
                    onPressed: () {
                      // Kartal paketi ile navigation işlemi
                      // HomeDetailView sayfasına 'id' parametresi ile git
                      context.route.navigateToPage(const HomeDetailView(id: 'id'));
                    },
                    icon: const Icon(Icons.details), // Detay ikonu
                  );
                },
              ),
            ],
          ),
          body: HomeUserList(users: users), // Test edilecek ana widget
        ),
      ),
    );

    // Her kullanıcı için userId'nin ekranda göründüğünü kontrol et
    // Bu, HomeUserList widget'ının verileri doğru render ettiğini doğrular
    for (final item in users) {
      expect(find.text(item.userId.toString()), findsOneWidget);
    }

    // IconButton'a tıkla - navigation işlemini tetikle
    // Bu, AppBar'daki detay butonuna tıklama işlemini simüle eder
    await tester.tap(find.byType(IconButton));

    // Widget tree'nin güncellenmesini bekle
    // Navigation sonrası yeni sayfanın render edilmesi için gerekli
    await tester.pumpAndSettle();

    // HomeDetailView sayfasının açıldığını doğrula
    // Container widget'ının render edildiğini kontrol et
    // (HomeDetailView şu anda sadece Container döndürüyor)
    expect(find.byType(Container), findsWidgets);
  });
}
