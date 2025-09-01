// Bu dosya custom_login_button.dart dosyasının bir parçasıdır
part of 'custom_login_button.dart';

/// Custom login button için işlevsellik sağlayan mixin
/// Bu mixin loading durumunu yönetir ve button tıklama işlemlerini handle eder
/// MountedMixin ve State sınıfları ile birlikte kullanılmalıdır
mixin _CustomLoginButtonMixin on MountedMixin<CustomLoginButton>, State<CustomLoginButton> {
  /// Loading durumunu takip eden ValueNotifier
  /// true: İşlem devam ediyor, false: İşlem tamamlandı veya henüz başlamadı
  final ValueNotifier<bool> _isLoadingNotifier = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    // Widget ilk oluşturulduğunda loading durumunu false olarak ayarla
    _isLoadingNotifier.value = false;
  }

  @override
  void dispose() {
    super.dispose();
    // Widget dispose edildiğinde memory leak'i önlemek için notifier'ı temizle
    // Not: ValueNotifier'ın dispose metodu burada çağrılabilir
  }

  /// Buton tıklandığında çalışan asynchronous fonksiyon
  /// [context] parametresi: Navigation işlemleri için gerekli BuildContext
  Future<void> _onPressed(BuildContext context) async {
    // Loading durumunu true yap (butonu gizle)
    _isLoadingNotifier.value = true;

    // Widget'tan gelen onOperation callback'ini çalıştır
    final response = await widget.onOperation.call();

    // Güvenli işlem: Widget hala mount edilmişse işlemleri gerçekleştir
    await safeOperation(() async {
      // Eğer işlem başarılı olduysa (response = true), sayfayı kapat
      if (response) Navigator.of(context).pop();

      // Loading durumunu false yap (butonu tekrar göster)
      _isLoadingNotifier.value = false;
    });
  }
}
