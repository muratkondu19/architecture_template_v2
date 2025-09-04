import 'package:architecture_template/feature/home/view_model/state/home_state.dart';
import 'package:architecture_template/product/cache/model/user_cache_model.dart';
import 'package:architecture_template/product/service/interface/authentication_operation.dart';
import 'package:architecture_template/product/state/base/base_cubit.dart';
import 'package:architecture_template/product/state/container/product_state_items.dart';
import 'package:gen/gen.dart';

/// Home sayfası için ViewModel sınıfı
/// Bu sınıf, Home sayfasının business logic'ini yönetir
/// BaseCubit'den türetilir ve HomeState ile çalışır
class HomeViewModel extends BaseCubit<HomeState> {
  /// Constructor - authentication service dependency injection ile alınır
  /// @param authenticationOperation - Kullanıcı işlemleri için gerekli service
  HomeViewModel({required AuthenticationOperation authenticationOperation}) : super(const HomeState(isLoading: false)) {
    _authenticationOperation = authenticationOperation;
  }

  /// Private authentication service instance'ı
  late final AuthenticationOperation _authenticationOperation;

  /// Loading durumunu değiştiren metod
  /// @param isLoading - Yeni loading durumu, null ise mevcut durumu tersine çevirir
  Future<void> changeLoading({bool? isLoading}) async {
    emit(state.copyWith(isLoading: isLoading ?? !state.isLoading));
  }

  /// Kullanıcı listesini getiren metod
  /// Authentication service üzerinden kullanıcıları çeker ve state'i günceller
  Future<void> getUsers() async {
    // Service'den kullanıcı listesini al
    final users = await _authenticationOperation.users();
    // State'i yeni kullanıcı listesi ile güncelle
    emit(state.copyWith(users: users));

    _saveUsersToCache(users);
  }

  /// Kullanıcı listesini cache'e kaydeden private metod
  /// Her kullanıcı için UserCacheModel oluşturur ve cache'e ekler
  /// @param users - Cache'lenecek kullanıcı listesi
  void _saveUsersToCache(List<User> users) {
    // Her user için UserCacheModel oluştur ve cache'e ekle
    for (final user in users) {
      ProductStateItems.productCache.userCacheOperation.add(UserCacheModel(user: user));
    }
  }

  /// Cache'deki tüm kullanıcıları döndüren getter
  /// ProductStateItems.productCache üzerinden cache'deki UserCacheModel'ları alır
  /// Her UserCacheModel'dan user objesini çıkararak User listesi oluşturur
  /// @return - Cache'deki tüm User'ların listesi
  List<User> get users => ProductStateItems.productCache.userCacheOperation.getAll().map((e) => e.user).toList();
}
