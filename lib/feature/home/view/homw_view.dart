import 'package:architecture_template/feature/home/view/mixin/home_view_mixin.dart';
import 'package:architecture_template/feature/home/view/widget/home_app_bar.dart';
import 'package:architecture_template/feature/home/view/widget/home_user_list.dart';
import 'package:architecture_template/feature/home/view_model/home_view_model.dart';
import 'package:architecture_template/feature/home/view_model/state/home_state.dart';
import 'package:architecture_template/product/init/config/app_enviroment.dart';
import 'package:architecture_template/product/init/language/locale_keys.g.dart';
import 'package:architecture_template/product/init/product_localization.dart';
import 'package:architecture_template/product/navigation/app_router.dart';
import 'package:architecture_template/product/state/base/base_sate.dart';
import 'package:architecture_template/product/utility/constants/enums/locales.dart';
import 'package:architecture_template/product/widget/button/custom_login/custom_login_button.dart';
import 'package:architecture_template/product/widget/padding/project_padding.dart';
import 'package:architecture_template/product/widget/project_network_image.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

/// HomeView widget'ının state sınıfı
/// BaseState'den türetilir ve HomeViewMixin ile genişletilir
/// Bu sayede network yönetimi ve state işlemleri mixin üzerinden yapılır
final class _HomeViewState extends BaseState<HomeView> with HomeViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // HomeViewModel'i BlocProvider ile sağla
      // Bu sayede alt widget'lar HomeViewModel'e erişebilir
      create: (context) => homeViewModel,
      child: Scaffold(
        // Özel app bar widget'ı
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
              Text(
                AppEnvironmentItems.baseUrl.value,
                style: Theme.of(context).textTheme.titleMedium,
              ),

              // easy_localization paketi ile çoklu dil desteği örneği
              // LocaleKeys.home_change_language.tr() ile mevcut dilde metin gösterimi
              Text(LocaleKeys.home_change_language.tr()),

              // Dil değiştirme butonu örneği - İngilizce'ye geçiş
              ElevatedButton(
                onPressed: () {
                  ProductLocalization.updateLocale(
                    context: context,
                    locale: Locales.en,
                  );
                },
                child: Text(LocaleKeys.general_language_en.tr()),
              ),

              // Dil değiştirme butonu örneği - Türkçe'ye geçiş
              ElevatedButton(
                onPressed: () {
                  ProductLocalization.updateLocale(
                    context: context,
                    locale: Locales.tr,
                  );
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

              // Change Loading butonu örneği
              // context.read<HomeViewModel>().changeLoading(); ile loading durumunu değiştirme
              ElevatedButton(
                onPressed: homeViewModel.changeLoading,
                child: const Text('Change Loading'),
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
              Text(
                'Example',
                style: context.general.textTheme.titleMedium!.copyWith(
                  color: 'fcb103'.ext.color,
                ),
              ),

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
              const ProjectNetworkImage(
                url:
                    'https://cdn-icons-png.flaticon.com/512/10278/10278187.png',
              ),

              FloatingActionButton(
                onPressed: () {
                  // Kartal paketi ile maps başlatma örneği (şu anda yorum satırında)
                  // 'Kartal'.ext.launchMaps() ile harita uygulamasını başlatma
                  'Kartal'.ext.launchMaps();

                  // Kartal paketi ile link preview alma örneği (şu anda yorum satırında)
                  // CustomLinkPreview.getLinkPreviewData() ile link önizleme verisi alma
                  //CustomLinkPreview.getLinkPreviewData('https://www.google.com');

                  // Test verisi oluşturma - 10 adet dummy user
                  /* final dummyUsers = List<User?>.generate(
                    10,
                    (index) => User(id: index, title: 'User $index', body: 'User $index'),
                  );*/

                  // Kartal paketi ile güvenli liste işlemleri örneği
                  // where ile filtreleme ve exts.makeSafeCustom ile null safety
                  /* final items = dummyUsers
                      .where((element) {
                        if (element?.body == null) {
                          return false;
                        }
                        return element!.body!.length > 100;
                      })
                      .exts
                      .makeSafeCustom((element) => element?.title?.isNotEmpty ?? false);
                  //.makeSafe() ;
*
                  // Kartal paketi ile liste index bulma örneği
                  // items.ext.indexOrNull() ile koşula uyan ilk elemanın index'ini bulma
                  items.ext.indexOrNull((item) => false);
                  */
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
              CustomLoginButton(
                onOperation: () async =>
                    Future.delayed(const Duration(seconds: 2), () => true),
              ),

              ElevatedButton(
                onPressed: () {
                  productViewModel.changeThemeMode(ThemeMode.dark);
                },
                child: const Text('Change Theme Mode'),
              ),

              const _UserBlockList(),
            ],
          ),
        ),
      ),
    );
  }
}

/// Kullanıcı listesi widget'ı
/// Bu widget, HomeViewModel'den gelen kullanıcı verilerini listeler
/// BlocListener ile state değişikliklerini dinler ve BlocSelector ile sadece users listesini dinler
class _UserBlockList extends StatelessWidget {
  const _UserBlockList();

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeViewModel, HomeState>(
      // State değişikliklerini dinle ve debug print yap
      listener: (context, state) {
        debugPrint(state.users?.toString());
      },
      child: BlocSelector<HomeViewModel, HomeState, List<User>>(
        // Sadece users listesini seç ve dinle
        // Bu sayede gereksiz rebuild'ler önlenir
        selector: (state) {
          return state.users ?? [];
        },
        builder: (context, state) {
          // Eğer kullanıcı listesi boşsa "No users" mesajı göster
          if (state.isEmpty) {
            return const Center(child: Text('No users'));
          }
          // Kullanıcı listesini ListView.builder ile oluştur
          return HomeUserList(users: state);
        },
      ),
    );
  }
}
