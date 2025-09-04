import 'package:equatable/equatable.dart';
import 'package:gen/gen.dart';

/// Home sayfası için state sınıfı
/// Bu sınıf, Home sayfasının state bilgilerini tutar
/// Equatable'dan türetilir ve state karşılaştırmaları için kullanılır
final class HomeState extends Equatable {
  /// Constructor - loading durumu zorunlu, kullanıcı listesi opsiyonel
  /// @param isLoading - Loading durumu (zorunlu)
  /// @param users - Kullanıcı listesi (opsiyonel, varsayılan boş liste)
  const HomeState({required this.isLoading, this.users = const []});

  /// Loading durumu - API isteği devam ediyor mu?
  final bool isLoading;

  /// Kullanıcı listesi - API'den gelen kullanıcı verileri
  final List<User>? users;

  /// Equatable için props listesi
  /// Sadece isLoading değişikliklerini takip eder
  /// users değişiklikleri ayrıca kontrol edilir
  @override
  List<Object?> get props => [isLoading];

  /// State'i kopyalama metodu
  /// Immutable state pattern için kullanılır
  /// @param isLoading - Yeni loading durumu (null ise mevcut değer korunur)
  /// @param users - Yeni kullanıcı listesi (null ise mevcut değer korunur)
  /// @return - Yeni HomeState instance'ı
  HomeState copyWith({bool? isLoading, List<User>? users}) {
    return HomeState(isLoading: isLoading ?? this.isLoading, users: users ?? this.users);
  }
}
