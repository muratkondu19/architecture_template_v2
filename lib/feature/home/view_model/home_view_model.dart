import 'package:architecture_template/feature/home/view_model/state/home_state.dart';
import 'package:architecture_template/product/service/interface/authentication_operation.dart';
import 'package:architecture_template/product/state/base/base_cubit.dart';

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
  }
}
