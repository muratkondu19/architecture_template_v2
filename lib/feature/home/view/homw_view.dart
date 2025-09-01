import 'package:architecture_template/feature/home/view/mixin/home_view_mixin.dart';
import 'package:architecture_template/feature/home/view/widget/home_app_bar.dart';
import 'package:architecture_template/product/init/config/app_enviroment.dart';
import 'package:architecture_template/product/init/language/locale_keys.g.dart';
import 'package:architecture_template/product/init/product_localization.dart';
import 'package:architecture_template/product/navigation/app_router.dart';
import 'package:architecture_template/product/utility/constants/enums/locales.dart';
import 'package:architecture_template/product/widget/button/custom_login/custom_login_button.dart';
import 'package:architecture_template/product/widget/padding/project_padding.dart';
import 'package:architecture_template/product/widget/project_network_image.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:widgets/widgets.dart';

// Bu sayfa otomatik olarak route olarak tanımlanır
@RoutePage()
final class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

final class _HomeViewState extends State<HomeView> with HomeViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar() as PreferredSizeWidget,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Gen paketi üzerinden SVG icon kullanımı örneği
            // Assets.icons.iconDdCart.svg(package: 'gen') ile gen paketindeki icon'a erişim
            Container(
              padding: const ProjectPadding.allNormal(),
              child: Assets.icons.iconDdCart.svg(package: 'gen'),
            ),

            // AppEnvironmentItems.baseUrl.value ile environment değişkenine erişim örneği
            Text(AppEnvironmentItems.baseUrl.value, style: Theme.of(context).textTheme.titleMedium),

            // easy_localization paketi ile çoklu dil desteği örneği
            // LocaleKeys.home_change_language.tr() ile mevcut dilde metin gösterimi
            Text(LocaleKeys.home_change_language.tr()),

            // Dil değiştirme butonu örneği - İngilizce'ye geçiş
            ElevatedButton(
              onPressed: () {
                ProductLocalization.updateLocale(context: context, locale: Locales.en);
              },
              child: Text(LocaleKeys.general_language_en.tr()),
            ),

            // Dil değiştirme butonu örneği - Türkçe'ye geçiş
            ElevatedButton(
              onPressed: () {
                ProductLocalization.updateLocale(context: context, locale: Locales.tr);
              },
              child: Text(LocaleKeys.general_language_tr.tr()),
            ),

            // Auto Route ile sayfa yönlendirme örneği
            // context.router.push() ile HomeDetailRoute sayfasına parametre ile yönlendirme
            ElevatedButton(
              onPressed: () {
                context.router.push(HomeDetailRoute(id: '1'));
              },
              child: const Text('Home Detail'),
            ),

            // Kartal paketi ile uygulama versiyonu alma örneği
            // ''.ext.version ile mevcut uygulama versiyonuna erişim
            Text(''.ext.version),

            // Kartal paketi ile uygulama genelinde tanımlı text theme'e erişim örneği
            // context.general.textTheme.titleMedium ile global text theme kullanımı
            Text('Example', style: context.general.textTheme.titleMedium),

            // Kartal paketi ile text theme'i özelleştirme örneği
            // copyWith ile mevcut style'ı koruyarak sadece rengi değiştirme
            // '#fcb103'.ext.color ile hex string'i Color objesine çevirme
            Text('Example', style: context.general.textTheme.titleMedium!.copyWith(color: 'fcb103'.ext.color)),

            // Kartal paketi ile Future Builder kullanım örneği (şu anda yorum satırında)
            // Future<String>().ext.toBuild ile basitleştirilmiş future builder
            /*
          Future<String>().ext.toBuild(
            onSuccess: (data) => Text('data'),
            onError: (error) => Text('error'),
            loadingWidget: const Text('Loading...'),  
            notFoundWidget: const Text('Not Found'),
          ),
          */

            // Kartal paketi ile dynamic height hesaplama örneği
            // context.sized.dynamicHeight(0.1) ile ekran yüksekliğinin %10'u kadar yükseklik
            SizedBox(
              height: context.sized.dynamicHeight(0.1),
            ),

            // Özel network image widget kullanım örneği
            const ProjectNetworkImage(url: 'https://cdn-icons-png.flaticon.com/512/10278/10278187.png'),

            FloatingActionButton(
              onPressed: () {
                // Kartal paketi ile maps başlatma örneği (şu anda yorum satırında)
                // 'Kartal'.ext.launchMaps() ile harita uygulamasını başlatma
                'Kartal'.ext.launchMaps();

                // Kartal paketi ile link preview alma örneği (şu anda yorum satırında)
                // CustomLinkPreview.getLinkPreviewData() ile link önizleme verisi alma
                //CustomLinkPreview.getLinkPreviewData('https://www.google.com');

                // Test verisi oluşturma - 10 adet dummy user
                final dummyUsers = List<User?>.generate(10, (index) => User(name: 'User $index', money: index * 100));

                // Kartal paketi ile güvenli liste işlemleri örneği
                // where ile filtreleme ve exts.makeSafeCustom ile null safety
                final items = dummyUsers
                    .where((element) {
                      if (element?.money == null) {
                        return false;
                      }
                      return element!.money! > 100;
                    })
                    .exts
                    .makeSafeCustom((element) => element?.name?.isNotEmpty ?? false);
                //.makeSafe() ;

                // Kartal paketi ile liste index bulma örneği
                // items.ext.indexOrNull() ile koşula uyan ilk elemanın index'ini bulma
                items.ext.indexOrNull((item) => false);
              },
              child: const Icon(Icons.add),
            ),

            // Responsive tasarım için widget adaptasyon sınıfı
            // AdaptAllView ile farklı cihaz türleri için uygun widget'ları gösterir
            // phone, tablet ve desktop widget'ları farklı cihaz türleri için uygun widget'ları gösterir
            AdaptAllView(
              phone: Text(''.ext.version),
              tablet: Text(''.ext.version),
              desktop: Text(''.ext.version),
            ),

            // Dialoglar için örnekler
            // QuestionDialog ile kullanıcıdan metin girişi alma
            const QuestionDialog(title: 'Question Dialog'),
            // SuccessDialog ile başarı mesajı gösterme
            const SuccessDialog(title: 'Success Dialog'),

            // Custom Login Button için örnek
            CustomLoginButton(onOperation: () async => Future.delayed(const Duration(seconds: 2), () => true)),
          ],
        ),
      ),
    );
  }
}

// Test amaçlı User sınıfı - örnek veri yapısı
class User {
  User({this.name, this.money});
  final String? name;
  final double? money;
}
