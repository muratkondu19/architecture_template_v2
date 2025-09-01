import 'package:architecture_template/product/widget/button/general_button.dart';
import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

/// Dialog gösterimi için özel tasarlanmış buton widget'ı
/// Bu buton tıklandığında bir başarı dialog'u gösterir
/// Dialog'dan dönen sonucu callback fonksiyon aracılığıyla parent widget'a iletir
class DialogNormalButton extends StatelessWidget {
  /// DialogNormalButton constructor'ı
  /// [onComplete] parametresi: Dialog tamamlandığında çalışacak callback
  /// Bu callback bool değer alır (dialog'dan dönen sonuç)
  const DialogNormalButton({required this.onComplete, super.key});

  /// Dialog işlemi tamamlandığında çalışan callback fonksiyon
  /// bool parametresi dialog'ın başarılı olup olmadığını belirtir
  final ValueChanged<bool> onComplete;

  @override
  Widget build(BuildContext context) {
    // GeneralButton widget'ını kullanarak butonu oluşturuyoruz
    return GeneralButton(
      title: 'Dialog Normal Button', // Buton üzerinde görünecek metin
      onPressed: () async {
        // Buton tıklandığında asynchronous işlem başlat

        // SuccessDialog'u göster ve kullanıcı yanıtını bekle
        final response = await SuccessDialog.show(
          title: 'title', // Dialog başlığı
          context: context, // Dialog gösterim context'i
        );

        // Dialog'dan dönen sonucu parent widget'a callback ile ilet
        onComplete.call(response);
      },
    );
  }
}
