import 'package:architecture_template/product/state/base/base_cubit.dart';
import 'package:architecture_template/product/state/view_model/product_state.dart';
import 'package:flutter/material.dart';

/// Global product view model sınıfı
/// Bu sınıf, uygulama genelinde kullanılan state işlemlerini yönetir
/// BaseCubit'den türetilir ve ProductState ile çalışır
final class ProductViewModel extends BaseCubit<ProductState> {
  /// Constructor - varsayılan ProductState ile başlatır
  /// Singleton pattern ile kullanılır
  ProductViewModel() : super(const ProductState());

  /// Tema modunu değiştiren metod
  /// Bu metod, uygulamanın tema modunu değiştirir
  /// @param themeMode - Yeni tema modu (ThemeMode.light veya ThemeMode.dark)
  void changeThemeMode(ThemeMode themeMode) {
    // Mevcut state'i kopyala ve yeni tema modu ile güncelle
    emit(state.copyWith(themeMode: themeMode));
  }
}
