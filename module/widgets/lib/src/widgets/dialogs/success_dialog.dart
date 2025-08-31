import 'package:flutter/material.dart';
import 'package:widgets/src/core/base_dialog.dart';

/// Başarı mesajı gösteren dialog sınıfı
/// Kullanıcıya işlem başarılı bilgisi verir ve onay bekler
final class SuccessDialog extends StatelessWidget {
  /// Dialog constructor'ı - başlık parametresi gerekli
  const SuccessDialog({required this.title, super.key});

  /// Dialog'un başlık metni (genellikle "Başarılı" veya benzeri)
  final String title;

  /// Statik show metodu - Dialog'u gösterir ve her zaman true döner
  ///
  /// Parametreler:
  /// - [title]: Dialog başlığı
  /// - [context]: BuildContext
  ///
  /// Dönüş: bool - Her zaman true (işlem başarılı)
  static Future<bool> show({
    required String title,
    required BuildContext context,
  }) async {
    // DialogBase.show metodunu kullanarak dialog'u gösterir
    // bool tipinde bir değer döner (her zaman true)
    await DialogBase.show<bool>(
      context: context,
      builder: (context) => SuccessDialog(title: title),
    );
    return true; // Başarı dialog'u her zaman true döner
  }

  @override
  Widget build(BuildContext context) {
    // Adaptive AlertDialog kullanarak platform uyumlu görünüm sağlar
    return AlertDialog.adaptive(
      title: Text(title), // Dialog başlığını gösterir
      actions: [
        // Onay butonu - check ikonu ile
        IconButton(
          onPressed: () {
            // Kullanıcı onayladığında dialog'u kapat ve true döner
            Navigator.of(context).pop(true);
          },
          icon: const Icon(Icons.check), // Onay ikonu
        ),
      ],
    );
  }
}
