import 'package:flutter/material.dart';
import 'package:widgets/src/core/base_dialog.dart';

/// Kullanıcı soru-cevap verisi için model sınıfı
/// Dialog'dan dönen cevap bilgisini saklar
final class QuestionAnswer {
  /// Constructor - Cevap metni ile QuestionAnswer oluşturur
  QuestionAnswer({required this.response});

  /// Kullanıcının verdiği cevap metni
  final String response;
}

/// Kullanıcıdan metin girişi alan soru dialog'u
/// TextField ile kullanıcıdan bilgi alır ve QuestionAnswer döner
final class QuestionDialog extends StatefulWidget {
  /// Dialog constructor'ı - başlık parametresi gerekli
  const QuestionDialog({required this.title, super.key});

  /// Dialog'un başlık metni
  final String title;

  /// Statik show metodu - Dialog'u gösterir ve QuestionAnswer döner
  ///
  /// Parametreler:
  /// - [title]: Dialog başlığı
  /// - [context]: BuildContext
  ///
  /// Dönüş: QuestionAnswer? - Kullanıcının cevabı veya null
  static Future<QuestionAnswer?> show({
    required String title,
    required BuildContext context,
  }) async {
    // DialogBase.show metodunu kullanarak dialog'u gösterir
    // QuestionAnswer tipinde bir değer döner
    return DialogBase.show<QuestionAnswer>(
      context: context,
      builder: (context) => QuestionDialog(title: title),
    );
  }

  @override
  State<QuestionDialog> createState() => _QuestionDialogState();
}

/// QuestionDialog'ın state sınıfı
/// Kullanıcı girişini yönetir ve UI'ı oluşturur
class _QuestionDialogState extends State<QuestionDialog> {
  /// Kullanıcının girdiği cevap metni
  String _response = '';

  @override
  Widget build(BuildContext context) {
    // Adaptive AlertDialog kullanarak platform uyumlu görünüm sağlar
    return AlertDialog.adaptive(
      title: Text(widget.title), // Dialog başlığını gösterir
      content: TextField(
        // Kullanıcı metin girişi yapar
        onChanged: (value) => _response = value, // Girilen değeri _response'a kaydeder
      ),
      actions: [
        // Onay butonu - check ikonu ile
        IconButton(
          onPressed: () {
            // Eğer cevap boşsa, dialog'u kapat (null döner)
            if (_response.isEmpty) Navigator.of(context).pop();

            // Cevap varsa, QuestionAnswer ile dialog'u kapat
            Navigator.of(context).pop(QuestionAnswer(response: _response));
          },
          icon: const Icon(Icons.check), // Onay ikonu
        ),
      ],
    );
  }
}
