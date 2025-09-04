import 'package:architecture_template/feature/home/view_model/home_view_model.dart';
import 'package:architecture_template/feature/home/view_model/state/home_state.dart';
import 'package:architecture_template/product/init/language/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Home sayfası için özel AppBar widget'ı
/// Bu widget, sayfa başlığını ve loading indicator'ını gösterir
/// PreferredSizeWidget interface'ini implement eder
final class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // Çoklu dil desteği ile sayfa başlığı
      title: Text(LocaleKeys.home_title.tr()),
      actions: const [
        // Loading durumunu gösteren widget
        _Loading(),
      ],
    );
  }

  // AppBar'ın boyutunu belirle
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

/// Loading durumunu gösteren widget
/// Bu widget, HomeViewModel'den gelen loading state'ini dinler
/// Loading true ise CircularProgressIndicator gösterir, false ise boş widget gösterir
class _Loading extends StatelessWidget {
  const _Loading();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewModel, HomeState>(
      builder: (context, state) {
        // Eğer loading durumu true ise progress indicator göster
        if (state.isLoading) {
          return const CircularProgressIndicator.adaptive();
        }
        // Loading false ise boş widget döndür
        return const SizedBox.shrink();
      },
    );
  }
}
