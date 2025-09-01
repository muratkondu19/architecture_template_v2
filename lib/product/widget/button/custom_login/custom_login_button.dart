import 'package:architecture_template/product/widget/button/general_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

// Mixin dosyasını bu dosyanın bir parçası olarak dahil ediyoruz
part 'custom_login_button_mixin.dart';

/// Özel login butonu widget'ı
/// Bu buton asynchronous bir işlem gerçekleştirir ve loading durumunu yönetir
/// İşlem tamamlandığında başarılı olması durumunda sayfayı kapatır
final class CustomLoginButton extends StatefulWidget {
  /// CustomLoginButton constructor'ı
  /// [onOperation] parametresi: Login işlemini gerçekleştirecek asynchronous fonksiyon
  /// Bu fonksiyon bool değer döndürmelidir (başarılı/başarısız)
  const CustomLoginButton({required this.onOperation, super.key});

  /// Login işlemini gerçekleştiren asynchronous callback fonksiyon
  /// Döndürdüğü bool değer işlemin başarılı olup olmadığını belirtir
  final AsyncValueGetter<bool> onOperation;

  @override
  State<CustomLoginButton> createState() => _CustomLoginButtonState();
}

/// CustomLoginButton widget'ının state sınıfı
/// MountedMixin: Widget'ın hala mount edilip edilmediğini kontrol etmek için
/// _CustomLoginButtonMixin: Login buton işlevselliğini sağlayan mixin
class _CustomLoginButtonState extends State<CustomLoginButton> with MountedMixin, _CustomLoginButtonMixin {
  @override
  Widget build(BuildContext context) {
    // Loading durumunu dinleyen ValueListenableBuilder
    return ValueListenableBuilder<bool>(
      valueListenable: _isLoadingNotifier, // Loading durumunu takip eden notifier
      builder: (BuildContext context, bool value, Widget? child) {
        // Eğer loading durumundaysa boş bir SizedBox döndür (butonu gizle)
        if (value) return const SizedBox();

        // Loading durumunda değilse GeneralButton'ı göster
        return GeneralButton(
          title: 'Login', // Buton üzerinde görünecek metin
          onPressed: () async {
            // Buton tıklandığında login işlemini başlat
            await _onPressed(context);
          },
        );
      },
    );
  }
}
