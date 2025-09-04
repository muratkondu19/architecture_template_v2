import 'package:core/core.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';

/// User cache model sınıfı
/// Bu sınıf, User verilerini cache'de saklamak için kullanılır
/// CacheModel mixin'i ile cache işlemlerine uygun hale getirilir
/// Hive database ile JSON serialization/deserialization sağlar
final class UserCacheModel with CacheModel {
  /// Constructor - User objesi gereklidir
  /// @param user - Cache'lenecek User objesi
  UserCacheModel({required this.user});

  /// Empty constructor - Default boş User objesi ile initialize eder
  /// Cache sistem başlatılırken model yapısını tanımlamak için kullanılır
  UserCacheModel.empty() : user = const User();

  /// Cache'lenen User objesi
  /// Readonly olarak tanımlanır, copyWith() ile güncellenebilir
  final User user;

  /// JSON'dan UserCacheModel objesine dönüştürme metodu
  /// CacheModel interface'inden override edilir
  /// @param json - Dynamic JSON verisi
  /// @return - UserCacheModel instance'ı
  @override
  UserCacheModel fromDynamicJson(dynamic json) {
    // JSON'u Map<String, dynamic> tipine cast et
    final jsonMap = json as Map<String, dynamic>?;

    // Null kontrolü yap ve hata durumunda log'la
    if (jsonMap == null) {
      CustomLogger.showError<User>('Json cannot be null');
      return this; // Mevcut instance'ı döndür
    }

    // User.fromJson ile User objesi oluştur ve copyWith ile yeni model döndür
    return copyWith(
      user: User.fromJson(jsonMap),
    );
  }

  /// Cache model'ın unique ID'sini döndüren getter
  /// CacheModel interface'inden override edilir
  /// User'ın ID'si string olarak döndürülür
  @override
  String get id => user.id.toString();

  /// Model'ı JSON Map'e dönüştüren metod
  /// CacheModel interface'inden override edilir
  /// @return - User objesi JSON Map formatında
  @override
  Map<String, dynamic> toJson() {
    return user.toJson();
  }

  /// Model'ın kopyasını oluşturan metod
  /// Immutable yapı için kullanılır, sadece belirtilen fieldları günceller
  /// @param user - Yeni User objesi (opsiyonel)
  /// @return - Güncellenmiş UserCacheModel instance'ı
  UserCacheModel copyWith({
    User? user,
  }) {
    return UserCacheModel(
      user: user ?? this.user, // Null ise mevcut user'ı kullan
    );
  }
}
